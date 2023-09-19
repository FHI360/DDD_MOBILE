import 'package:DDD/app_state.dart';
import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:DDD/backend/drift/database.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../main.dart';
import 'api.dart';

class SyncService {
  Future<bool?> _syncRecords() async {
    List<PatientData> patients = await PatientDao(database).findUnSynced();
    List<DispenseData> dispenses = await DispenseDao(database).findUnSynced();
    List<ClinicData> clinic = await ClinicDao(database).findUnSynced();
    List<DevolveData> devolves = await DevolveDao(database).findUnSynced();
    List<ViralLoadData> viralLoads =
        await ViralLoadDao(database).findUnSynced();

    final Map<String, dynamic> payload = new Map<String, dynamic>();
    payload['patients'] = patients.map((e) {
      var p = e.toJson();
      p['id'] = p['uuid'];
      p['clinicStage'] = p['lastClinicStage'];
      p['organisation'] = {'id': p['facilityCode']};
      p['archived'] = p['deleted'];
      p['dateOfBirth'] = e.dateOfBirth.toIso8601String().substring(0, 10);
      p['dateStarted'] = e.dateStarted != null
          ? e.dateStarted!.toIso8601String().substring(0, 10)
          : null;
      return p;
    }).toList();
    payload['dispenses'] = dispenses.map((d) {
      var p = d.toJson();
      p['id'] = p['uuid'];
      p['patient'] = {'id': p['patientId']};
      p['organisation'] = {'id': FFAppState().activationCode};
      p['date'] = d.date.toIso8601String().substring(0, 10);
      p['dateNextRefill'] = d.dateNextRefill.toIso8601String().substring(0, 10);
      return p;
    }).toList();
    payload['clinics'] = clinic.map((c) {
      var p = c.toJson();
      p['id'] = p['uuid'];
      p['patient'] = {'id': p['patientId']};
      p['organisation'] = {'id': FFAppState().activationCode};
      p['date'] = c.date.toIso8601String().substring(0, 10);
      return p;
    }).toList();
    payload['devolves'] = devolves.map((d) {
      var p = d.toJson();
      p['id'] = p['uuid'];
      p['patient'] = {'id': p['patientId']};
      p['organisation'] = {'id': p['outletCode']};
      p['date'] = d.date.toIso8601String();
      return p;
    }).toList();
    payload['viralLoads'] = viralLoads.map((v) {
      var p = v.toJson();
      p['id'] = p['uuid'];
      p['patient'] = {'id': p['patientId']};
      p['date'] = v.date.toIso8601String().substring(0, 10);
      p['nextAppointment'] =
          v.nextAppointment.toIso8601String().substring(0, 10);
      return p;
    }).toList();

    final response = await api.post(
      '${FFAppState().baseUrl}/api/ddd/sync',
      data: payload,
    );

    if (response.data == true) {
      await PatientDao(database).updateAllSynced();
      await DispenseDao(database).updateAllSynced();
      await ClinicDao(database).updateAllSynced();
      await DevolveDao(database).updateAllSynced();
      await ViralLoadDao(database).updateAllSynced();

      return true;
    }
    return false;
  }

  Future<bool> processSync() async {
    var hasData = await PatientDao(database).hasUnSynced();
    if (!(hasData ?? false)) {
      hasData = await DispenseDao(database).hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await ClinicDao(database).hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await DevolveDao(database).hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await ViralLoadDao(database).hasUnSynced();
    }
    if (hasData ?? false) {
      try {
        final response = await _syncRecords();
        if (response != null && response) {
          showToast(
            'PAGES.SYNCHRONIZATION.SYNC_SUCCESS'.tr(),
            duration: Duration(seconds: 10),
            position: ToastPosition.bottom,
            backgroundColor: Colors.green,
            radius: 3.0,
            textStyle: TextStyle(fontSize: 15.0),
          );
        } else {
          showToast(
            'PAGES.SYNCHRONIZATION.SYNC_ERROR'.tr(),
            duration: Duration(seconds: 10),
            position: ToastPosition.bottom,
            backgroundColor: Colors.red,
            radius: 3.0,
            textStyle: TextStyle(fontSize: 15.0),
          );

          return false;
        }
      } catch (e) {
        if (e.toString().contains('Connection refused')) {
          showToast(
            'CONNECTION_ERROR'.tr(),
            duration: Duration(seconds: 10),
            position: ToastPosition.bottom,
            backgroundColor: Colors.red,
            radius: 3.0,
            textStyle: TextStyle(fontSize: 15.0),
          );
        }
        return false;
      }
    }

    return true;
  }
}
