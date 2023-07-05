import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:floor/floor.dart';

@DatabaseView('''
  WITH last_refill AS ( 
      SELECT * FROM (
            SELECT patientId, date, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId 
            ORDER BY date DESC) rn FROM refill
      ) r WHERE rn = 1
  )
  SELECT siteCode, givenName, familyName, hospitalNo, sex, dateOfBirth, date, 
    dateNextRefill FROM last_refill JOIN patient ON patientId = id ORDER BY givenName, familyName
''', viewName: 'LastRefill')
class LastRefill {
  final String siteCode;
  final String givenName;
  final String familyName;
  final String sex;
  final DateTime dateOfBirth;
  final DateTime date;
  final DateTime dateNextRefill;
  final String hospitalNo;

  LastRefill(this.siteCode, this.givenName, this.familyName, this.sex,
      this.dateOfBirth, this.date, this.dateNextRefill, this.hospitalNo);
}

@dao
abstract class PatientDao {
  @Query('''
      SELECT * FROM Patient WHERE (outletCode = :activationCode OR facilityCode = 
        :activationCode) AND serviceDiscontinued = 0 AND (LOWER(givenName) LIKE 
        LOWER(:keyword) OR LOWER(familyName) LIKE LOWER(:keyword) OR 
        LOWER(hospitalNo) LIKE LOWER(:keyword)) ORDER BY givenName, 
      familyName LIMIT 10
      ''')
  Future<List<Patient>> findByKeyword(String activationCode, String keyword);

  @Query(
      'SELECT * FROM Patient where siteCode = :siteCode and serviceDiscontinued = 1')
  Future<List<Patient>> findDiscontinued(String siteCode);

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

  @Query('SELECT * FROM Patient WHERE synced = false')
  Future<List<Patient>> findUnSynced();

  @Query(
      '''SELECT * FROM LastRefill WHERE siteCode = :siteCode AND dateNextRefill 
        BETWEEN :start AND :end''')
  Future<List<LastRefill>> listMissedRefill(
      String siteCode, DateTime start, DateTime end);

  @Query('''Update Patient set serviceDiscontinued = true, dateDiscontinued = 
      :dateDiscontinued, reasonDiscontinued = :reasonDiscontinued where id = :id''')
  Future<void> discontinueService(
      int id, DateTime dateDiscontinued, String reasonDiscontinued);

  @Query("delete from Patient where id = :id")
  Future<void> deleteById(int id);
}

@DatabaseView('''
WITH Estimated AS (
	SELECT * FROM (
		SELECT quantityDispensed, regimen, dateNextRefill, patientId, outletCode,
		  facilityCode, ROW_NUMBER() OVER(PARTITION BY patientId ORDER BY dateNextRefill DESC) rn 
		FROM Refill JOIN Patient p ON patientId = p.uuid	
	) e WHERE rn = 1
)
SELECT regimen, outletCode, facilityCode, SUM(quantityDispensed) qty, dateNextRefill 
  FROM Estimated GROUP BY regimen, outletCode, facilityCode, dateNextRefill
''', viewName: 'EstimatedRefill')
class EstimatedRefill {
  final String outletCode;
  final String facilityCode;
  final String regimen;
  final int qty;
  final DateTime dateNextRefill;

  EstimatedRefill(this.outletCode, this.facilityCode, this.regimen, this.qty,
      this.dateNextRefill);
}

@DatabaseView('''
  SELECT givenName, familyName, sex, dateOfBirth, quantityDispensed quantity, 
    hospitalNo, regimen, outletCode, facilityCode dateNextRefill, date FROM Refill 
    JOIN Patient p ON patientId = p.uuid ORDER BY givenName, familyName, sex    
''', viewName: 'RefillInfo')
class RefillInfo {
  final String outletCode;
  final String facilityCode;
  final String familyName;
  final String givenName;
  final int quantity;
  final DateTime date;
  final DateTime dateNextRefill;
  final DateTime dateOfBirth;
  final String regimen;
  final String sex;
  final String hospitalNo;

  RefillInfo(
      this.outletCode,
      this.facilityCode,
      this.familyName,
      this.givenName,
      this.quantity,
      this.date,
      this.dateNextRefill,
      this.dateOfBirth,
      this.regimen,
      this.sex,
      this.hospitalNo);
}

@dao
abstract class RefillDao {
  @Query('SELECT * FROM Refill')
  Future<List<Refill>> findAll();

  @Query('SELECT * FROM Refill WHERE id = :id')
  Stream<Refill?> findById(int id);

  @Query('SELECT * FROM Refill WHERE synced = false')
  Future<List<Refill>> findUnSynced();

  @Query('SELECT * FROM Refill WHERE patientId = :patientId')
  Future<List<Refill>> findByPatient(String patientId);

  @Query('SELECT * FROM Refill WHERE patientId = :patientId AND date = :date')
  Future<List<Refill>> findByPatientAndDate(String patientId, DateTime date);

  @insert
  Future<void> insertRecord(Refill refill);

  @update
  Future<int> updateRecord(Refill refill);

  @Query("delete from Refill where id = :id")
  Future<void> deleteById(int id);

  @Query('''SELECT regimen, siteCode, SUM(qty) qty, 1 AS dateNextRefill FROM 
          EstimatedRefill WHERE siteCode = :siteCode AND dateNextRefill BETWEEN 
          :start and :end GROUP BY regimen ORDER BY regimen, siteCode''')
  Future<List<EstimatedRefill>> estimatedRefill(
      String siteCode, DateTime start, DateTime end);

  @Query(
      '''SELECT * FROM RefillInfo WHERE siteCode = :siteCode AND date BETWEEN 
        :start and :end ORDER BY givenName, familyName''')
  Future<List<RefillInfo>> listRefillInfo(
      String siteCode, DateTime start, DateTime end);
}

@dao
abstract class ClinicDao {
  @Query('SELECT * FROM Clinic')
  Future<List<Clinic>> findAll();

  @Query('SELECT * FROM Clinic WHERE synced = false')
  Future<List<Clinic>> findUnSynced();

  @Query('SELECT * FROM Clinic WHERE id = :id')
  Stream<Clinic?> findById(int id);

  @Query('SELECT * FROM Clinic WHERE patientId = :patientId')
  Future<List<Clinic>> findByPatient(String patientId);

  @insert
  Future<void> insertRecord(Clinic clinic);

  @Query("delete from Clinic where id = :id")
  Future<void> deleteById(int id);
}
