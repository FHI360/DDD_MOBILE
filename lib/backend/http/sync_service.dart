import 'package:DDD/app_state.dart';
import 'package:DDD/backend/floor/entities/entities.dart';
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

    final Map<String, dynamic> payload = new Map<String, dynamic>();
    payload['patients'] = patients.map((e) => e.toJson()).toList();
    payload['dispenses'] = dispenses.map((d) => d.toJson()).toList();
    payload['clinics'] = clinic.map((c) => c.toJson()).toList();
    payload['devolves'] = devolves.map((d) => d.toJson()).toList();

    final response = await api.post(
      '${FFAppState().baseUrl}/api/ddd/sync',
      data: payload,
    );
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
    if (hasData ?? false) {
      final response = await _syncRecords();
      if (response != null && response) {
        showToast(
          'Records synchronized successfully',
          duration: Duration(seconds: 10),
          position: ToastPosition.bottom,
          backgroundColor: Colors.green,
          radius: 3.0,
          textStyle: TextStyle(fontSize: 15.0),
        );
      } else {
        showToast(
          'There was problem synchronizing data, please sign out and sign in again',
          duration: Duration(seconds: 10),
          position: ToastPosition.bottom,
          backgroundColor: Colors.red,
          radius: 3.0,
          textStyle: TextStyle(fontSize: 15.0),
        );

        return false;
      }
    }

    return true;
  }
}
