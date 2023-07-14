import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:floor/floor.dart';

@DatabaseView('''
  WITH last_Dispense AS ( 
      SELECT * FROM (
            SELECT patientId, date, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId 
            ORDER BY date DESC) rn FROM Dispense
      ) r WHERE rn = 1
  )
  SELECT outletCode, facilityCode, givenName, familyName, hospitalNo, sex, dateOfBirth, date, 
    dateNextRefill FROM last_Dispense JOIN patient p ON patientId = p.uuid ORDER BY givenName, familyName
''', viewName: 'LastDispense')
class LastDispense {
  final String? outletCode;
  final String facilityCode;
  final String givenName;
  final String familyName;
  final String sex;
  final DateTime dateOfBirth;
  final DateTime date;
  final DateTime dateNextRefill;
  final String hospitalNo;

  LastDispense(
      this.outletCode,
      this.facilityCode,
      this.givenName,
      this.familyName,
      this.sex,
      this.dateOfBirth,
      this.date,
      this.dateNextRefill,
      this.hospitalNo);
}

@dao
abstract class PatientDao {
  @Query('''
      SELECT * FROM Patient WHERE (outletCode = :activationCode OR facilityCode = 
        :activationCode) AND (LOWER(givenName) LIKE 
        LOWER(:keyword) OR LOWER(familyName) LIKE LOWER(:keyword) OR 
        LOWER(hospitalNo) LIKE LOWER(:keyword)) ORDER BY givenName, 
      familyName LIMIT 10
      ''')
  Future<List<Patient>> findByKeyword(String activationCode, String keyword);

  @Query('SELECT * FROM Patient WHERE id = :id')
  Future<Patient?> findById(int id);

  @Query('SELECT * FROM Patient WHERE uniqueId = :uniqueId')
  Future<Patient?> findByUniqueId(String uniqueId);

  @insert
  Future<int> insertRecord(Patient patient);

  @update
  Future<void> updateRecord(Patient patient);

  @Query("UPDATE Patient SET synced = true WHERE id = :id")
  Future<void> updateSynced(int id);

  @Query('SELECT * FROM Patient WHERE synced = 0')
  Future<List<Patient>> findUnSynced();

  @Query('SELECT COUNT(*) > 0 FROM Patient WHERE synced = 0')
  Future<bool?> hasUnSynced();

  @Query('''
      SELECT * FROM LastDispense WHERE (outletCode = :code OR facilityCode = :code)
        AND dateNextRefill BETWEEN :start AND :end''')
  Future<List<LastDispense>> listMissedDispense(
      String code, DateTime start, DateTime end);

  @Query("DELETE FROM Patient")
  Future<void> deleteAll();
}

@DatabaseView('''
  SELECT givenName, familyName, sex, dateOfBirth, medications, 
    hospitalNo, outletCode, facilityCode, dateNextRefill, date FROM Dispense 
    JOIN Patient p ON patientId = p.uuid ORDER BY givenName, familyName, sex    
''', viewName: 'DispenseInfo')
class DispenseInfo {
  final String? outletCode;
  final String facilityCode;
  final String familyName;
  final String givenName;
  final List<Medication> medications;
  final DateTime date;
  final DateTime dateNextRefill;
  final DateTime dateOfBirth;
  final String sex;
  final String hospitalNo;

  DispenseInfo(
      this.outletCode,
      this.facilityCode,
      this.familyName,
      this.givenName,
      this.medications,
      this.date,
      this.dateNextRefill,
      this.dateOfBirth,
      this.sex,
      this.hospitalNo);
}

@dao
abstract class DispenseDao {
  @Query('SELECT * FROM Dispense')
  Future<List<Dispense>> findAll();

  @Query('SELECT * FROM Dispense WHERE id = :id')
  Stream<Dispense?> findById(int id);

  @Query('SELECT * FROM Dispense WHERE synced = 0')
  Future<List<Dispense>> findUnSynced();

  @Query('SELECT * FROM Dispense WHERE patientId = :patientId ORDER BY date DESC')
  Future<List<Dispense>> findByPatient(String patientId);

  @Query('SELECT * FROM Dispense WHERE patientId = :patientId AND date = :date')
  Future<List<Dispense>> findByPatientAndDate(String patientId, DateTime date);

  @insert
  Future<void> insertRecord(Dispense dispense);

  @update
  Future<int> updateRecord(Dispense dispense);

  @Query('''
      SELECT * FROM DispenseInfo WHERE (outletCode = :code OR facilityCode = :code)
        AND date BETWEEN :start AND :end ORDER BY givenName, familyName
        ''')
  Future<List<DispenseInfo>> listDispenseInfo(
      String code, DateTime start, DateTime end);

  @Query("DELETE FROM Dispense")
  Future<void> deleteAll();

  @Query('SELECT COUNT(*) > 0 FROM Dispense WHERE synced = false')
  Future<bool?> hasUnSynced();
}

@dao
abstract class ClinicDao {
  @Query('SELECT * FROM Clinic')
  Future<List<Clinic>> findAll();

  @Query('SELECT * FROM Clinic WHERE synced = 0')
  Future<List<Clinic>> findUnSynced();

  @Query('SELECT * FROM Clinic WHERE id = :id')
  Stream<Clinic?> findById(int id);

  @Query('SELECT * FROM Clinic WHERE patientId = :patientId')
  Future<List<Clinic>> findByPatient(String patientId);

  @insert
  Future<void> insertRecord(Clinic clinic);

  @Query("DELETE FROM Clinic")
  Future<void> deleteAll();

  @Query('SELECT COUNT(*) > 0 FROM Clinic WHERE synced = false')
  Future<bool?> hasUnSynced();
}

@dao
abstract class DevolveDao {
  @Query('SELECT * FROM Devolve WHERE synced = 0')
  Future<List<Devolve>> findUnSynced();

  @Query('SELECT * FROM Devolve WHERE patientId = :patientId ORDER BY date DESC LIMIT 1')
  Future<Devolve?> findByPatient(String patientId);

  @insert
  Future<void> insertRecord(Devolve devolve);

  @Query("DELETE FROM Devolve")
  Future<void> deleteAll();

  @Query('SELECT COUNT(*) > 0 FROM Devolve WHERE synced = false')
  Future<bool?> hasUnSynced();
}

@dao
abstract class FacilityDao {
  @Query('SELECT * FROM Facility')
  Future<List<Facility>> findAll();

  @Query('SELECT * FROM Facility WHERE id = :id')
  Stream<Facility?> findById(int id);

  @insert
  Future<void> insertRecord(Facility facility);

  @update
  Future<void> updateRecord(Facility facility);

  @Query("DELETE FROM Facility")
  Future<void> deleteAll();
}

@dao
abstract class OutletDao {
  @Query('SELECT * FROM Outlet')
  Future<List<Outlet>> findAll();

  @Query('SELECT * FROM Outlet WHERE id = :id')
  Stream<Outlet?> findById(int id);

  @insert
  Future<void> insertRecord(Outlet outlet);

  @update
  Future<void> updateRecord(Outlet outlet);

  @Query("DELETE FROM Outlet")
  Future<void> deleteAll();
}

@dao
abstract class RegimenDao {
  @Query('SELECT * FROM Regimen')
  Future<List<Regimen>> findAll();

  @Query('SELECT * FROM Regimen WHERE id = :id')
  Stream<Regimen?> findById(int id);

  @insert
  Future<void> insertRecord(Regimen regimen);

  @Query("DELETE FROM Regimen")
  Future<void> deleteAll();
}
