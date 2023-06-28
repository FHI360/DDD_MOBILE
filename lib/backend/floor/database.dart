import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters.dart';
import 'dao/dao.dart';
import 'entities/entities.dart';

part 'database.g.dart';

@TypeConverters([
  DateTimeConverter,
  DeclinationReasonsConverter,
  From6WeeksConverter,
  From10WeeksConverter,
  From14WeeksConverter,
  FromBirthConverter,
  From15MonthsConverter,
  From12MonthsConverter,
  From9MonthsConverter,
  From6MonthsConverter,
  From9YearsConverter,
  LatLngConverter,
  ListVaccinationEventsConverter,
  ListVaccinesConverter,
  ListStockEntryConverter,
  MedicalConditionsConverter,
  StockEntryConverter,
  StockStateConverter
])
@Database(version: 9, entities: [
  Account,
  AEFI,
  CovidVaccination,
  DCT,
  Declination,
  RoutineVaccination,
  Stock,
  Summary
], views: [
  CovidVaccinationView,
  PictureView
])
abstract class AppDatabase extends FloorDatabase {
  CovidVaccinationDao get covidVaccinationDao;

  StockDao get stockDao;

  DCTDao get dctDao;

  RoutineVaccinationDao get routineVaccinationDao;

  DeclinationDao get declinationDao;

  AccountDao get accountDao;

  AefiDao get aefiDao;

  SummaryDao get summaryDao;
}
