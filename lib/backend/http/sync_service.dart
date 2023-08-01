import 'package:DDD/app_state.dart';
import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../main.dart';
import 'api.dart';

class SyncService {
  Future<bool?> _syncRecords() async {
    final _database = await database;
    List<Patient> patients = await _database.patientDao.findUnSynced();
    List<Dispense> dispenses = await _database.dispenseDao.findUnSynced();
    List<Clinic> clinic = await _database.clinicDao.findUnSynced();
    List<Devolve> devolves = await _database.devolveDao.findUnSynced();
    List<ViralLoad> viralLoads = await _database.viralLoadDao.findUnSynced();

    final Map<String, dynamic> payload = new Map<String, dynamic>();
    payload['patients'] = patients.map((e) => e.toJson()).toList();
    payload['dispenses'] = dispenses.map((d) => d.toJson()).toList();
    payload['clinics'] = clinic.map((c) => c.toJson()).toList();
    payload['devolves'] = devolves.map((d) => d.toJson()).toList();
    payload['viralLoads'] = viralLoads.map((v) => v.toJson()).toList();

    final response = await api.post(
      '${FFAppState().baseUrl}/api/ddd/sync',
      data: payload,
    );

    await _database.patientDao.updateAllSynced();
    await _database.dispenseDao.updateAllSynced();
    await _database.clinicDao.updateAllSynced();
    await _database.devolveDao.updateAllSynced();
    await _database.viralLoadDao.updateAllSynced();

    return response.data;
  }

  Future<bool> processSync() async {
    final _database = await database;
    var hasData = await _database.patientDao.hasUnSynced();
    if (!(hasData ?? false)) {
      hasData = await _database.dispenseDao.hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await _database.clinicDao.hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await _database.devolveDao.hasUnSynced();
    }
    if (!(hasData ?? false)) {
      hasData = await _database.viralLoadDao.hasUnSynced();
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
