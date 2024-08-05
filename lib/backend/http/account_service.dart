import 'dart:convert';

import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/backend/drift/entities.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:DDD/main.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'api.dart';

class AccountService {
  Future<void> processAccount() async {
    final response =
        await api.get('${FFAppState().baseUrl}/api/ddd/data-services');
    final data = await response.data;
    final patients = data['patients'];
    await PatientDao(database).deleteAll();
    int id = 1;
    patients.forEach((p) async {
      p['uuid'] = p['id'];
      p['id'] = id++;
      p['synced'] = true;
      p['deleted'] = false;
      p['lastViralLoad'] = p['viralLoad'];
      p['nextAppointmentDate'] = p['nextRefillDate'];
      p['givenName'] = p['givenName'] ?? '';
      p['familyName'] = p['familyName'] ?? '';
      p['lastClinicStage'] = p['clinicStage'];
      await PatientDao(database).insertRecord(PatientData.fromJson(p));
    });

    await FacilityDao(database).deleteAll();
    final facilities = data['facilities'];
    facilities.forEach((f) async {
      f['code'] = f['id'];
      f['id'] = id++;
      await FacilityDao(database).insertRecord(FacilityData.fromJson(f));
    });

    await OutletDao(database).deleteAll();
    final outlets = data['outlets'];
    outlets.forEach((o) async {
      o['code'] = o['id'];
      o['id'] = id++;
      await OutletDao(database).insertRecord(OutletData.fromJson(o));
    });

    final regimens = data['regimens'];
    await RegimenDao(database).deleteAll();
    regimens.forEach((r) async {
      r['id'] = id++;
      r['regimenType'] = r['type']['name'];
      await RegimenDao(database).insertRecord(RegimenData.fromJson(r));
    });

    final dispenses = data['dispenses'];
    await DispenseDao(database).deleteAll();
    dispenses.forEach((r) async {
      r['uuid'] = r['id'];
      r['id'] = id++;
      r['synced'] = true;

      List<Medication> medications = [];
      r['medications'].forEach((e) {
        var medication = Medication.fromJson(e);
        medications.add(medication);
      });
      var dispense = DispenseData(
          id: r['id'],
          date: DateTime.parse(r['date']),
          patientId: r['patientId'],
          dateNextRefill: DateTime.parse(r['dateNextRefill']),
          medications: medications,
          synced: r['synced'],
          missedDoses: r['missedDoses'] ?? false,
          adverseIssues: r['adverseIssues'] ?? false,
          uuid: r['uuid']);
      await DispenseDao(database).insertRecord(dispense);
    });

    final devolves = data['devolves'];
    await DevolveDao(database).deleteAll();
    devolves.forEach((r) async {
      r['uuid'] = r['id'];
      r['id'] = id++;
      r['synced'] = true;
      r['outletCode'] = r['outlet'];
      await DevolveDao(database).insertRecord(DevolveData.fromJson(r));
    });

    final clinic = data['clinics'];
    await ClinicDao(database).deleteAll();
    clinic.forEach((r) async {
      r['uuid'] = r['id'];
      r['id'] = id++;
      r['synced'] = true;
      await ClinicDao(database).insertRecord(ClinicData.fromJson(r));
    });

    final viralLoads = data['viralLoads'];
    await ViralLoadDao(database).deleteAll();
    viralLoads.forEach((r) async {
      r['uuid'] = r['id'];
      r['id'] = id++;
      r['synced'] = true;
      await ViralLoadDao(database).insertRecord(ViralLoadData.fromJson(r));
    });

    showToast(
      'Data from server successfully processed',
      duration: Duration(seconds: 10),
      position: ToastPosition.bottom,
      backgroundColor: Colors.green,
      radius: 3.0,
      textStyle: TextStyle(fontSize: 15.0),
    );
  }
}
