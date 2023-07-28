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

  DevolveDao? _devolveDaoInstance;

  DispenseDao? _dispenseDaoInstance;

  PatientDao? _patientDaoInstance;

  RegimenDao? _regimenDaoInstance;

  OutletDao? _outletDaoInstance;

  FacilityDao? _facilityDaoInstance;

  ViralLoadDao? _viralLoadDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Clinic` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `systolic` INTEGER, `diastolic` INTEGER, `weight` REAL, `temperature` REAL, `patientId` TEXT NOT NULL, `date` INTEGER NOT NULL, `coughing` INTEGER, `swelling` INTEGER, `sweating` INTEGER, `fever` INTEGER, `weightLoss` INTEGER, `tbReferred` INTEGER, `uuid` TEXT NOT NULL, `synced` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Facility` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `code` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Outlet` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `code` TEXT NOT NULL, `facilityCode` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Patient` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `givenName` TEXT NOT NULL, `familyName` TEXT NOT NULL, `hospitalNo` TEXT NOT NULL, `uniqueId` TEXT, `dateOfBirth` INTEGER NOT NULL, `sex` TEXT NOT NULL, `phone` TEXT, `facility` TEXT, `outletCode` TEXT, `facilityCode` TEXT NOT NULL, `address` TEXT NOT NULL, `lastClinicVisit` INTEGER NOT NULL, `lastRefillDate` INTEGER NOT NULL, `nextAppointmentDate` INTEGER NOT NULL, `nextVisitDate` INTEGER NOT NULL, `dateStarted` INTEGER NOT NULL, `uuid` TEXT NOT NULL, `viralLoadDate` INTEGER NOT NULL, `synced` INTEGER NOT NULL, `lastClinicStage` TEXT, `lastViralLoad` TEXT, `deleted` INTEGER, `targetGroup` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Regimen` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `regimenType` TEXT NOT NULL, `arv` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Dispense` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `patientId` TEXT NOT NULL, `dateNextRefill` INTEGER NOT NULL, `medications` TEXT NOT NULL, `synced` INTEGER NOT NULL, `missedDoses` INTEGER, `adverseIssues` INTEGER, `uuid` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Devolve` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `reasonDiscontinued` TEXT, `date` INTEGER NOT NULL, `outletCode` TEXT NOT NULL, `patientId` TEXT NOT NULL, `uuid` TEXT NOT NULL, `synced` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ViralLoad` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `value` TEXT, `nextAppointment` INTEGER NOT NULL, `patientId` TEXT NOT NULL, `uuid` TEXT NOT NULL, `synced` INTEGER NOT NULL)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `LastDispense` AS   WITH last_Dispense AS ( \n      SELECT * FROM (\n            SELECT patientId, date, dateNextRefill, ROW_NUMBER() OVER (PARTITION BY patientId \n            ORDER BY date DESC) rn FROM Dispense\n      ) r WHERE rn = 1\n  )\n  SELECT outletCode, facilityCode, givenName, familyName, hospitalNo, sex, dateOfBirth, date, \n    dateNextRefill FROM last_Dispense JOIN patient p ON patientId = p.uuid ORDER BY givenName, familyName\n');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `DispenseInfo` AS   SELECT givenName, familyName, sex, dateOfBirth, medications, \n    hospitalNo, outletCode, facilityCode, dateNextRefill, date FROM Dispense \n    JOIN Patient p ON patientId = p.uuid ORDER BY givenName, familyName, sex    \n');

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
  DevolveDao get devolveDao {
    return _devolveDaoInstance ??= _$DevolveDao(database, changeListener);
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

  @override
  ViralLoadDao get viralLoadDao {
    return _viralLoadDaoInstance ??= _$ViralLoadDao(database, changeListener);
  }
}

class _$ClinicDao extends ClinicDao {
  _$ClinicDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _clinicInsertionAdapter = InsertionAdapter(
            database,
            'Clinic',
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
    return _queryAdapter.queryList('SELECT * FROM Clinic WHERE synced = 0',
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
  Future<bool?> hasUnSynced() async {
    return _queryAdapter.query(
        'SELECT COUNT(*) > 0 FROM Clinic WHERE synced= 0',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertRecord(Clinic clinic) async {
    await _clinicInsertionAdapter.insert(clinic, OnConflictStrategy.abort);
  }
}

class _$DevolveDao extends DevolveDao {
  _$DevolveDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _devolveInsertionAdapter = InsertionAdapter(
            database,
            'Devolve',
            (Devolve item) => <String, Object?>{
                  'id': item.id,
                  'reasonDiscontinued': item.reasonDiscontinued,
                  'date': _dateTimeConverter.encode(item.date),
                  'outletCode': item.outletCode,
                  'patientId': item.patientId,
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Devolve> _devolveInsertionAdapter;

  @override
  Future<List<Devolve>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Devolve WHERE synced = 0',
        mapper: (Map<String, Object?> row) => Devolve(
            id: row['id'] as int?,
            reasonDiscontinued: row['reasonDiscontinued'] as String?,
            date: _dateTimeConverter.decode(row['date'] as int),
            outletCode: row['outletCode'] as String,
            patientId: row['patientId'] as String,
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String));
  }

  @override
  Future<Devolve?> findByPatient(String patientId) async {
    return _queryAdapter.query(
        'SELECT * FROM Devolve WHERE patientId = ?1 ORDER BY date DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => Devolve(
            id: row['id'] as int?,
            reasonDiscontinued: row['reasonDiscontinued'] as String?,
            date: _dateTimeConverter.decode(row['date'] as int),
            outletCode: row['outletCode'] as String,
            patientId: row['patientId'] as String,
            synced: (row['synced'] as int) != 0,
            uuid: row['uuid'] as String),
        arguments: [patientId]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Devolve');
  }

  @override
  Future<bool?> hasUnSynced() async {
    return _queryAdapter.query(
        'SELECT COUNT(*) > 0 FROM Devolve WHERE synced= 0',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertRecord(Devolve devolve) async {
    await _devolveInsertionAdapter.insert(devolve, OnConflictStrategy.abort);
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
    return _queryAdapter.queryList('SELECT * FROM Dispense WHERE synced = 0',
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
        'SELECT * FROM Dispense WHERE patientId = ?1 ORDER BY date DESC',
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
        'SELECT * FROM DispenseInfo WHERE (outletCode = ?1 OR facilityCode = ?1)         AND date BETWEEN ?2 AND ?3 ORDER BY givenName, familyName',
        mapper: (Map<String, Object?> row) => DispenseInfo(row['outletCode'] as String?, row['facilityCode'] as String, row['familyName'] as String, row['givenName'] as String, _listMedicationConverter.decode(row['medications'] as String), _dateTimeConverter.decode(row['date'] as int), _dateTimeConverter.decode(row['dateNextRefill'] as int), _dateTimeConverter.decode(row['dateOfBirth'] as int), row['sex'] as String, row['hospitalNo'] as String),
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
  Future<bool?> hasUnSynced() async {
    return _queryAdapter.query(
        'SELECT COUNT(*) > 0 FROM Dispense WHERE synced= 0',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
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
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'uuid': item.uuid,
                  'viralLoadDate':
                      _dateTimeConverter.encode(item.viralLoadDate),
                  'synced': item.synced ? 1 : 0,
                  'lastClinicStage': item.lastClinicStage,
                  'lastViralLoad': item.lastViralLoad,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0),
                  'targetGroup': item.targetGroup
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
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'uuid': item.uuid,
                  'viralLoadDate':
                      _dateTimeConverter.encode(item.viralLoadDate),
                  'synced': item.synced ? 1 : 0,
                  'lastClinicStage': item.lastClinicStage,
                  'lastViralLoad': item.lastViralLoad,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0),
                  'targetGroup': item.targetGroup
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
        'SELECT * FROM Patient WHERE (outletCode = ?1 OR facilityCode =          ?1) AND (LOWER(givenName) LIKE          LOWER(?2) OR LOWER(familyName) LIKE LOWER(?2) OR          LOWER(hospitalNo) LIKE LOWER(?2)) ORDER BY givenName,        familyName LIMIT 10',
        mapper: (Map<String, Object?> row) => Patient(id: row['id'] as int?, givenName: row['givenName'] as String, familyName: row['familyName'] as String, hospitalNo: row['hospitalNo'] as String, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), sex: row['sex'] as String, targetGroup: row['targetGroup'] as String?, phone: row['phone'] as String?, facility: row['facility'] as String?, outletCode: row['outletCode'] as String?, facilityCode: row['facilityCode'] as String, address: row['address'] as String, lastClinicVisit: _dateTimeConverter.decode(row['lastClinicVisit'] as int), lastRefillDate: _dateTimeConverter.decode(row['lastRefillDate'] as int), nextAppointmentDate: _dateTimeConverter.decode(row['nextAppointmentDate'] as int), nextVisitDate: _dateTimeConverter.decode(row['nextVisitDate'] as int), dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int), lastClinicStage: row['lastClinicStage'] as String?, uuid: row['uuid'] as String, lastViralLoad: row['lastViralLoad'] as String?, viralLoadDate: _dateTimeConverter.decode(row['viralLoadDate'] as int), uniqueId: row['uniqueId'] as String?, synced: (row['synced'] as int) != 0),
        arguments: [activationCode, keyword]);
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
            targetGroup: row['targetGroup'] as String?,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
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
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            viralLoadDate:
                _dateTimeConverter.decode(row['viralLoadDate'] as int),
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
            targetGroup: row['targetGroup'] as String?,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
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
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            viralLoadDate:
                _dateTimeConverter.decode(row['viralLoadDate'] as int),
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
    return _queryAdapter.queryList('SELECT * FROM Patient WHERE synced = 0',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int?,
            givenName: row['givenName'] as String,
            familyName: row['familyName'] as String,
            hospitalNo: row['hospitalNo'] as String,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            sex: row['sex'] as String,
            targetGroup: row['targetGroup'] as String?,
            phone: row['phone'] as String?,
            facility: row['facility'] as String?,
            outletCode: row['outletCode'] as String?,
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
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            lastClinicStage: row['lastClinicStage'] as String?,
            uuid: row['uuid'] as String,
            lastViralLoad: row['lastViralLoad'] as String?,
            viralLoadDate:
                _dateTimeConverter.decode(row['viralLoadDate'] as int),
            uniqueId: row['uniqueId'] as String?,
            synced: (row['synced'] as int) != 0));
  }

  @override
  Future<bool?> hasUnSynced() async {
    return _queryAdapter.query(
        'SELECT COUNT(*) > 0 FROM Patient WHERE synced = 0',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<List<LastDispense>> listMissedDispense(
    String code,
    DateTime start,
    DateTime end,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM LastDispense WHERE (outletCode = ?1 OR facilityCode = ?1)         AND dateNextRefill BETWEEN ?2 AND ?3',
        mapper: (Map<String, Object?> row) => LastDispense(row['outletCode'] as String?, row['facilityCode'] as String, row['givenName'] as String, row['familyName'] as String, row['sex'] as String, _dateTimeConverter.decode(row['dateOfBirth'] as int), _dateTimeConverter.decode(row['date'] as int), _dateTimeConverter.decode(row['dateNextRefill'] as int), row['hospitalNo'] as String),
        arguments: [
          code,
          _dateTimeConverter.encode(start),
          _dateTimeConverter.encode(end)
        ]);
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
    return _queryAdapter.queryList('SELECT * FROM Regimen',
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
        mapper: (Map<String, Object?> row) => Outlet(row['name'] as String,
            row['code'] as String, row['facilityCode'] as String?));
  }

  @override
  Stream<Outlet?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Outlet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Outlet(row['name'] as String,
            row['code'] as String, row['facilityCode'] as String?),
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
        mapper: (Map<String, Object?> row) =>
            Facility(row['name'] as String, row['code'] as String));
  }

  @override
  Stream<Facility?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Facility WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Facility(row['name'] as String, row['code'] as String),
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

class _$ViralLoadDao extends ViralLoadDao {
  _$ViralLoadDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _viralLoadInsertionAdapter = InsertionAdapter(
            database,
            'ViralLoad',
            (ViralLoad item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'value': item.value,
                  'nextAppointment':
                      _dateTimeConverter.encode(item.nextAppointment),
                  'patientId': item.patientId,
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0
                },
            changeListener),
        _viralLoadUpdateAdapter = UpdateAdapter(
            database,
            'ViralLoad',
            ['id'],
            (ViralLoad item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'value': item.value,
                  'nextAppointment':
                      _dateTimeConverter.encode(item.nextAppointment),
                  'patientId': item.patientId,
                  'uuid': item.uuid,
                  'synced': item.synced ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ViralLoad> _viralLoadInsertionAdapter;

  final UpdateAdapter<ViralLoad> _viralLoadUpdateAdapter;

  @override
  Future<List<ViralLoad>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM ViralLoad',
        mapper: (Map<String, Object?> row) => ViralLoad(
            id: row['id'] as int?,
            nextAppointment:
                _dateTimeConverter.decode(row['nextAppointment'] as int),
            patientId: row['patientId'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            uuid: row['uuid'] as String,
            value: row['value'] as String?,
            synced: (row['synced'] as int) != 0));
  }

  @override
  Stream<ViralLoad?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM ViralLoad WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ViralLoad(
            id: row['id'] as int?,
            nextAppointment:
                _dateTimeConverter.decode(row['nextAppointment'] as int),
            patientId: row['patientId'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            uuid: row['uuid'] as String,
            value: row['value'] as String?,
            synced: (row['synced'] as int) != 0),
        arguments: [id],
        queryableName: 'ViralLoad',
        isView: false);
  }

  @override
  Future<List<ViralLoad>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM ViralLoad WHERE synced = 0',
        mapper: (Map<String, Object?> row) => ViralLoad(
            id: row['id'] as int?,
            nextAppointment:
                _dateTimeConverter.decode(row['nextAppointment'] as int),
            patientId: row['patientId'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            uuid: row['uuid'] as String,
            value: row['value'] as String?,
            synced: (row['synced'] as int) != 0));
  }

  @override
  Future<List<ViralLoad>> findByPatient(String patientId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ViralLoad WHERE patientId = ?1 ORDER BY date DESC',
        mapper: (Map<String, Object?> row) => ViralLoad(
            id: row['id'] as int?,
            nextAppointment:
                _dateTimeConverter.decode(row['nextAppointment'] as int),
            patientId: row['patientId'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            uuid: row['uuid'] as String,
            value: row['value'] as String?,
            synced: (row['synced'] as int) != 0),
        arguments: [patientId]);
  }

  @override
  Future<List<ViralLoad>> findByPatientAndDate(
    String patientId,
    DateTime date,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ViralLoad WHERE patientId = ?1 AND date = ?2',
        mapper: (Map<String, Object?> row) => ViralLoad(
            id: row['id'] as int?,
            nextAppointment:
                _dateTimeConverter.decode(row['nextAppointment'] as int),
            patientId: row['patientId'] as String,
            date: _dateTimeConverter.decode(row['date'] as int),
            uuid: row['uuid'] as String,
            value: row['value'] as String?,
            synced: (row['synced'] as int) != 0),
        arguments: [patientId, _dateTimeConverter.encode(date)]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ViralLoad');
  }

  @override
  Future<bool?> hasUnSynced() async {
    return _queryAdapter.query(
        'SELECT COUNT(*) > 0 FROM ViralLoad WHERE synced= 0',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<void> insertRecord(ViralLoad vialLoad) async {
    await _viralLoadInsertionAdapter.insert(vialLoad, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRecord(ViralLoad vialLoad) {
    return _viralLoadUpdateAdapter.updateAndReturnChangedRows(
        vialLoad, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _listMedicationConverter = ListMedicationConverter();
