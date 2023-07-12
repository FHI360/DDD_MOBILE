// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClinicDao? _clinicDaoInstance;

  DispenseDao? _dispenseDaoInstance;

  PatientDao? _patientDaoInstance;

  RegimenDao? _regimenDaoInstance;

  OutletDao? _outletDaoInstance;

  FacilityDao? _facilityDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 9,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `clinic` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `systolic` INTEGER, `diastolic` INTEGER, `weight` REAL, `temperature` REAL, `patientId` TEXT NOT NULL, `date` INTEGER NOT NULL, `coughing` INTEGER, `swelling` INTEGER, `sweating` INTEGER, `fever` INTEGER, `weightLoss` INTEGER, `tbReferred` INTEGER, `uuid` TEXT NOT NULL, `synced` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Facility` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `level1AD` INTEGER NOT NULL, `level2AD` INTEGER NOT NULL, `code` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Outlet` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `address` TEXT NOT NULL, `phone` TEXT NOT NULL, `email` TEXT NOT NULL, `type` TEXT NOT NULL, `code` TEXT NOT NULL, `facilityCode` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Patient` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `givenName` TEXT NOT NULL, `familyName` TEXT NOT NULL, `hospitalNo` TEXT NOT NULL, `uniqueId` TEXT, `dateOfBirth` INTEGER NOT NULL, `sex` TEXT NOT NULL, `phone` TEXT, `facility` TEXT, `outletCode` TEXT, `dateDevolved` INTEGER NOT NULL, `facilityCode` TEXT NOT NULL, `address` TEXT NOT NULL, `lastClinicVisit` INTEGER NOT NULL, `lastRefillDate` INTEGER NOT NULL, `nextAppointmentDate` INTEGER NOT NULL, `nextVisitDate` INTEGER NOT NULL, `serviceDiscontinued` INTEGER, `reasonDiscontinued` TEXT, `dateDiscontinued` INTEGER NOT NULL, `dateStarted` INTEGER NOT NULL, `uuid` TEXT NOT NULL, `synced` INTEGER NOT NULL, `lastClinicStage` TEXT, `lastViralLoad` TEXT, `deleted` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Regimen` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `regimenType` TEXT NOT NULL, `arv` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Dispense` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `patientId` TEXT NOT NULL, `dateNextRefill` INTEGER NOT NULL, `medications` TEXT NOT NULL, `synced` INTEGER NOT NULL, `missedDoses` INTEGER, `adverseIssues` INTEGER, `uuid` TEXT NOT NULL)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `LastDispense` AS   WITH last_Dispense AS ( \n      SELECT * FROM (\n            SELECT patientId, date, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId \n            ORDER BY date DESC) rn FROM Dispense\n      ) r WHERE rn = 1\n  )\n  SELECT outletCode, facilityCode, givenName, familyName, hospitalNo, sex, dateOfBirth, date, \n    dateNextRefill FROM LastDispense JOIN patient ON patientId = id ORDER BY givenName, familyName\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `DispenseInfo` AS   SELECT givenName, familyName, sex, dateOfBirth, quantityDispensed quantity, \n    hospitalNo, regimen, outletCode, facilityCode dateNextRefill, date FROM Dispense \n    JOIN Patient p ON patientId = p.uuid ORDER BY givenName, familyName, sex    \n');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ClinicDao get clinicDao {
    return _clinicDaoInstance ??= _$ClinicDao(database, changeListener);
  }

  @override
  DispenseDao get dispenseDao {
    return _dispenseDaoInstance ??= _$DispenseDao(database, changeListener);
  }

  @override
  PatientDao get patientDao {
    return _patientDaoInstance ??= _$PatientDao(database, changeListener);
  }

  @override
  RegimenDao get regimenDao {
    return _regimenDaoInstance ??= _$RegimenDao(database, changeListener);
  }

  @override
  OutletDao get outletDao {
    return _outletDaoInstance ??= _$OutletDao(database, changeListener);
  }

  @override
  FacilityDao get facilityDao {
    return _facilityDaoInstance ??= _$FacilityDao(database, changeListener);
  }
}

class _$ClinicDao extends ClinicDao {
  _$ClinicDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _clinicInsertionAdapter = InsertionAdapter(
            database,
            'clinic',
            (Clinic item) => <String, Object?>{
                  'id': item.id,
                  'systolic': item.systolic,
                  'diastolic': item.diastolic,
                  'weight': item.weight,
                  'temperature': item.temperature,
                  'patientId': item.patientId,
                  'date': _dateTimeConverter.encode(item.date),
                  'coughing':
                      item.coughing == null ? null : (item.coughing! ? 1 : 0),
                  'swelling':
                      item.swelling == null ? null : (item.swelling! ? 1 : 0),
                  'sweating':
                      item.sweating == null ? null : (item.sweating! ? 1 : 0),
                  'fever': item.fever == null ? null : (item.fever! ? 1 : 0),
                  'weightLoss': item.weightLoss == null
                      ? null
                      : (item.weightLoss! ? 1 : 0),
                  'tbReferred': item.tbReferred == null
                      ? null
                      : (item.tbReferred! ? 1 : 0),
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Clinic> _clinicInsertionAdapter;

  @override
  Future<List<Clinic>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Clinic',
        mapper: (Map<String, Object?> row) => Clinic(
            row['id'] as int?,
            row['systolic'] as int?,
            row['diastolic'] as int?,
            row['weight'] as double?,
            row['temperature'] as double?,
            row['patientId'] as String,
            _dateTimeConverter.decode(row['date'] as int),
            row['coughing'] == null ? null : (row['coughing'] as int) != 0,
            row['swelling'] == null ? null : (row['swelling'] as int) != 0,
            row['sweating'] == null ? null : (row['sweating'] as int) != 0,
            row['fever'] == null ? null : (row['fever'] as int) != 0,
            row['weightLoss'] == null ? null : (row['weightLoss'] as int) != 0,
            row['tbReferred'] == null ? null : (row['tbReferred'] as int) != 0,
            row['uuid'] as String,
            (row['synced'] as int) != 0));
  }

  @override
  Future<List<Clinic>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Clinic WHERE synced = false',
        mapper: (Map<String, Object?> row) => Clinic(
            row['id'] as int?,
            row['systolic'] as int?,
            row['diastolic'] as int?,
            row['weight'] as double?,
            row['temperature'] as double?,
            row['patientId'] as String,
            _dateTimeConverter.decode(row['date'] as int),
            row['coughing'] == null ? null : (row['coughing'] as int) != 0,
            row['swelling'] == null ? null : (row['swelling'] as int) != 0,
            row['sweating'] == null ? null : (row['sweating'] as int) != 0,
            row['fever'] == null ? null : (row['fever'] as int) != 0,
            row['weightLoss'] == null ? null : (row['weightLoss'] as int) != 0,
            row['tbReferred'] == null ? null : (row['tbReferred'] as int) != 0,
            row['uuid'] as String,
            (row['synced'] as int) != 0));
  }

  @override
  Stream<Clinic?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Clinic WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Clinic(
            row['id'] as int?,
            row['systolic'] as int?,
            row['diastolic'] as int?,
            row['weight'] as double?,
            row['temperature'] as double?,
            row['patientId'] as String,
            _dateTimeConverter.decode(row['date'] as int),
            row['coughing'] == null ? null : (row['coughing'] as int) != 0,
            row['swelling'] == null ? null : (row['swelling'] as int) != 0,
            row['sweating'] == null ? null : (row['sweating'] as int) != 0,
            row['fever'] == null ? null : (row['fever'] as int) != 0,
            row['weightLoss'] == null ? null : (row['weightLoss'] as int) != 0,
            row['tbReferred'] == null ? null : (row['tbReferred'] as int) != 0,
            row['uuid'] as String,
            (row['synced'] as int) != 0),
        arguments: [id],
        queryableName: 'Clinic',
        isView: false);
  }

  @override
  Future<List<Clinic>> findByPatient(String patientId) async {
    return _queryAdapter.queryList('SELECT * FROM Clinic WHERE patientId = ?1',
        mapper: (Map<String, Object?> row) => Clinic(
            row['id'] as int?,
            row['systolic'] as int?,
            row['diastolic'] as int?,
            row['weight'] as double?,
            row['temperature'] as double?,
            row['patientId'] as String,
            _dateTimeConverter.decode(row['date'] as int),
            row['coughing'] == null ? null : (row['coughing'] as int) != 0,
            row['swelling'] == null ? null : (row['swelling'] as int) != 0,
            row['sweating'] == null ? null : (row['sweating'] as int) != 0,
            row['fever'] == null ? null : (row['fever'] as int) != 0,
            row['weightLoss'] == null ? null : (row['weightLoss'] as int) != 0,
            row['tbReferred'] == null ? null : (row['tbReferred'] as int) != 0,
            row['uuid'] as String,
            (row['synced'] as int) != 0),
        arguments: [patientId]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Clinic');
  }

  @override
  Future<void> insertRecord(Clinic clinic) async {
    await _clinicInsertionAdapter.insert(clinic, OnConflictStrategy.abort);
  }
}

class _$DispenseDao extends DispenseDao {
  _$DispenseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _dispenseInsertionAdapter = InsertionAdapter(
            database,
            'Dispense',
            (Dispense item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'patientId': item.patientId,
                  'dateNextRefill':
                      _dateTimeConverter.encode(item.dateNextRefill),
                  'medications':
                      _listMedicationConverter.encode(item.medications),
                  'synced': item.synced ? 1 : 0,
                  'missedDoses': item.missedDoses == null
                      ? null
                      : (item.missedDoses! ? 1 : 0),
                  'adverseIssues': item.adverseIssues == null
                      ? null
                      : (item.adverseIssues! ? 1 : 0),
                  'uuid': item.uuid
                },
            changeListener),
        _dispenseUpdateAdapter = UpdateAdapter(
            database,
            'Dispense',
            ['id'],
            (Dispense item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'patientId': item.patientId,
                  'dateNextRefill':
                      _dateTimeConverter.encode(item.dateNextRefill),
                  'medications':
                      _listMedicationConverter.encode(item.medications),
                  'synced': item.synced ? 1 : 0,
                  'missedDoses': item.missedDoses == null
                      ? null
                      : (item.missedDoses! ? 1 : 0),
                  'adverseIssues': item.adverseIssues == null
                      ? null
                      : (item.adverseIssues! ? 1 : 0),
                  'uuid': item.uuid
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Dispense> _dispenseInsertionAdapter;

  final UpdateAdapter<Dispense> _dispenseUpdateAdapter;

  @override
  Future<List<Dispense>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Dispense',
        mapper: (Map<String, Object?> row) => Dispense(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            patientId: row['patientId'] as String,
            dateNextRefill:
                _dateTimeConverter.decode(row['dateNextRefill'] as int),
            missedDoses: row['missedDoses'] == null
                ? null
                : (row['missedDoses'] as int) != 0,
            adverseIssues: row['adverseIssues'] == null
                ? null
                : (row['adverseIssues'] as int) != 0,
            medications:
                _listMedicationConverter.decode(row['medications'] as String),
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String));
  }

  @override
  Stream<Dispense?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Dispense WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Dispense(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            patientId: row['patientId'] as String,
            dateNextRefill:
                _dateTimeConverter.decode(row['dateNextRefill'] as int),
            missedDoses: row['missedDoses'] == null
                ? null
                : (row['missedDoses'] as int) != 0,
            adverseIssues: row['adverseIssues'] == null
                ? null
                : (row['adverseIssues'] as int) != 0,
            medications:
                _listMedicationConverter.decode(row['medications'] as String),
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String),
        arguments: [id],
        queryableName: 'Dispense',
        isView: false);
  }

  @override
  Future<List<Dispense>> findUnSynced() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Dispense WHERE synced = false',
        mapper: (Map<String, Object?> row) => Dispense(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            patientId: row['patientId'] as String,
            dateNextRefill:
                _dateTimeConverter.decode(row['dateNextRefill'] as int),
            missedDoses: row['missedDoses'] == null
                ? null
                : (row['missedDoses'] as int) != 0,
            adverseIssues: row['adverseIssues'] == null
                ? null
                : (row['adverseIssues'] as int) != 0,
            medications:
                _listMedicationConverter.decode(row['medications'] as String),
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String));
  }

  @override
  Future<List<Dispense>> findByPatient(String patientId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Dispense WHERE patientId = ?1',
        mapper: (Map<String, Object?> row) => Dispense(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            patientId: row['patientId'] as String,
            dateNextRefill:
                _dateTimeConverter.decode(row['dateNextRefill'] as int),
            missedDoses: row['missedDoses'] == null
                ? null
                : (row['missedDoses'] as int) != 0,
            adverseIssues: row['adverseIssues'] == null
                ? null
                : (row['adverseIssues'] as int) != 0,
            medications:
                _listMedicationConverter.decode(row['medications'] as String),
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String),
        arguments: [patientId]);
  }

  @override
  Future<List<Dispense>> findByPatientAndDate(
    String patientId,
    DateTime date,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Dispense WHERE patientId = ?1 AND date = ?2',
        mapper: (Map<String, Object?> row) => Dispense(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            patientId: row['patientId'] as String,
            dateNextRefill:
                _dateTimeConverter.decode(row['dateNextRefill'] as int),
            missedDoses: row['missedDoses'] == null
                ? null
                : (row['missedDoses'] as int) != 0,
            adverseIssues: row['adverseIssues'] == null
                ? null
                : (row['adverseIssues'] as int) != 0,
            medications:
                _listMedicationConverter.decode(row['medications'] as String),
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String),
        arguments: [patientId, _dateTimeConverter.encode(date)]);
  }

  @override
  Future<List<DispenseInfo>> listDispenseInfo(
    String code,
    DateTime start,
    DateTime end,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DispenseInfo WHERE (outletCode = ?1 OR facilityCode = ?1         AND date BETWEEN ?2 and ?3 ORDER BY givenName, familyName',
        mapper: (Map<String, Object?> row) => DispenseInfo(row['outletCode'] as String, row['facilityCode'] as String, row['familyName'] as String, row['givenName'] as String, row['quantity'] as int, _dateTimeConverter.decode(row['date'] as int), _dateTimeConverter.decode(row['dateNextRefill'] as int), _dateTimeConverter.decode(row['dateOfBirth'] as int), row['regimen'] as String, row['sex'] as String, row['hospitalNo'] as String),
        arguments: [
          code,
          _dateTimeConverter.encode(start),
          _dateTimeConverter.encode(end)
        ]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Dispense');
  }

  @override
  Future<void> insertRecord(Dispense dispense) async {
    await _dispenseInsertionAdapter.insert(dispense, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRecord(Dispense dispense) {
    return _dispenseUpdateAdapter.updateAndReturnChangedRows(
        dispense, OnConflictStrategy.abort);
  }
}

class _$PatientDao extends PatientDao {
  _$PatientDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _patientInsertionAdapter = InsertionAdapter(
            database,
            'Patient',
            (Patient item) => <String, Object?>{
                  'id': item.id,
                  'givenName': item.givenName,
                  'familyName': item.familyName,
                  'hospitalNo': item.hospitalNo,
                  'uniqueId': item.uniqueId,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'sex': item.sex,
                  'phone': item.phone,
                  'facility': item.facility,
                  'outletCode': item.outletCode,
                  'dateDevolved': _dateTimeConverter.encode(item.dateDevolved),
                  'facilityCode': item.facilityCode,
                  'address': item.address,
                  'lastClinicVisit':
                      _dateTimeConverter.encode(item.lastClinicVisit),
                  'lastRefillDate':
                      _dateTimeConverter.encode(item.lastRefillDate),
                  'nextAppointmentDate':
                      _dateTimeConverter.encode(item.nextAppointmentDate),
                  'nextVisitDate':
                      _dateTimeConverter.encode(item.nextVisitDate),
                  'serviceDiscontinued': item.serviceDiscontinued == null
                      ? null
                      : (item.serviceDiscontinued! ? 1 : 0),
                  'reasonDiscontinued': item.reasonDiscontinued,
                  'dateDiscontinued':
                      _dateTimeConverter.encode(item.dateDiscontinued),
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0,
                  'lastClinicStage': item.lastClinicStage,
                  'lastViralLoad': item.lastViralLoad,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0)
                }),
        _patientUpdateAdapter = UpdateAdapter(
            database,
            'Patient',
            ['id'],
            (Patient item) => <String, Object?>{
                  'id': item.id,
                  'givenName': item.givenName,
                  'familyName': item.familyName,
                  'hospitalNo': item.hospitalNo,
                  'uniqueId': item.uniqueId,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'sex': item.sex,
                  'phone': item.phone,
                  'facility': item.facility,
                  'outletCode': item.outletCode,
                  'dateDevolved': _dateTimeConverter.encode(item.dateDevolved),
                  'facilityCode': item.facilityCode,
                  'address': item.address,
                  'lastClinicVisit':
                      _dateTimeConverter.encode(item.lastClinicVisit),
                  'lastRefillDate':
                      _dateTimeConverter.encode(item.lastRefillDate),
                  'nextAppointmentDate':
                      _dateTimeConverter.encode(item.nextAppointmentDate),
                  'nextVisitDate':
                      _dateTimeConverter.encode(item.nextVisitDate),
                  'serviceDiscontinued': item.serviceDiscontinued == null
                      ? null
                      : (item.serviceDiscontinued! ? 1 : 0),
                  'reasonDiscontinued': item.reasonDiscontinued,
                  'dateDiscontinued':
                      _dateTimeConverter.encode(item.dateDiscontinued),
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0,
                  'lastClinicStage': item.lastClinicStage,
                  'lastViralLoad': item.lastViralLoad,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Patient> _patientInsertionAdapter;

  final UpdateAdapter<Patient> _patientUpdateAdapter;

  @override
  Future<List<Patient>> findByKeyword(
    String activationCode,
    String keyword,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Patient WHERE (outletCode = ?1 OR facilityCode =          ?1) AND serviceDiscontinued = 0 AND (LOWER(givenName) LIKE          LOWER(?2) OR LOWER(familyName) LIKE LOWER(?2) OR          LOWER(hospitalNo) LIKE LOWER(?2)) ORDER BY givenName,        familyName LIMIT 10',
        mapper: (Map<String, Object?> row) => Patient(id: row['id'] as int?, givenName: row['givenName'] as String, familyName: row['familyName'] as String, hospitalNo: row['hospitalNo'] as String, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), sex: row['sex'] as String, phone: row['phone'] as String?, facility: row['facility'] as String?, outletCode: row['outletCode'] as String?, dateDevolved: _dateTimeConverter.decode(row['dateDevolved'] as int), facilityCode: row['facilityCode'] as String, address: row['address'] as String, lastClinicVisit: _dateTimeConverter.decode(row['lastClinicVisit'] as int), lastRefillDate: _dateTimeConverter.decode(row['lastRefillDate'] as int), nextAppointmentDate: _dateTimeConverter.decode(row['nextAppointmentDate'] as int), nextVisitDate: _dateTimeConverter.decode(row['nextVisitDate'] as int), serviceDiscontinued: row['serviceDiscontinued'] == null ? null : (row['serviceDiscontinued'] as int) != 0, reasonDiscontinued: row['reasonDiscontinued'] as String?, dateDiscontinued: _dateTimeConverter.decode(row['dateDiscontinued'] as int), dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int), lastClinicStage: row['lastClinicStage'] as String?, uuid: row['uuid'] as String, lastViralLoad: row['lastViralLoad'] as String?, uniqueId: row['uniqueId'] as String?, synced: (row['synced'] as int) != 0),
        arguments: [activationCode, keyword]);
  }

  @override
  Future<List<Patient>> findDiscontinued(String outletCode) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Patient WHERE outletCode = ?1 AND serviceDiscontinued = 1',
        mapper: (Map<String, Object?> row) => Patient(id: row['id'] as int?, givenName: row['givenName'] as String, familyName: row['familyName'] as String, hospitalNo: row['hospitalNo'] as String, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), sex: row['sex'] as String, phone: row['phone'] as String?, facility: row['facility'] as String?, outletCode: row['outletCode'] as String?, dateDevolved: _dateTimeConverter.decode(row['dateDevolved'] as int), facilityCode: row['facilityCode'] as String, address: row['address'] as String, lastClinicVisit: _dateTimeConverter.decode(row['lastClinicVisit'] as int), lastRefillDate: _dateTimeConverter.decode(row['lastRefillDate'] as int), nextAppointmentDate: _dateTimeConverter.decode(row['nextAppointmentDate'] as int), nextVisitDate: _dateTimeConverter.decode(row['nextVisitDate'] as int), serviceDiscontinued: row['serviceDiscontinued'] == null ? null : (row['serviceDiscontinued'] as int) != 0, reasonDiscontinued: row['reasonDiscontinued'] as String?, dateDiscontinued: _dateTimeConverter.decode(row['dateDiscontinued'] as int), dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int), lastClinicStage: row['lastClinicStage'] as String?, uuid: row['uuid'] as String, lastViralLoad: row['lastViralLoad'] as String?, uniqueId: row['uniqueId'] as String?, synced: (row['synced'] as int) != 0),
        arguments: [outletCode]);
  }

  @override
  Future<Patient?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Patient WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int?,
            givenName: row['givenName'] as String,
            familyName: row['familyName'] as String,
            hospitalNo: row['hospitalNo'] as String,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            sex: row['sex'] as String,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
            dateDevolved: _dateTimeConverter.decode(row['dateDevolved'] as int),
            facilityCode: row['facilityCode'] as String,
            address: row['address'] as String,
            lastClinicVisit:
                _dateTimeConverter.decode(row['lastClinicVisit'] as int),
            lastRefillDate:
                _dateTimeConverter.decode(row['lastRefillDate'] as int),
            nextAppointmentDate:
                _dateTimeConverter.decode(row['nextAppointmentDate'] as int),
            nextVisitDate:
                _dateTimeConverter.decode(row['nextVisitDate'] as int),
            serviceDiscontinued: row['serviceDiscontinued'] == null
                ? null
                : (row['serviceDiscontinued'] as int) != 0,
            reasonDiscontinued: row['reasonDiscontinued'] as String?,
            dateDiscontinued:
                _dateTimeConverter.decode(row['dateDiscontinued'] as int),
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            uniqueId: row['uniqueId'] as String?,
            synced: (row['synced'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<Patient?> findByUniqueId(String uniqueId) async {
    return _queryAdapter.query('SELECT * FROM Patient WHERE uniqueId = ?1',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int?,
            givenName: row['givenName'] as String,
            familyName: row['familyName'] as String,
            hospitalNo: row['hospitalNo'] as String,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            sex: row['sex'] as String,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
            dateDevolved: _dateTimeConverter.decode(row['dateDevolved'] as int),
            facilityCode: row['facilityCode'] as String,
            address: row['address'] as String,
            lastClinicVisit:
                _dateTimeConverter.decode(row['lastClinicVisit'] as int),
            lastRefillDate:
                _dateTimeConverter.decode(row['lastRefillDate'] as int),
            nextAppointmentDate:
                _dateTimeConverter.decode(row['nextAppointmentDate'] as int),
            nextVisitDate:
                _dateTimeConverter.decode(row['nextVisitDate'] as int),
            serviceDiscontinued: row['serviceDiscontinued'] == null
                ? null
                : (row['serviceDiscontinued'] as int) != 0,
            reasonDiscontinued: row['reasonDiscontinued'] as String?,
            dateDiscontinued:
                _dateTimeConverter.decode(row['dateDiscontinued'] as int),
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            uniqueId: row['uniqueId'] as String?,
            synced: (row['synced'] as int) != 0),
        arguments: [uniqueId]);
  }

  @override
  Future<void> updateSynced(int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE Patient SET synced = true WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<List<Patient>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Patient WHERE synced = false',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int?,
            givenName: row['givenName'] as String,
            familyName: row['familyName'] as String,
            hospitalNo: row['hospitalNo'] as String,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            sex: row['sex'] as String,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
            dateDevolved: _dateTimeConverter.decode(row['dateDevolved'] as int),
            facilityCode: row['facilityCode'] as String,
            address: row['address'] as String,
            lastClinicVisit:
                _dateTimeConverter.decode(row['lastClinicVisit'] as int),
            lastRefillDate:
                _dateTimeConverter.decode(row['lastRefillDate'] as int),
            nextAppointmentDate:
                _dateTimeConverter.decode(row['nextAppointmentDate'] as int),
            nextVisitDate:
                _dateTimeConverter.decode(row['nextVisitDate'] as int),
            serviceDiscontinued: row['serviceDiscontinued'] == null
                ? null
                : (row['serviceDiscontinued'] as int) != 0,
            reasonDiscontinued: row['reasonDiscontinued'] as String?,
            dateDiscontinued:
                _dateTimeConverter.decode(row['dateDiscontinued'] as int),
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            uniqueId: row['uniqueId'] as String?,
            synced: (row['synced'] as int) != 0));
  }

  @override
  Future<List<LastDispense>> listMissedDispense(
    String code,
    DateTime start,
    DateTime end,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM LastDispense WHERE (outletCode = ?1 OR facilityCode = ?1         AND dateNextRefill BETWEEN ?2 AND ?3',
        mapper: (Map<String, Object?> row) => LastDispense(row['outletCode'] as String, row['facilityCode'] as String, row['givenName'] as String, row['familyName'] as String, row['sex'] as String, _dateTimeConverter.decode(row['dateOfBirth'] as int), _dateTimeConverter.decode(row['date'] as int), _dateTimeConverter.decode(row['dateNextRefill'] as int), row['hospitalNo'] as String),
        arguments: [
          code,
          _dateTimeConverter.encode(start),
          _dateTimeConverter.encode(end)
        ]);
  }

  @override
  Future<void> discontinueService(
    int id,
    DateTime dateDiscontinued,
    String reasonDiscontinued,
  ) async {
    await _queryAdapter.queryNoReturn(
        'Update Patient SET serviceDiscontinued = true, dateDiscontinued =        ?2, reasonDiscontinued = ?3 WHERE id = ?1',
        arguments: [
          id,
          _dateTimeConverter.encode(dateDiscontinued),
          reasonDiscontinued
        ]);
  }

  @override
  Future<void> devolvePatient(
    int id,
    String outletCode,
    DateTime dateDevolved,
  ) async {
    await _queryAdapter.queryNoReturn(
        'Update Patient SET outletCode = ?2, dateDevolved =        ?3 WHERE id = ?1',
        arguments: [id, outletCode, _dateTimeConverter.encode(dateDevolved)]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Patient');
  }

  @override
  Future<int> insertRecord(Patient patient) {
    return _patientInsertionAdapter.insertAndReturnId(
        patient, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(Patient patient) async {
    await _patientUpdateAdapter.update(patient, OnConflictStrategy.abort);
  }
}

class _$RegimenDao extends RegimenDao {
  _$RegimenDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _regimenInsertionAdapter = InsertionAdapter(
            database,
            'Regimen',
            (Regimen item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'regimenType': item.regimenType,
                  'arv': item.arv ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Regimen> _regimenInsertionAdapter;

  @override
  Future<List<Regimen>> findAll() async {
    return _queryAdapter.queryList('SELECT * Regimen Outlet',
        mapper: (Map<String, Object?> row) => Regimen(
            row['id'] as int,
            row['name'] as String,
            row['regimenType'] as String,
            (row['arv'] as int) != 0));
  }

  @override
  Stream<Regimen?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Regimen WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Regimen(
            row['id'] as int,
            row['name'] as String,
            row['regimenType'] as String,
            (row['arv'] as int) != 0),
        arguments: [id],
        queryableName: 'Regimen',
        isView: false);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Regimen WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Regimen');
  }

  @override
  Future<void> insertRecord(Regimen regimen) async {
    await _regimenInsertionAdapter.insert(regimen, OnConflictStrategy.abort);
  }
}

class _$OutletDao extends OutletDao {
  _$OutletDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _outletInsertionAdapter = InsertionAdapter(
            database,
            'Outlet',
            (Outlet item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'address': item.address,
                  'phone': item.phone,
                  'email': item.email,
                  'type': item.type,
                  'code': item.code,
                  'facilityCode': item.facilityCode
                },
            changeListener),
        _outletUpdateAdapter = UpdateAdapter(
            database,
            'Outlet',
            ['id'],
            (Outlet item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'address': item.address,
                  'phone': item.phone,
                  'email': item.email,
                  'type': item.type,
                  'code': item.code,
                  'facilityCode': item.facilityCode
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Outlet> _outletInsertionAdapter;

  final UpdateAdapter<Outlet> _outletUpdateAdapter;

  @override
  Future<List<Outlet>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Outlet',
        mapper: (Map<String, Object?> row) => Outlet(
            row['name'] as String,
            row['address'] as String,
            row['phone'] as String,
            row['email'] as String,
            row['type'] as String,
            row['code'] as String,
            row['facilityCode'] as String?));
  }

  @override
  Stream<Outlet?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Outlet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Outlet(
            row['name'] as String,
            row['address'] as String,
            row['phone'] as String,
            row['email'] as String,
            row['type'] as String,
            row['code'] as String,
            row['facilityCode'] as String?),
        arguments: [id],
        queryableName: 'Outlet',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Outlet');
  }

  @override
  Future<void> insertRecord(Outlet outlet) async {
    await _outletInsertionAdapter.insert(outlet, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(Outlet outlet) async {
    await _outletUpdateAdapter.update(outlet, OnConflictStrategy.abort);
  }
}

class _$FacilityDao extends FacilityDao {
  _$FacilityDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _facilityInsertionAdapter = InsertionAdapter(
            database,
            'Facility',
            (Facility item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'level1AD': item.level1AD,
                  'level2AD': item.level2AD,
                  'code': item.code
                },
            changeListener),
        _facilityUpdateAdapter = UpdateAdapter(
            database,
            'Facility',
            ['id'],
            (Facility item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'level1AD': item.level1AD,
                  'level2AD': item.level2AD,
                  'code': item.code
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Facility> _facilityInsertionAdapter;

  final UpdateAdapter<Facility> _facilityUpdateAdapter;

  @override
  Future<List<Facility>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Facility',
        mapper: (Map<String, Object?> row) => Facility(
            row['name'] as String,
            row['level1AD'] as int,
            row['level2AD'] as int,
            row['code'] as String));
  }

  @override
  Stream<Facility?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Facility WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Facility(
            row['name'] as String,
            row['level1AD'] as int,
            row['level2AD'] as int,
            row['code'] as String),
        arguments: [id],
        queryableName: 'Facility',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Facility');
  }

  @override
  Future<void> insertRecord(Facility facility) async {
    await _facilityInsertionAdapter.insert(facility, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(Facility facility) async {
    await _facilityUpdateAdapter.update(facility, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _listMedicationConverter = ListMedicationConverter();
