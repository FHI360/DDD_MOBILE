import 'package:floor/floor.dart';

import '../entities/entities.dart';

@DatabaseView(
    'SELECT vaccinationNo, picture FROM CovidVaccination WHERE givenName IS NOT NULL AND synced = 0',
    viewName: 'PictureView')
class PictureView {
  final String? vaccinationNo;
  final String? picture;

  PictureView(this.vaccinationNo, this.picture);
}

@DatabaseView(
    '''SELECT date, familyName, givenName, sex, dateOfBirth, dobEstimated, vaccinationNo,
      uniqueId, pregnancyStatus, email, state, lga, address, phone, latLng, occupation,
      occupationType, idType, idNumber, qrCode, historyOfAllergy, medicalConditions,
      levelOfEducation, team, events, synced FROM CovidVaccination WHERE givenName IS NOT NULL
      AND state IS NOT NULL AND lga IS NOT NULL AND team IS NOT NULL AND synced = 0''',
    viewName: 'CovidVaccinationView')
class CovidVaccinationView {
  final DateTime date;
  final String familyName;
  final String givenName;
  final String sex;
  final DateTime dateOfBirth;
  final bool? dobEstimated;
  final String vaccinationNo;
  final String? uniqueId;
  final String? pregnancyStatus;
  final String? email;
  final String? state;
  final String? lga;
  final String? address;
  final String? phone;
  final LatLng latLng;
  final String? occupation;
  final String? occupationType;
  final String? idType;
  final String? idNumber;
  final String? qrCode;
  final bool? historyOfAllergy;
  final MedicalConditions medicalConditions;
  final String? levelOfEducation;
  final String? team;
  final List<VaccinationEvent> events;
  final bool synced;

  CovidVaccinationView(
      this.date,
      this.familyName,
      this.givenName,
      this.sex,
      this.dateOfBirth,
      this.dobEstimated,
      this.vaccinationNo,
      this.uniqueId,
      this.pregnancyStatus,
      this.email,
      this.state,
      this.lga,
      this.address,
      this.phone,
      this.latLng,
      this.occupation,
      this.occupationType,
      this.idType,
      this.idNumber,
      this.qrCode,
      this.historyOfAllergy,
      this.medicalConditions,
      this.levelOfEducation,
      this.team,
      this.events,
      this.synced);

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data = [];
    events.forEach((e) => data.add(e.toJson()));
    return {
      'familyName': familyName,
      'givenName': givenName,
      'sex': sex,
      'dateOfBirth': dateOfBirth.toIso8601String().substring(0, 10),
      'vaccinationNo': vaccinationNo,
      'state': state,
      'lga': lga,
      'team': team,
      'address': address,
      'qrCode': qrCode,
      'dobEstimated': dobEstimated,
      'pregnancyStatus': pregnancyStatus,
      'email': email,
      'phone': phone,
      'latLng': latLng.toJson(),
      'idType': idType,
      'idNumber': idNumber,
      'occupation': occupation,
      'occupationType': occupationType,
      'historyOfAllergy': historyOfAllergy,
      'levelOfEducation': levelOfEducation,
      'medicalConditions': medicalConditions.conditions,
      'events': data
    };
  }
}

@dao
abstract class AccountDao {
  @Query('SELECT * FROM Account LIMIT 1')
  Future<Account?> getAccount();

  @Query('SELECT * FROM Account')
  Future<List<Account>> getAccounts();

  @insert
  Future<int> insertAccount(Account account);

  @update
  Future<void> updateAccount(Account account);

  @Query("DELETE FROM Account")
  Future<void> deleteAccount();
}

@dao
abstract class AefiDao {
  @Query('SELECT * FROM AEFI LIMIT 5 OFFSET :offset')
  Future<List<AEFI>> findAll(int offset);

  @Query(
      '''SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM AEFI''')
  Future<int?> numberPages();

  @Query('SELECT * FROM AEFI WHERE id = :id')
  Future<AEFI?> findById(int id);

  @insert
  Future<int> insertRecord(AEFI aefi);

  @Query('''SELECT * FROM AEFI WHERE LOWER(vaccinationNo) like LOWER(:keyword)) 
      LIMIT 5''')
  Future<List<AEFI>> findByKeyword(String keyword);

  @update
  Future<void> updateRecord(AEFI aefi);

  @Query("DELETE FROM AEFI WHERE id = :id")
  Future<void> deleteById(int id);

  @Query('SELECT * FROM AEFI')
  Future<List<AEFI>> findUnSynced();

  @Query('UPDATE AEFI SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM AEFI WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}

@dao
abstract class CovidVaccinationDao {
  @Query(
      'SELECT * FROM CovidVaccination WHERE givenName IS NOT NULL LIMIT 5 OFFSET :offset')
  Future<List<CovidVaccination>> findAll(int offset);

  @Query(
      '''SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM CovidVaccination''')
  Future<int?> numberPages();

  @Query(
      'SELECT * FROM CovidVaccination WHERE givenName IS NOT NULL AND synced = 0 LIMIT 1 OFFSET :offset')
  Future<List<CovidVaccination>> findUnSynced(int offset);

  @Query('SELECT * FROM CovidVaccination WHERE id = :id')
  Future<CovidVaccination?> findById(int id);

  @Query('SELECT * FROM CovidVaccination WHERE qrCode = :qrCode')
  Future<CovidVaccination?> findByQrCode(String qrCode);

  @Query('SELECT * FROM CovidVaccination WHERE vaccinationNo = :vaccinationNo')
  Future<List<CovidVaccination>> findByVaccinationNo(String vaccinationNo);

  @Query(
      '''SELECT * FROM CovidVaccination WHERE (LOWER(givenName) LIKE LOWER(:keyword) 
      OR LOWER(familyName) LIKE LOWER(:keyword) OR LOWER(vaccinationNo) like LOWER(:keyword)) 
      AND givenName IS NOT NULL ORDER BY givenName, familyName LIMIT 5 ''')
  Future<List<CovidVaccination>> findByKeyword(String keyword);

  @insert
  Future<int> insertRecord(CovidVaccination vaccination);

  @update
  Future<void> updateRecord(CovidVaccination vaccination);

  @Query("DELETE FROM CovidVaccination WHERE id = :id")
  Future<void> deleteById(int id);

  @Query('UPDATE CovidVaccination SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('UPDATE CovidVaccination SET synced = 1 WHERE vaccinationNo = :vaccinationNo')
  Future<void> recordRecordSynced(String vaccinationNo);

  @Query('DELETE FROM CovidVaccination WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);

  @Query('SELECT * FROM CovidVaccination WHERE date >= :date')
  Future<List<CovidVaccination>> getVaccinations(DateTime date);

  @Query('SELECT * FROM CovidVaccinationView')
  Future<List<CovidVaccinationView>> getVaccinationView();

  @Query('SELECT * FROM PictureView WHERE vaccinationNo = :vaccinationNo')
  Future<PictureView?> getPictureView(String vaccinationNo);

  @Query('SELECT * FROM PictureView LIMIT 5 OFFSET :offset')
  Future<List<PictureView>> getPictureViewList(int offset);

  @Query(
      '''SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM PictureView''')
  Future<int?> picturePages();
}

@dao
abstract class RoutineVaccinationDao {
  @Query(
      'SELECT * FROM RoutineVaccination WHERE givenName IS NOT NULL LIMIT 5 OFFSET :offset')
  Future<List<RoutineVaccination>> findAll(int offset);

  @Query(
      '''SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM RoutineVaccination''')
  Future<int?> numberPages();

  @Query(
      'SELECT * FROM RoutineVaccination WHERE givenName IS NOT NULL AND synced = 0')
  Future<List<RoutineVaccination>> findUnSynced();

  @Query('SELECT * FROM RoutineVaccination WHERE id = :id')
  Future<RoutineVaccination?> findById(int id);

  @Query(
      'SELECT * FROM RoutineVaccination WHERE vaccinationNo = :vaccinationNo')
  Future<List<RoutineVaccination>> findByVaccinationNo(String vaccinationNo);

  @Query(
      '''SELECT * FROM RoutineVaccination WHERE (LOWER(givenName) LIKE LOWER(:keyword) 
      OR LOWER(familyName) LIKE LOWER(:keyword) OR LOWER(vaccinationNo) like LOWER(:keyword)) 
      AND givenName IS NOT NULL ORDER BY givenName, familyName LIMIT 5 OFFSET ''')
  Future<List<RoutineVaccination>> findByKeyword(String keyword);

  @insert
  Future<int> insertRecord(RoutineVaccination vaccination);

  @update
  Future<void> updateRecord(RoutineVaccination vaccination);

  @Query("DELETE FROM RoutineVaccination WHERE id = :id")
  Future<void> deleteById(int id);

  @Query('UPDATE RoutineVaccination SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM RoutineVaccination WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}

@dao
abstract class StockDao {
  @Query(
      'SELECT * FROM Stock WHERE state = :state AND lga = :lga AND team = :team ORDER BY DATE DESC LIMIT 20')
  Future<List<Stock>> findAll(String state, String lga, String team);

  @Query(
      'SELECT * FROM Stock WHERE state = :state AND lga = :lga AND team = :team ORDER BY date DESC LIMIT 1')
  Future<List<Stock>> getLatest(String state, String lga, String team);

  @Query('SELECT * FROM Stock')
  Future<List<Stock>> findUnSynced();

  @Query('SELECT * FROM Stock WHERE id = :id')
  Future<Stock?> findById(int id);

  @Query('SELECT * FROM Stock WHERE team = :team AND date = :date LIMIT 1')
  Future<Stock?> findByTeamAndDate(String team, DateTime date);

  @insert
  Future<void> insertRecord(Stock stock);

  @update
  Future<void> updateRecord(Stock stock);

  @Query("DELETE FROM Stock WHERE id = :id")
  Future<void> deleteById(int id);

  @Query('UPDATE Stock SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM Stock WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}

@dao
abstract class DCTDao {
  @Query('SELECT * FROM DCT WHERE team = :team ORDER BY date DESC')
  Future<List<DCT>> findAll(String team);

  @Query('SELECT * FROM DCT')
  Future<List<DCT>> findUnSynced();

  @Query('SELECT * FROM DCT WHERE id = :id')
  Stream<DCT?> findById(int id);

  @Query('SELECT * FROM DCT WHERE team = :team AND date = :date')
  Future<List<DCT>> findByTeamAndDate(String team, DateTime date);

  @insert
  Future<void> insertRecord(DCT stock);

  @update
  Future<void> updateRecord(DCT stock);

  @Query("DELETE FROM DCT WHERE id = :id")
  Future<void> deleteById(int id);

  @Query('UPDATE DCT SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM DCT WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}

@dao
abstract class DeclinationDao {
  @Query('SELECT * FROM Declination')
  Future<List<Declination>> findUnSynced();

  @insert
  Future<int> insertRecord(Declination declination);

  @Query('UPDATE Declination SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM Declination WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}

@dao
abstract class SummaryDao {
  @Query('SELECT * FROM Summary')
  Future<List<Summary>> findUnSynced();

  @Query('''
      SELECT * FROM Summary WHERE state = :state AND lga = :lga AND team = :team 
      AND date = :date ORDER BY date DESC LIMIT 1
      ''')
  Future<Summary?> getCurrent(
      String state, String lga, String team, DateTime date);

  @Query('''
      SELECT * FROM Summary WHERE state = :state AND lga = :lga AND team = :team 
      ORDER BY date DESC LIMIT 1
      ''')
  Future<Summary?> getLatest(String state, String lga, String team);

  @insert
  Future<int> insertRecord(Summary summary);

  @update
  Future<void> updateRecord(Summary summary);

  @Query('UPDATE Summary SET synced = 1 WHERE synced = 0')
  Future<void> recordSynced();

  @Query('DELETE FROM Summary WHERE synced = 1 AND date < :date')
  Future<void> clearRecordsOlderThan(DateTime date);
}
