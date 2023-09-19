import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/backend/drift/entities.dart';
import 'package:drift/drift.dart';

part 'dao.g.dart';

class Disaggregate {
  final String data;
  final int value;

  Disaggregate(this.data, this.value);
}

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

@DriftAccessor(tables: [Clinic])
class ClinicDao extends DatabaseAccessor<Database> with _$ClinicDaoMixin {
  ClinicDao(Database db) : super(db);

  Future<ClinicData?> findById(int id) {
    return (select(clinic)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<ClinicData?> findByPatientAndDate(String patient, DateTime date) {
    return (select(clinic)
          ..where(
              (tbl) => tbl.patientId.equals(patient) & tbl.date.equals(date)))
        .getSingleOrNull();
  }

  Future<List<ClinicData>> findUnSynced() {
    return (select(clinic)..where((tbl) => tbl.synced.equals(false))).get();
  }

  Future<bool?> hasUnSynced() {
    final count = clinic.id
        .count(filter: clinic.synced.equals(false))
        .isBiggerThanValue(0);

    final query = db.selectOnly(clinic)..addColumns([count]);

    return query.map((row) => row.read(count)).getSingle();
  }

  Future<int> insertRecord(ClinicData data) {
    return into(clinic).insert(data);
  }

  Future updateRecord(ClinicData data) {
    return update(clinic).replace(data);
  }

  updateAllSynced() async {
    return customUpdate('''UPDATE Clinic SET synced = true''');
  }

  deleteAll() async {
    return await delete(clinic).go();
  }
}

@DriftAccessor(tables: [Devolve])
class DevolveDao extends DatabaseAccessor<Database> with _$DevolveDaoMixin {
  DevolveDao(Database db) : super(db);

  Future<List<DevolveData>> findUnSynced() {
    return (select(devolve)..where((tbl) => tbl.synced.equals(false))).get();
  }

  Future<bool?> hasUnSynced() {
    final count = devolve.id
        .count(filter: devolve.synced.equals(false))
        .isBiggerThanValue(0);

    final query = db.selectOnly(devolve)..addColumns([count]);

    return query.map((row) => row.read(count)).getSingle();
  }

  Future<DevolveData?> findByPatient(String patientId) {
    return (select(devolve)
          ..where((tbl) => tbl.patientId.equals(patientId))
          ..orderBy([(d) => OrderingTerm.desc(d.date)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertRecord(DevolveData data) {
    return into(devolve).insert(data);
  }

  Future updateRecord(DevolveData data) {
    return update(devolve).replace(data);
  }

  updateAllSynced() async {
    return customUpdate('''UPDATE Devolve SET synced = true''');
  }

  deleteAll() async {
    return await delete(devolve).go();
  }

  Future<DevolveData?> findById(int id) {
    return (select(devolve)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}

@DriftAccessor(tables: [Dispense])
class DispenseDao extends DatabaseAccessor<Database> with _$DispenseDaoMixin {
  DispenseDao(Database db) : super(db);

  Future<DispenseData?> findById(int id) {
    return (select(dispense)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<DispenseData>> findUnSynced() {
    return (select(dispense)..where((tbl) => tbl.synced.equals(false))).get();
  }

  Future<bool?> hasUnSynced() {
    final count = dispense.id
        .count(filter: dispense.synced.equals(false))
        .isBiggerThanValue(0);

    final query = db.selectOnly(dispense)..addColumns([count]);

    return query.map((row) => row.read(count)).getSingle();
  }

  Future<int> insertRecord(DispenseData data) {
    return into(dispense).insert(data);
  }

  Future updateRecord(DispenseData data) async {
    return await update(dispense).replace(data);
  }

  updateAllSynced() async {
    return customUpdate('''UPDATE Dispense SET synced = true''');
  }

  deleteAll() async {
    return await delete(dispense).go();
  }

  Future<List<DispenseData>> findByPatient(String patientId) {
    return (select(dispense)
          ..where((tbl) => tbl.patientId.equals(patientId))
          ..orderBy([(d) => OrderingTerm.desc(d.date)]))
        .get();
  }

  Future<DispenseData?> findByPatientAndDate(String patientId, DateTime date) {
    return (select(dispense)
          ..where((tbl) => tbl.patientId.equals(patientId))
          ..where((tbl) => tbl.date.equals(date))
          ..orderBy([(d) => OrderingTerm.desc(d.date)]))
        .getSingleOrNull();
  }

  Future<DispenseData?> findLatestByPatient(String patientId) {
    return (select(dispense)
          ..where((tbl) => tbl.patientId.equals(patientId))
          ..orderBy([(d) => OrderingTerm.desc(d.date)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<DispenseInfo>> listDispenseInfo(
      String code, DateTime start, DateTime end) async {
    final rows = await customSelect('''
        WITH DispenseInfo as (
          SELECT givenName, familyName, sex, dateOfBirth, medications, 
            hospitalNo, outletCode, facilityCode, dateNextRefill, date FROM Dispense 
          JOIN Patient p ON patientId = p.uuid ORDER BY givenName, familyName, sex
        ) 
        SELECT * FROM DispenseInfo WHERE (outletCode = ? OR facilityCode = ?)
        AND date BETWEEN ? AND ? ORDER BY givenName, familyName
    ''', variables: [
      Variable.withString(code),
      Variable.withString(code),
      Variable.withDateTime(start),
      Variable.withDateTime(end)
    ]).get();

    return [
      for (final row in rows)
        DispenseInfo(
            row.data['outletCode'],
            row.data['facilityCode'],
            row.data['givenName'],
            row.data['familyName'],
            row.data['medications'],
            row.data['date'],
            row.data['dateNextRefill'],
            row.data['dateOfBirth'],
            row.data['sex'],
            row.data['hospitalNo']),
    ];
  }
}

@DriftAccessor(tables: [Facility])
class FacilityDao extends DatabaseAccessor<Database> with _$FacilityDaoMixin {
  FacilityDao(Database db) : super(db);

  Future<List<FacilityData>> findAll() {
    return (select(facility)).get();
  }

  Future<FacilityData?> findById(int id) {
    return (select(facility)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertRecord(FacilityData data) {
    return into(facility).insert(data);
  }

  deleteAll() async {
    return await delete(facility).go();
  }
}

@DriftAccessor(tables: [Outlet])
class OutletDao extends DatabaseAccessor<Database> with _$OutletDaoMixin {
  OutletDao(Database db) : super(db);

  Future<List<OutletData>> findAll() {
    return (select(outlet)).get();
  }

  Future<OutletData?> findById(int id) {
    return (select(outlet)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertRecord(OutletData data) {
    return into(outlet).insert(data);
  }

  deleteAll() async {
    return await delete(outlet).go();
  }
}

@DriftAccessor(tables: [Patient, Dispense])
class PatientDao extends DatabaseAccessor<Database> with _$PatientDaoMixin {
  PatientDao(Database db) : super(db);

  Future<List<PatientData>> findByKeyword(
      String activationCode, String keyword) {
    return (select(patient)
          ..where((p) =>
              p.givenName.lower().like('%$keyword%'.toLowerCase()) |
              p.familyName.lower().like('%$keyword%'.toLowerCase()) |
              p.uniqueId.lower().like('%$keyword%'.toLowerCase()) |
              p.phone.lower().like('%$keyword%'.toLowerCase()) |
              p.hospitalNo.lower().like('%$keyword%'.toLowerCase()))
          ..where((p) =>
              p.outletCode.equals(activationCode) |
              p.facilityCode.equals(activationCode))
          ..orderBy([
            (u) => OrderingTerm(expression: u.givenName, mode: OrderingMode.asc)
          ])
          ..limit(10))
        .get();
  }

  Future<PatientData?> findById(int id) {
    return (select(patient)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PatientData>> findUnSynced() {
    return (select(patient)..where((tbl) => tbl.synced.equals(false))).get();
  }

  Future<bool?> hasUnSynced() {
    final count = patient.id
        .count(filter: patient.synced.equals(false))
        .isBiggerThanValue(0);

    final query = db.selectOnly(patient)..addColumns([count]);

    return query.map((row) => row.read(count)).getSingle();
  }

  Future<int> insertRecord(PatientData data) async {
    return await into(patient).insert(data);
  }

  Future updateRecord(PatientData data) async {
    return await update(patient).replace(data);
  }

  updateAllSynced() async {
    return customUpdate('''UPDATE Patient SET synced = true''');
  }

  deleteAll() async {
    return await delete(patient).go();
  }

  Future<List<LastDispense>> listMissedDispense(
      String code, DateTime start, DateTime end) async {
    final rows = await customSelect('''
       WITH last_Dispense AS ( 
          SELECT * FROM (
            SELECT patientId patientId, date, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId 
            ORDER BY date DESC) rn FROM Dispense
          ) r WHERE rn = 1
      ),
      DATA AS(
        SELECT outletCode, facilityCode, givenName, familyName, hospitalNo, sex, dateOfBirth, date, 
          dateNextRefill FROM last_Dispense JOIN patient p ON patientId = p.uuid ORDER BY givenName, familyName
      )
      SELECT * FROM LastDispense WHERE (outletCode = ? OR facilityCode = ?)
        AND dateNextRefill BETWEEN ? AND ?
    ''', variables: [
      Variable.withString(code),
      Variable.withString(code),
      Variable.withDateTime(start),
      Variable.withDateTime(end)
    ]).get();

    return [
      for (final row in rows)
        LastDispense(
            row.data['outletCode'],
            row.data['facilityCode'],
            row.data['givenName'],
            row.data['familyName'],
            row.data['sex'],
            row.data['dateOfBirth'],
            row.data['date'],
            row.data['dateNextRefill'],
            row.data['hospitalNo']),
    ];
  }
}
//

@DriftAccessor(tables: [Regimen])
class RegimenDao extends DatabaseAccessor<Database> with _$RegimenDaoMixin {
  RegimenDao(Database db) : super(db);

  Future<List<RegimenData>> findAll() {
    return (select(regimen)).get();
  }

  Future<RegimenData?> findById(int id) {
    return (select(regimen)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<RegimenData?> findByName(String name) async {
    final list = await (select(regimen)..where((tbl) => tbl.name.equals(name)))
        .get();
    final iterator = list.iterator;

    if (!iterator.moveNext()) {
      return null;
    }
    return iterator.current;
  }

  Future<int> insertRecord(RegimenData data) {
    return into(regimen).insert(data);
  }

  deleteAll() async {
    return await delete(regimen).go();
  }
}

@DriftAccessor(tables: [ViralLoad])
class ViralLoadDao extends DatabaseAccessor<Database> with _$ViralLoadDaoMixin {
  ViralLoadDao(Database db) : super(db);

  Future<ViralLoadData?> findById(int id) {
    return (select(viralLoad)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<ViralLoadData>> findUnSynced() {
    return (select(viralLoad)..where((tbl) => tbl.synced.equals(false))).get();
  }

  Future<bool?> hasUnSynced() {
    final count = viralLoad.id
        .count(filter: viralLoad.synced.equals(false))
        .isBiggerThanValue(0);

    final query = db.selectOnly(viralLoad)..addColumns([count]);

    return query.map((row) => row.read(count)).getSingle();
  }

  Future<List<ViralLoadData>> findByPatient(String patientId) {
    return (select(viralLoad)..where((tbl) => tbl.patientId.equals(patientId)))
        .get();
  }

  Future<int> insertRecord(ViralLoadData data) {
    return into(viralLoad).insert(data);
  }

  Future updateRecord(ViralLoadData data) {
    return update(viralLoad).replace(data);
  }

  updateAllSynced() async {
    return customUpdate('''UPDATE Viral_Load SET synced = true''');
  }

  deleteAll() async {
    return await delete(viralLoad).go();
  }
}
