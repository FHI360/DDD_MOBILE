import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';

import 'converters.dart';
import 'dao/dao.dart';
import 'entities/entities.dart';

part 'database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(
    version: 9,
    entities: [ClinicData, Refill, Patient],
    views: [EstimatedRefill, LastRefill, RefillInfo])
abstract class AppDatabase extends FloorDatabase {
  ClinicDao get clinicDao;

  RefillDao get refillDao;

  PatientDao get patientDao;
}
