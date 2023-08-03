import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:floor/floor.dart';

class Disaggregate {
  final String data;
  final int value;

  Disaggregate(this.data, this.value);
}

@DatabaseView('''
WITH Data AS ( 
      SELECT * FROM (
            SELECT patientId, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId 
            ORDER BY date DESC) rn FROM Dispense
      ) r WHERE rn = 1
  ),
Appointment AS (
	SELECT sex, strftime('%Y', 'now') - strftime('%Y', datetime(dateOfBirth/1000, 'unixepoch')) - 
		(strftime('%m-%d', 'now') < strftime('%m-%d', datetime(dateOfBirth/1000, 'unixepoch'))) AS age, 
		dateNextRefill date, outletCode, facilityCode FROM Data JOIN patient p ON patientId = p.uuid
)
SELECT * FROM Appointment
''', viewName: 'Appointment')
class Appointment {
  final String sex;
  final int age;
  final DateTime date;
  final String outletCode;
  final String facilityCode;
  final String data;

  Appointment(this.sex, this.age, this.date, this.outletCode, this.facilityCode,
      this.data);
}

@DatabaseView('''
WITH Data AS ( 
      SELECT * FROM (
            SELECT patientId, date, ROW_NUMBER() OVER (PARTITION BY patientId 
            ORDER BY date DESC) rn FROM Dispense
      ) r WHERE rn = 1
  ),
Refill AS (
	SELECT sex, strftime('%Y', 'now') - strftime('%Y', datetime(dateOfBirth/1000, 'unixepoch')) - 
		(strftime('%m-%d', 'now') < strftime('%m-%d', datetime(dateOfBirth/1000, 'unixepoch'))) AS age, 
		date, outletCode, facilityCode FROM Data JOIN patient p ON patientId = p.uuid
)
SELECT * FROM Refill
''', viewName: 'Refill')
class Refill {
  final String sex;
  final int age;
  final DateTime date;
  final String outletCode;
  final String facilityCode;
  final String data;

  Refill(this.sex, this.age, this.date, this.outletCode, this.facilityCode,
      this.data);
}

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
        LOWER(uniqueId) LIKE LOWER(:keyword) OR  
        LOWER(phone) LIKE LOWER(:keyword) OR 
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

  @Query("UPDATE Patient SET synced = 1")
  Future<void> updateAllSynced();

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

/*@Query('''
    WITH DISS AS (
	    SELECT CASE
		            WHEN age < 15 AND sex = 'Female' THEN'fu'
		            WHEN age < 15 AND sex = 'Male' THEN 'mu'
		            ELSE 'ov'
	            END data, outletCode, facilityCode, date FROM Appointment
	  )
    SELECT data, COUNT(*) value FROM DISS WHERE (facilityCode = :code OR
      outletCode = :code) AND date BETWEEN :start AND :end GROUP BY 1
  ''')
  Future<List<Appointment>> missingAppointments(
      String code, DateTime start, DateTime end);*/
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

  @Query(
      'SELECT * FROM Dispense WHERE patientId = :patientId ORDER BY date DESC')
  Future<List<Dispense>> findByPatient(String patientId);

  @Query('SELECT * FROM Dispense WHERE patientId = :patientId AND date = :date ORDER BY date DESC LIMIT 1')
  Future<Dispense?> findByPatientAndDate(String patientId, DateTime date);

  @Query('SELECT * FROM Dispense WHERE patientId = :patientId ORDER BY date DESC LIMIT 1')
  Future<Dispense?> findLatestByPatient(String patientId);

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

  @Query('SELECT COUNT(*) > 0 FROM Dispense WHERE synced= 0')
  Future<bool?> hasUnSynced();

  @Query("UPDATE Dispense SET synced = 1")
  Future<void> updateAllSynced();
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

  @Query('SELECT COUNT(*) > 0 FROM Clinic WHERE synced= 0')
  Future<bool?> hasUnSynced();

  @Query("UPDATE Clinic SET synced = 1")
  Future<void> updateAllSynced();
}

@dao
abstract class DevolveDao {
  @Query('SELECT * FROM Devolve WHERE synced = 0')
  Future<List<Devolve>> findUnSynced();

  @Query(
      'SELECT * FROM Devolve WHERE patientId = :patientId ORDER BY date DESC LIMIT 1')
  Future<Devolve?> findByPatient(String patientId);

  @insert
  Future<void> insertRecord(Devolve devolve);

  @Query("DELETE FROM Devolve")
  Future<void> deleteAll();

  @Query('SELECT COUNT(*) > 0 FROM Devolve WHERE synced= 0')
  Future<bool?> hasUnSynced();

  @Query("UPDATE Devolve SET synced = 1")
  Future<void> updateAllSynced();
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

@dao
abstract class ViralLoadDao {
  @Query('SELECT * FROM ViralLoad')
  Future<List<ViralLoad>> findAll();

  @Query('SELECT * FROM ViralLoad WHERE id = :id')
  Stream<ViralLoad?> findById(int id);

  @Query('SELECT * FROM ViralLoad WHERE synced = 0')
  Future<List<ViralLoad>> findUnSynced();

  @Query(
      'SELECT * FROM ViralLoad WHERE patientId = :patientId ORDER BY date DESC')
  Future<List<ViralLoad>> findByPatient(String patientId);

  @Query(
      'SELECT * FROM ViralLoad WHERE patientId = :patientId AND date = :date')
  Future<List<ViralLoad>> findByPatientAndDate(String patientId, DateTime date);

  @insert
  Future<void> insertRecord(ViralLoad vialLoad);

  @update
  Future<int> updateRecord(ViralLoad vialLoad);

  @Query("DELETE FROM ViralLoad")
  Future<void> deleteAll();

  @Query('SELECT COUNT(*) > 0 FROM ViralLoad WHERE synced= 0')
  Future<bool?> hasUnSynced();

  @Query("UPDATE ViralLoad SET synced = 1")
  Future<void> updateAllSynced();
}
