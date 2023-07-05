import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters.dart';
import 'dao/dao.dart';
import 'entities/entities.dart';

part 'database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(
    version: 9,
    entities: [Clinic, Facility, Outlet, Patient, Regimen, Refill],
    views: [EstimatedRefill, LastRefill, RefillInfo])
abstract class AppDatabase extends FloorDatabase {
  ClinicDao get clinicDao;

  RefillDao get refillDao;

  PatientDao get patientDao;

  RegimenDao get regimenDao;

  OutletDao get outletDao;

  FacilityDao get facilityDao;
}
