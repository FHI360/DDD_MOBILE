import 'dart:async';
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters.dart';
import 'dao/dao.dart';
import 'entities/entities.dart';

part 'database.g.dart';

class ListMedicationConverter extends TypeConverter<List<Medication>, String> {
  @override
  List<Medication> decode(String databaseValue) {
    final value = json.decode(databaseValue);
    List<Medication> medications = [];
    medications = List.from(value).map((e) => Medication.fromJson(e)).toList();

    return medications;
  }

  @override
  String encode(List<Medication> value) {
    final List<Map<String, dynamic>> data = [];
    value.forEach((e) => data.add(e.toJson()));

    return json.encode(data);
  }
}

@TypeConverters([DateTimeConverter, ListMedicationConverter])
@Database(
    version: 9,
    entities: [Clinic, Facility, Outlet, Patient, Regimen, Dispense],
    views: [LastDispense, DispenseInfo])
abstract class AppDatabase extends FloorDatabase {
  ClinicDao get clinicDao;

  DispenseDao get dispenseDao;

  PatientDao get patientDao;

  RegimenDao get regimenDao;

  OutletDao get outletDao;

  FacilityDao get facilityDao;
}
