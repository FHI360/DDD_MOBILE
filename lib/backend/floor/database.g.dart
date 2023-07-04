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

  CovidVaccinationDao? _covidVaccinationDaoInstance;

  StockDao? _stockDaoInstance;

  DCTDao? _dctDaoInstance;

  RoutineVaccinationDao? _routineVaccinationDaoInstance;

  DeclinationDao? _declinationDaoInstance;

  AccountDao? _accountDaoInstance;

  AefiDao? _aefiDaoInstance;

  SummaryDao? _summaryDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Account` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `team` TEXT NOT NULL, `lga` TEXT NOT NULL, `state` TEXT NOT NULL, `artClinic` INTEGER, `accessToken` TEXT, `refreshToken` TEXT, `lastSync` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AEFI` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `synced` INTEGER, `date` INTEGER NOT NULL, `type` TEXT NOT NULL, `lga` TEXT NOT NULL, `state` TEXT NOT NULL, `ward` TEXT NOT NULL, `healthFacility` TEXT NOT NULL, `vaccinationNo` TEXT NOT NULL, `vaccinations` TEXT NOT NULL, `anaphylaxis` INTEGER, `anaphylaxisBp` TEXT, `anaphylaxisPulse` INTEGER, `syncope` INTEGER, `syncopeBp` TEXT, `syncopePulse` INTEGER, `seizures` INTEGER, `seizuresType` TEXT, `severeLocalReaction1` INTEGER, `severeLocalReaction2` INTEGER, `abcess` INTEGER, `generalizedRash` INTEGER, `fever` INTEGER, `temperature` INTEGER, `persistentCries` INTEGER, `sepsis` INTEGER, `encephalopathy` INTEGER, `toxicShock` INTEGER, `thrombocytopenia` INTEGER, `afp` INTEGER, `otherAdverseEffect` TEXT, `dateStarted` INTEGER NOT NULL, `hospitalized` INTEGER, `dateHealthFacilityNotified` INTEGER NOT NULL, `symptoms` TEXT, `medicalHistory` TEXT, `treatmentsReceived` TEXT, `investigationDone` INTEGER, `hospitalized2` INTEGER, `incapacitation` INTEGER, `threatToLife` INTEGER, `death` INTEGER, `congenitalAnomaly` INTEGER, `otherChallenges` TEXT, `movedToReferenceCenter` INTEGER, `referenceCenter` TEXT, `referenceCenterAddress` TEXT, `dateReferred` INTEGER NOT NULL, `outcome` TEXT, `dateOfDeath` INTEGER NOT NULL, `autopsy` INTEGER, `dateOfReporting` INTEGER NOT NULL, `reportType` TEXT NOT NULL, `reporter` TEXT NOT NULL, `designation` TEXT NOT NULL, `phone` TEXT, `email` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CovidVaccination` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `familyName` TEXT, `givenName` TEXT, `sex` TEXT, `dateOfBirth` INTEGER NOT NULL, `dobEstimated` INTEGER, `vaccinationNo` TEXT, `uniqueId` TEXT, `pregnancyStatus` TEXT, `email` TEXT, `state` TEXT, `lga` TEXT, `address` TEXT, `phone` TEXT, `latLng` TEXT NOT NULL, `occupation` TEXT, `occupationType` TEXT, `idType` TEXT, `idNumber` TEXT, `qrCode` TEXT, `historyOfAllergy` INTEGER, `medicalConditions` TEXT NOT NULL, `picture` TEXT, `levelOfEducation` TEXT, `team` TEXT, `events` TEXT NOT NULL, `synced` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DCT` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `vaccineCards` INTEGER, `qrCodes` INTEGER, `vaccineRegisters` INTEGER, `tallyRegisters` INTEGER, `date` INTEGER NOT NULL, `state` TEXT, `team` TEXT, `lga` TEXT, `synced` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Declination` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `sex` TEXT, `dateOfBirth` INTEGER NOT NULL, `dobEstimated` INTEGER, `pregnancyStatus` TEXT, `levelOfEducation` TEXT, `email` TEXT, `state` TEXT, `lga` TEXT, `team` TEXT, `date` INTEGER NOT NULL, `address` TEXT, `phone` TEXT, `latLng` TEXT NOT NULL, `reasonsForDeclining` TEXT NOT NULL, `occupation` TEXT, `occupationType` TEXT, `synced` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RoutineVaccination` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `familyName` TEXT, `givenName` TEXT, `sex` TEXT, `dateOfBirth` INTEGER NOT NULL, `vaccinationNo` TEXT, `stateOfOrigin` TEXT, `lgaOfOrigin` TEXT, `nationality` TEXT, `address` TEXT, `state` TEXT, `lga` TEXT, `team` TEXT, `fromBirth` TEXT NOT NULL, `from6Weeks` TEXT NOT NULL, `from10Weeks` TEXT NOT NULL, `from14Weeks` TEXT NOT NULL, `from6Months` TEXT NOT NULL, `from9Months` TEXT NOT NULL, `from12Months` TEXT NOT NULL, `from15Months` TEXT NOT NULL, `from9Years` TEXT NOT NULL, `synced` INTEGER, `caregiver` TEXT, `caregiverPhone` TEXT, `caregiverGender` TEXT, `caregiverRelationship` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stock` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `state` TEXT, `team` TEXT, `lga` TEXT, `opening` TEXT NOT NULL, `used` TEXT NOT NULL, `discarded` TEXT NOT NULL, `returned` TEXT NOT NULL, `synced` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Summary` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `stock` INTEGER NOT NULL, `covid` INTEGER NOT NULL, `syncedCovid` INTEGER NOT NULL, `firstDose` INTEGER NOT NULL, `secondDose` INTEGER NOT NULL, `boosterDose` INTEGER NOT NULL, `boosterDose2` INTEGER NOT NULL, `johnson` INTEGER NOT NULL, `moderna` INTEGER NOT NULL, `pfizer` INTEGER NOT NULL, `astra` INTEGER NOT NULL, `routine` INTEGER NOT NULL, `aefi` INTEGER NOT NULL, `declinations` INTEGER NOT NULL, `state` TEXT, `lga` TEXT, `team` TEXT, `synced` INTEGER)');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `CovidVaccinationView` AS SELECT date, familyName, givenName, sex, dateOfBirth, dobEstimated, vaccinationNo,\n      uniqueId, pregnancyStatus, email, state, lga, address, phone, latLng, occupation,\n      occupationType, idType, idNumber, qrCode, historyOfAllergy, medicalConditions,\n      levelOfEducation, team, events, synced FROM CovidVaccination WHERE givenName IS NOT NULL\n      AND state IS NOT NULL AND lga IS NOT NULL AND team IS NOT NULL AND synced = 0');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `PictureView` AS SELECT vaccinationNo, picture FROM CovidVaccination WHERE givenName IS NOT NULL AND synced = 0');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CovidVaccinationDao get covidVaccinationDao {
    return _covidVaccinationDaoInstance ??=
        _$CovidVaccinationDao(database, changeListener);
  }

  @override
  StockDao get stockDao {
    return _stockDaoInstance ??= _$StockDao(database, changeListener);
  }

  @override
  DCTDao get dctDao {
    return _dctDaoInstance ??= _$DCTDao(database, changeListener);
  }

  @override
  RoutineVaccinationDao get routineVaccinationDao {
    return _routineVaccinationDaoInstance ??=
        _$RoutineVaccinationDao(database, changeListener);
  }

  @override
  DeclinationDao get declinationDao {
    return _declinationDaoInstance ??=
        _$DeclinationDao(database, changeListener);
  }

  @override
  AccountDao get accountDao {
    return _accountDaoInstance ??= _$AccountDao(database, changeListener);
  }

  @override
  AefiDao get aefiDao {
    return _aefiDaoInstance ??= _$AefiDao(database, changeListener);
  }

  @override
  SummaryDao get summaryDao {
    return _summaryDaoInstance ??= _$SummaryDao(database, changeListener);
  }
}

class _$CovidVaccinationDao extends CovidVaccinationDao {
  _$CovidVaccinationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _covidVaccinationInsertionAdapter = InsertionAdapter(
            database,
            'CovidVaccination',
            (CovidVaccination item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'familyName': item.familyName,
                  'givenName': item.givenName,
                  'sex': item.sex,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'dobEstimated': item.dobEstimated == null
                      ? null
                      : (item.dobEstimated! ? 1 : 0),
                  'vaccinationNo': item.vaccinationNo,
                  'uniqueId': item.uniqueId,
                  'pregnancyStatus': item.pregnancyStatus,
                  'email': item.email,
                  'state': item.state,
                  'lga': item.lga,
                  'address': item.address,
                  'phone': item.phone,
                  'latLng': _latLngConverter.encode(item.latLng),
                  'occupation': item.occupation,
                  'occupationType': item.occupationType,
                  'idType': item.idType,
                  'idNumber': item.idNumber,
                  'qrCode': item.qrCode,
                  'historyOfAllergy': item.historyOfAllergy == null
                      ? null
                      : (item.historyOfAllergy! ? 1 : 0),
                  'medicalConditions': _medicalConditionsConverter
                      .encode(item.medicalConditions),
                  'picture': item.picture,
                  'levelOfEducation': item.levelOfEducation,
                  'team': item.team,
                  'events': _listVaccinationEventsConverter.encode(item.events),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                }),
        _covidVaccinationUpdateAdapter = UpdateAdapter(
            database,
            'CovidVaccination',
            ['id'],
            (CovidVaccination item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'familyName': item.familyName,
                  'givenName': item.givenName,
                  'sex': item.sex,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'dobEstimated': item.dobEstimated == null
                      ? null
                      : (item.dobEstimated! ? 1 : 0),
                  'vaccinationNo': item.vaccinationNo,
                  'uniqueId': item.uniqueId,
                  'pregnancyStatus': item.pregnancyStatus,
                  'email': item.email,
                  'state': item.state,
                  'lga': item.lga,
                  'address': item.address,
                  'phone': item.phone,
                  'latLng': _latLngConverter.encode(item.latLng),
                  'occupation': item.occupation,
                  'occupationType': item.occupationType,
                  'idType': item.idType,
                  'idNumber': item.idNumber,
                  'qrCode': item.qrCode,
                  'historyOfAllergy': item.historyOfAllergy == null
                      ? null
                      : (item.historyOfAllergy! ? 1 : 0),
                  'medicalConditions': _medicalConditionsConverter
                      .encode(item.medicalConditions),
                  'picture': item.picture,
                  'levelOfEducation': item.levelOfEducation,
                  'team': item.team,
                  'events': _listVaccinationEventsConverter.encode(item.events),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CovidVaccination> _covidVaccinationInsertionAdapter;

  final UpdateAdapter<CovidVaccination> _covidVaccinationUpdateAdapter;

  @override
  Future<List<CovidVaccination>> findAll(int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CovidVaccination WHERE givenName IS NOT NULL LIMIT 5 OFFSET ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), familyName: row['familyName'] as String?, givenName: row['givenName'] as String?, sex: row['sex'] as String?, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), dobEstimated: row['dobEstimated'] == null ? null : (row['dobEstimated'] as int) != 0, pregnancyStatus: row['pregnancyStatus'] as String?, vaccinationNo: row['vaccinationNo'] as String?, email: row['email'] as String?, state: row['state'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, address: row['address'] as String?, phone: row['phone'] as String?, latLng: _latLngConverter.decode(row['latLng'] as String), idType: row['idType'] as String?, idNumber: row['idNumber'] as String?, occupation: row['occupation'] as String?, occupationType: row['occupationType'] as String?, qrCode: row['qrCode'] as String?, historyOfAllergy: row['historyOfAllergy'] == null ? null : (row['historyOfAllergy'] as int) != 0, events: _listVaccinationEventsConverter.decode(row['events'] as String), levelOfEducation: row['levelOfEducation'] as String?, medicalConditions: _medicalConditionsConverter.decode(row['medicalConditions'] as String), picture: row['picture'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [offset]);
  }

  @override
  Future<int?> numberPages() async {
    return _queryAdapter.query(
        'SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM CovidVaccination',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<CovidVaccination>> findUnSynced(int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CovidVaccination WHERE givenName IS NOT NULL AND synced = 0 LIMIT 1 OFFSET ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), familyName: row['familyName'] as String?, givenName: row['givenName'] as String?, sex: row['sex'] as String?, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), dobEstimated: row['dobEstimated'] == null ? null : (row['dobEstimated'] as int) != 0, pregnancyStatus: row['pregnancyStatus'] as String?, vaccinationNo: row['vaccinationNo'] as String?, email: row['email'] as String?, state: row['state'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, address: row['address'] as String?, phone: row['phone'] as String?, latLng: _latLngConverter.decode(row['latLng'] as String), idType: row['idType'] as String?, idNumber: row['idNumber'] as String?, occupation: row['occupation'] as String?, occupationType: row['occupationType'] as String?, qrCode: row['qrCode'] as String?, historyOfAllergy: row['historyOfAllergy'] == null ? null : (row['historyOfAllergy'] as int) != 0, events: _listVaccinationEventsConverter.decode(row['events'] as String), levelOfEducation: row['levelOfEducation'] as String?, medicalConditions: _medicalConditionsConverter.decode(row['medicalConditions'] as String), picture: row['picture'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [offset]);
  }

  @override
  Future<CovidVaccination?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM CovidVaccination WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            dobEstimated: row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            pregnancyStatus: row['pregnancyStatus'] as String?,
            vaccinationNo: row['vaccinationNo'] as String?,
            email: row['email'] as String?,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            latLng: _latLngConverter.decode(row['latLng'] as String),
            idType: row['idType'] as String?,
            idNumber: row['idNumber'] as String?,
            occupation: row['occupation'] as String?,
            occupationType: row['occupationType'] as String?,
            qrCode: row['qrCode'] as String?,
            historyOfAllergy: row['historyOfAllergy'] == null
                ? null
                : (row['historyOfAllergy'] as int) != 0,
            events:
                _listVaccinationEventsConverter.decode(row['events'] as String),
            levelOfEducation: row['levelOfEducation'] as String?,
            medicalConditions: _medicalConditionsConverter
                .decode(row['medicalConditions'] as String),
            picture: row['picture'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<CovidVaccination?> findByQrCode(String qrCode) async {
    return _queryAdapter.query(
        'SELECT * FROM CovidVaccination WHERE qrCode = ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            dobEstimated: row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            pregnancyStatus: row['pregnancyStatus'] as String?,
            vaccinationNo: row['vaccinationNo'] as String?,
            email: row['email'] as String?,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            latLng: _latLngConverter.decode(row['latLng'] as String),
            idType: row['idType'] as String?,
            idNumber: row['idNumber'] as String?,
            occupation: row['occupation'] as String?,
            occupationType: row['occupationType'] as String?,
            qrCode: row['qrCode'] as String?,
            historyOfAllergy: row['historyOfAllergy'] == null
                ? null
                : (row['historyOfAllergy'] as int) != 0,
            events:
                _listVaccinationEventsConverter.decode(row['events'] as String),
            levelOfEducation: row['levelOfEducation'] as String?,
            medicalConditions: _medicalConditionsConverter
                .decode(row['medicalConditions'] as String),
            picture: row['picture'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [qrCode]);
  }

  @override
  Future<List<CovidVaccination>> findByVaccinationNo(
      String vaccinationNo) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CovidVaccination WHERE vaccinationNo = ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            dobEstimated: row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            pregnancyStatus: row['pregnancyStatus'] as String?,
            vaccinationNo: row['vaccinationNo'] as String?,
            email: row['email'] as String?,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            latLng: _latLngConverter.decode(row['latLng'] as String),
            idType: row['idType'] as String?,
            idNumber: row['idNumber'] as String?,
            occupation: row['occupation'] as String?,
            occupationType: row['occupationType'] as String?,
            qrCode: row['qrCode'] as String?,
            historyOfAllergy: row['historyOfAllergy'] == null
                ? null
                : (row['historyOfAllergy'] as int) != 0,
            events:
                _listVaccinationEventsConverter.decode(row['events'] as String),
            levelOfEducation: row['levelOfEducation'] as String?,
            medicalConditions: _medicalConditionsConverter
                .decode(row['medicalConditions'] as String),
            picture: row['picture'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [vaccinationNo]);
  }

  @override
  Future<List<CovidVaccination>> findByKeyword(String keyword) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CovidVaccination WHERE (LOWER(givenName) LIKE LOWER(?1)        OR LOWER(familyName) LIKE LOWER(?1) OR LOWER(vaccinationNo) like LOWER(?1))        AND givenName IS NOT NULL ORDER BY givenName, familyName LIMIT 5',
        mapper: (Map<String, Object?> row) => CovidVaccination(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), familyName: row['familyName'] as String?, givenName: row['givenName'] as String?, sex: row['sex'] as String?, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), dobEstimated: row['dobEstimated'] == null ? null : (row['dobEstimated'] as int) != 0, pregnancyStatus: row['pregnancyStatus'] as String?, vaccinationNo: row['vaccinationNo'] as String?, email: row['email'] as String?, state: row['state'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, address: row['address'] as String?, phone: row['phone'] as String?, latLng: _latLngConverter.decode(row['latLng'] as String), idType: row['idType'] as String?, idNumber: row['idNumber'] as String?, occupation: row['occupation'] as String?, occupationType: row['occupationType'] as String?, qrCode: row['qrCode'] as String?, historyOfAllergy: row['historyOfAllergy'] == null ? null : (row['historyOfAllergy'] as int) != 0, events: _listVaccinationEventsConverter.decode(row['events'] as String), levelOfEducation: row['levelOfEducation'] as String?, medicalConditions: _medicalConditionsConverter.decode(row['medicalConditions'] as String), picture: row['picture'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [keyword]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM CovidVaccination WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter.queryNoReturn(
        'UPDATE CovidVaccination SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> recordRecordSynced(String vaccinationNo) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE CovidVaccination SET synced = 1 WHERE vaccinationNo = ?1',
        arguments: [vaccinationNo]);
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM CovidVaccination WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<List<CovidVaccination>> getVaccinations(DateTime date) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CovidVaccination WHERE date >= ?1',
        mapper: (Map<String, Object?> row) => CovidVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            dobEstimated: row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            pregnancyStatus: row['pregnancyStatus'] as String?,
            vaccinationNo: row['vaccinationNo'] as String?,
            email: row['email'] as String?,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            latLng: _latLngConverter.decode(row['latLng'] as String),
            idType: row['idType'] as String?,
            idNumber: row['idNumber'] as String?,
            occupation: row['occupation'] as String?,
            occupationType: row['occupationType'] as String?,
            qrCode: row['qrCode'] as String?,
            historyOfAllergy: row['historyOfAllergy'] == null
                ? null
                : (row['historyOfAllergy'] as int) != 0,
            events:
                _listVaccinationEventsConverter.decode(row['events'] as String),
            levelOfEducation: row['levelOfEducation'] as String?,
            medicalConditions: _medicalConditionsConverter
                .decode(row['medicalConditions'] as String),
            picture: row['picture'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<List<CovidVaccinationView>> getVaccinationView() async {
    return _queryAdapter.queryList('SELECT * FROM CovidVaccinationView',
        mapper: (Map<String, Object?> row) => CovidVaccinationView(
            _dateTimeConverter.decode(row['date'] as int),
            row['familyName'] as String,
            row['givenName'] as String,
            row['sex'] as String,
            _dateTimeConverter.decode(row['dateOfBirth'] as int),
            row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            row['vaccinationNo'] as String,
            row['uniqueId'] as String?,
            row['pregnancyStatus'] as String?,
            row['email'] as String?,
            row['state'] as String?,
            row['lga'] as String?,
            row['address'] as String?,
            row['phone'] as String?,
            _latLngConverter.decode(row['latLng'] as String),
            row['occupation'] as String?,
            row['occupationType'] as String?,
            row['idType'] as String?,
            row['idNumber'] as String?,
            row['qrCode'] as String?,
            row['historyOfAllergy'] == null
                ? null
                : (row['historyOfAllergy'] as int) != 0,
            _medicalConditionsConverter
                .decode(row['medicalConditions'] as String),
            row['levelOfEducation'] as String?,
            row['team'] as String?,
            _listVaccinationEventsConverter.decode(row['events'] as String),
            (row['synced'] as int) != 0));
  }

  @override
  Future<PictureView?> getPictureView(String vaccinationNo) async {
    return _queryAdapter.query(
        'SELECT * FROM PictureView WHERE vaccinationNo = ?1',
        mapper: (Map<String, Object?> row) => PictureView(
            row['vaccinationNo'] as String?, row['picture'] as String?),
        arguments: [vaccinationNo]);
  }

  @override
  Future<List<PictureView>> getPictureViewList(int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM PictureView LIMIT 5 OFFSET ?1',
        mapper: (Map<String, Object?> row) => PictureView(
            row['vaccinationNo'] as String?, row['picture'] as String?),
        arguments: [offset]);
  }

  @override
  Future<int?> picturePages() async {
    return _queryAdapter.query(
        'SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM PictureView',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int> insertRecord(CovidVaccination vaccination) {
    return _covidVaccinationInsertionAdapter.insertAndReturnId(
        vaccination, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(CovidVaccination vaccination) async {
    await _covidVaccinationUpdateAdapter.update(
        vaccination, OnConflictStrategy.abort);
  }
}

class _$StockDao extends StockDao {
  _$StockDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _stockInsertionAdapter = InsertionAdapter(
            database,
            'stock',
            (Stock item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'state': item.state,
                  'team': item.team,
                  'lga': item.lga,
                  'opening': _listStockEntryConverter.encode(item.opening),
                  'used': _stockStateConverter.encode(item.used),
                  'discarded': _stockStateConverter.encode(item.discarded),
                  'returned': _stockStateConverter.encode(item.returned),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                }),
        _stockUpdateAdapter = UpdateAdapter(
            database,
            'stock',
            ['id'],
            (Stock item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'state': item.state,
                  'team': item.team,
                  'lga': item.lga,
                  'opening': _listStockEntryConverter.encode(item.opening),
                  'used': _stockStateConverter.encode(item.used),
                  'discarded': _stockStateConverter.encode(item.discarded),
                  'returned': _stockStateConverter.encode(item.returned),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Stock> _stockInsertionAdapter;

  final UpdateAdapter<Stock> _stockUpdateAdapter;

  @override
  Future<List<Stock>> findAll(
    String state,
    String lga,
    String team,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Stock WHERE state = ?1 AND lga = ?2 AND team = ?3 ORDER BY DATE DESC LIMIT 20',
        mapper: (Map<String, Object?> row) => Stock(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), state: row['state'] as String?, team: row['team'] as String?, lga: row['lga'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0, opening: _listStockEntryConverter.decode(row['opening'] as String), used: _stockStateConverter.decode(row['used'] as String), discarded: _stockStateConverter.decode(row['discarded'] as String), returned: _stockStateConverter.decode(row['returned'] as String)),
        arguments: [state, lga, team]);
  }

  @override
  Future<List<Stock>> getLatest(
    String state,
    String lga,
    String team,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Stock WHERE state = ?1 AND lga = ?2 AND team = ?3 ORDER BY date DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => Stock(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), state: row['state'] as String?, team: row['team'] as String?, lga: row['lga'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0, opening: _listStockEntryConverter.decode(row['opening'] as String), used: _stockStateConverter.decode(row['used'] as String), discarded: _stockStateConverter.decode(row['discarded'] as String), returned: _stockStateConverter.decode(row['returned'] as String)),
        arguments: [state, lga, team]);
  }

  @override
  Future<List<Stock>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Stock',
        mapper: (Map<String, Object?> row) => Stock(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            team: row['team'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            opening: _listStockEntryConverter.decode(row['opening'] as String),
            used: _stockStateConverter.decode(row['used'] as String),
            discarded: _stockStateConverter.decode(row['discarded'] as String),
            returned: _stockStateConverter.decode(row['returned'] as String)));
  }

  @override
  Future<Stock?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Stock WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Stock(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            team: row['team'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            opening: _listStockEntryConverter.decode(row['opening'] as String),
            used: _stockStateConverter.decode(row['used'] as String),
            discarded: _stockStateConverter.decode(row['discarded'] as String),
            returned: _stockStateConverter.decode(row['returned'] as String)),
        arguments: [id]);
  }

  @override
  Future<Stock?> findByTeamAndDate(
    String team,
    DateTime date,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM Stock WHERE team = ?1 AND date = ?2 LIMIT 1',
        mapper: (Map<String, Object?> row) => Stock(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            team: row['team'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            opening: _listStockEntryConverter.decode(row['opening'] as String),
            used: _stockStateConverter.decode(row['used'] as String),
            discarded: _stockStateConverter.decode(row['discarded'] as String),
            returned: _stockStateConverter.decode(row['returned'] as String)),
        arguments: [team, _dateTimeConverter.encode(date)]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Stock WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter
        .queryNoReturn('UPDATE Stock SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM Stock WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<void> insertRecord(Stock stock) async {
    await _stockInsertionAdapter.insert(stock, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(Stock stock) async {
    await _stockUpdateAdapter.update(stock, OnConflictStrategy.abort);
  }
}

class _$DCTDao extends DCTDao {
  _$DCTDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _dCTInsertionAdapter = InsertionAdapter(
            database,
            'DCT',
            (DCT item) => <String, Object?>{
                  'id': item.id,
                  'vaccineCards': item.vaccineCards,
                  'qrCodes': item.qrCodes,
                  'vaccineRegisters': item.vaccineRegisters,
                  'tallyRegisters': item.tallyRegisters,
                  'date': _dateTimeConverter.encode(item.date),
                  'state': item.state,
                  'team': item.team,
                  'lga': item.lga,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                },
            changeListener),
        _dCTUpdateAdapter = UpdateAdapter(
            database,
            'DCT',
            ['id'],
            (DCT item) => <String, Object?>{
                  'id': item.id,
                  'vaccineCards': item.vaccineCards,
                  'qrCodes': item.qrCodes,
                  'vaccineRegisters': item.vaccineRegisters,
                  'tallyRegisters': item.tallyRegisters,
                  'date': _dateTimeConverter.encode(item.date),
                  'state': item.state,
                  'team': item.team,
                  'lga': item.lga,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DCT> _dCTInsertionAdapter;

  final UpdateAdapter<DCT> _dCTUpdateAdapter;

  @override
  Future<List<DCT>> findAll(String team) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DCT WHERE team = ?1 ORDER BY date DESC',
        mapper: (Map<String, Object?> row) => DCT(
            id: row['id'] as int?,
            vaccineCards: row['vaccineCards'] as int?,
            qrCodes: row['qrCodes'] as int?,
            vaccineRegisters: row['vaccineRegisters'] as int?,
            tallyRegisters: row['tallyRegisters'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            team: row['team'] as String?),
        arguments: [team]);
  }

  @override
  Future<List<DCT>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM DCT',
        mapper: (Map<String, Object?> row) => DCT(
            id: row['id'] as int?,
            vaccineCards: row['vaccineCards'] as int?,
            qrCodes: row['qrCodes'] as int?,
            vaccineRegisters: row['vaccineRegisters'] as int?,
            tallyRegisters: row['tallyRegisters'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            team: row['team'] as String?));
  }

  @override
  Stream<DCT?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM DCT WHERE id = ?1',
        mapper: (Map<String, Object?> row) => DCT(
            id: row['id'] as int?,
            vaccineCards: row['vaccineCards'] as int?,
            qrCodes: row['qrCodes'] as int?,
            vaccineRegisters: row['vaccineRegisters'] as int?,
            tallyRegisters: row['tallyRegisters'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            team: row['team'] as String?),
        arguments: [id],
        queryableName: 'DCT',
        isView: false);
  }

  @override
  Future<List<DCT>> findByTeamAndDate(
    String team,
    DateTime date,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DCT WHERE team = ?1 AND date = ?2',
        mapper: (Map<String, Object?> row) => DCT(
            id: row['id'] as int?,
            vaccineCards: row['vaccineCards'] as int?,
            qrCodes: row['qrCodes'] as int?,
            vaccineRegisters: row['vaccineRegisters'] as int?,
            tallyRegisters: row['tallyRegisters'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            team: row['team'] as String?),
        arguments: [team, _dateTimeConverter.encode(date)]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM DCT WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter
        .queryNoReturn('UPDATE DCT SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM DCT WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<void> insertRecord(DCT stock) async {
    await _dCTInsertionAdapter.insert(stock, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(DCT stock) async {
    await _dCTUpdateAdapter.update(stock, OnConflictStrategy.abort);
  }
}

class _$RoutineVaccinationDao extends RoutineVaccinationDao {
  _$RoutineVaccinationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _routineVaccinationInsertionAdapter = InsertionAdapter(
            database,
            'RoutineVaccination',
            (RoutineVaccination item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'familyName': item.familyName,
                  'givenName': item.givenName,
                  'sex': item.sex,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'vaccinationNo': item.vaccinationNo,
                  'stateOfOrigin': item.stateOfOrigin,
                  'lgaOfOrigin': item.lgaOfOrigin,
                  'nationality': item.nationality,
                  'address': item.address,
                  'state': item.state,
                  'lga': item.lga,
                  'team': item.team,
                  'fromBirth': _fromBirthConverter.encode(item.fromBirth),
                  'from6Weeks': _from6WeeksConverter.encode(item.from6Weeks),
                  'from10Weeks': _from10WeeksConverter.encode(item.from10Weeks),
                  'from14Weeks': _from14WeeksConverter.encode(item.from14Weeks),
                  'from6Months': _from6MonthsConverter.encode(item.from6Months),
                  'from9Months': _from9MonthsConverter.encode(item.from9Months),
                  'from12Months':
                      _from12MonthsConverter.encode(item.from12Months),
                  'from15Months':
                      _from15MonthsConverter.encode(item.from15Months),
                  'from9Years': _from9YearsConverter.encode(item.from9Years),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0),
                  'caregiver': item.caregiver,
                  'caregiverPhone': item.caregiverPhone,
                  'caregiverGender': item.caregiverGender,
                  'caregiverRelationship': item.caregiverRelationship
                }),
        _routineVaccinationUpdateAdapter = UpdateAdapter(
            database,
            'RoutineVaccination',
            ['id'],
            (RoutineVaccination item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'familyName': item.familyName,
                  'givenName': item.givenName,
                  'sex': item.sex,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'vaccinationNo': item.vaccinationNo,
                  'stateOfOrigin': item.stateOfOrigin,
                  'lgaOfOrigin': item.lgaOfOrigin,
                  'nationality': item.nationality,
                  'address': item.address,
                  'state': item.state,
                  'lga': item.lga,
                  'team': item.team,
                  'fromBirth': _fromBirthConverter.encode(item.fromBirth),
                  'from6Weeks': _from6WeeksConverter.encode(item.from6Weeks),
                  'from10Weeks': _from10WeeksConverter.encode(item.from10Weeks),
                  'from14Weeks': _from14WeeksConverter.encode(item.from14Weeks),
                  'from6Months': _from6MonthsConverter.encode(item.from6Months),
                  'from9Months': _from9MonthsConverter.encode(item.from9Months),
                  'from12Months':
                      _from12MonthsConverter.encode(item.from12Months),
                  'from15Months':
                      _from15MonthsConverter.encode(item.from15Months),
                  'from9Years': _from9YearsConverter.encode(item.from9Years),
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0),
                  'caregiver': item.caregiver,
                  'caregiverPhone': item.caregiverPhone,
                  'caregiverGender': item.caregiverGender,
                  'caregiverRelationship': item.caregiverRelationship
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RoutineVaccination>
      _routineVaccinationInsertionAdapter;

  final UpdateAdapter<RoutineVaccination> _routineVaccinationUpdateAdapter;

  @override
  Future<List<RoutineVaccination>> findAll(int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RoutineVaccination WHERE givenName IS NOT NULL LIMIT 5 OFFSET ?1',
        mapper: (Map<String, Object?> row) => RoutineVaccination(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), familyName: row['familyName'] as String?, givenName: row['givenName'] as String?, sex: row['sex'] as String?, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), vaccinationNo: row['vaccinationNo'] as String?, nationality: row['nationality'] as String?, stateOfOrigin: row['stateOfOrigin'] as String?, lgaOfOrigin: row['lgaOfOrigin'] as String?, state: row['state'] as String?, address: row['address'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, caregiver: row['caregiver'] as String?, caregiverPhone: row['caregiverPhone'] as String?, caregiverGender: row['caregiverGender'] as String?, caregiverRelationship: row['caregiverRelationship'] as String?, fromBirth: _fromBirthConverter.decode(row['fromBirth'] as String), from6Weeks: _from6WeeksConverter.decode(row['from6Weeks'] as String), from10Weeks: _from10WeeksConverter.decode(row['from10Weeks'] as String), from14Weeks: _from14WeeksConverter.decode(row['from14Weeks'] as String), from6Months: _from6MonthsConverter.decode(row['from6Months'] as String), from9Months: _from9MonthsConverter.decode(row['from9Months'] as String), from12Months: _from12MonthsConverter.decode(row['from12Months'] as String), from15Months: _from15MonthsConverter.decode(row['from15Months'] as String), from9Years: _from9YearsConverter.decode(row['from9Years'] as String), synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [offset]);
  }

  @override
  Future<int?> numberPages() async {
    return _queryAdapter.query(
        'SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM RoutineVaccination',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<RoutineVaccination>> findUnSynced() async {
    return _queryAdapter.queryList(
        'SELECT * FROM RoutineVaccination WHERE givenName IS NOT NULL AND synced = 0',
        mapper: (Map<String, Object?> row) => RoutineVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            vaccinationNo: row['vaccinationNo'] as String?,
            nationality: row['nationality'] as String?,
            stateOfOrigin: row['stateOfOrigin'] as String?,
            lgaOfOrigin: row['lgaOfOrigin'] as String?,
            state: row['state'] as String?,
            address: row['address'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            caregiver: row['caregiver'] as String?,
            caregiverPhone: row['caregiverPhone'] as String?,
            caregiverGender: row['caregiverGender'] as String?,
            caregiverRelationship: row['caregiverRelationship'] as String?,
            fromBirth: _fromBirthConverter.decode(row['fromBirth'] as String),
            from6Weeks:
                _from6WeeksConverter.decode(row['from6Weeks'] as String),
            from10Weeks:
                _from10WeeksConverter.decode(row['from10Weeks'] as String),
            from14Weeks:
                _from14WeeksConverter.decode(row['from14Weeks'] as String),
            from6Months:
                _from6MonthsConverter.decode(row['from6Months'] as String),
            from9Months:
                _from9MonthsConverter.decode(row['from9Months'] as String),
            from12Months:
                _from12MonthsConverter.decode(row['from12Months'] as String),
            from15Months:
                _from15MonthsConverter.decode(row['from15Months'] as String),
            from9Years:
                _from9YearsConverter.decode(row['from9Years'] as String),
            synced:
                row['synced'] == null ? null : (row['synced'] as int) != 0));
  }

  @override
  Future<RoutineVaccination?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM RoutineVaccination WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RoutineVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            vaccinationNo: row['vaccinationNo'] as String?,
            nationality: row['nationality'] as String?,
            stateOfOrigin: row['stateOfOrigin'] as String?,
            lgaOfOrigin: row['lgaOfOrigin'] as String?,
            state: row['state'] as String?,
            address: row['address'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            caregiver: row['caregiver'] as String?,
            caregiverPhone: row['caregiverPhone'] as String?,
            caregiverGender: row['caregiverGender'] as String?,
            caregiverRelationship: row['caregiverRelationship'] as String?,
            fromBirth: _fromBirthConverter.decode(row['fromBirth'] as String),
            from6Weeks:
                _from6WeeksConverter.decode(row['from6Weeks'] as String),
            from10Weeks:
                _from10WeeksConverter.decode(row['from10Weeks'] as String),
            from14Weeks:
                _from14WeeksConverter.decode(row['from14Weeks'] as String),
            from6Months:
                _from6MonthsConverter.decode(row['from6Months'] as String),
            from9Months:
                _from9MonthsConverter.decode(row['from9Months'] as String),
            from12Months:
                _from12MonthsConverter.decode(row['from12Months'] as String),
            from15Months:
                _from15MonthsConverter.decode(row['from15Months'] as String),
            from9Years:
                _from9YearsConverter.decode(row['from9Years'] as String),
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<List<RoutineVaccination>> findByVaccinationNo(
      String vaccinationNo) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RoutineVaccination WHERE vaccinationNo = ?1',
        mapper: (Map<String, Object?> row) => RoutineVaccination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            familyName: row['familyName'] as String?,
            givenName: row['givenName'] as String?,
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            vaccinationNo: row['vaccinationNo'] as String?,
            nationality: row['nationality'] as String?,
            stateOfOrigin: row['stateOfOrigin'] as String?,
            lgaOfOrigin: row['lgaOfOrigin'] as String?,
            state: row['state'] as String?,
            address: row['address'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            caregiver: row['caregiver'] as String?,
            caregiverPhone: row['caregiverPhone'] as String?,
            caregiverGender: row['caregiverGender'] as String?,
            caregiverRelationship: row['caregiverRelationship'] as String?,
            fromBirth: _fromBirthConverter.decode(row['fromBirth'] as String),
            from6Weeks:
                _from6WeeksConverter.decode(row['from6Weeks'] as String),
            from10Weeks:
                _from10WeeksConverter.decode(row['from10Weeks'] as String),
            from14Weeks:
                _from14WeeksConverter.decode(row['from14Weeks'] as String),
            from6Months:
                _from6MonthsConverter.decode(row['from6Months'] as String),
            from9Months:
                _from9MonthsConverter.decode(row['from9Months'] as String),
            from12Months:
                _from12MonthsConverter.decode(row['from12Months'] as String),
            from15Months:
                _from15MonthsConverter.decode(row['from15Months'] as String),
            from9Years:
                _from9YearsConverter.decode(row['from9Years'] as String),
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [vaccinationNo]);
  }

  @override
  Future<List<RoutineVaccination>> findByKeyword(String keyword) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RoutineVaccination WHERE (LOWER(givenName) LIKE LOWER(?1)        OR LOWER(familyName) LIKE LOWER(?1) OR LOWER(vaccinationNo) like LOWER(?1))        AND givenName IS NOT NULL ORDER BY givenName, familyName LIMIT 5 OFFSET',
        mapper: (Map<String, Object?> row) => RoutineVaccination(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), familyName: row['familyName'] as String?, givenName: row['givenName'] as String?, sex: row['sex'] as String?, dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int), vaccinationNo: row['vaccinationNo'] as String?, nationality: row['nationality'] as String?, stateOfOrigin: row['stateOfOrigin'] as String?, lgaOfOrigin: row['lgaOfOrigin'] as String?, state: row['state'] as String?, address: row['address'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, caregiver: row['caregiver'] as String?, caregiverPhone: row['caregiverPhone'] as String?, caregiverGender: row['caregiverGender'] as String?, caregiverRelationship: row['caregiverRelationship'] as String?, fromBirth: _fromBirthConverter.decode(row['fromBirth'] as String), from6Weeks: _from6WeeksConverter.decode(row['from6Weeks'] as String), from10Weeks: _from10WeeksConverter.decode(row['from10Weeks'] as String), from14Weeks: _from14WeeksConverter.decode(row['from14Weeks'] as String), from6Months: _from6MonthsConverter.decode(row['from6Months'] as String), from9Months: _from9MonthsConverter.decode(row['from9Months'] as String), from12Months: _from12MonthsConverter.decode(row['from12Months'] as String), from15Months: _from15MonthsConverter.decode(row['from15Months'] as String), from9Years: _from9YearsConverter.decode(row['from9Years'] as String), synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [keyword]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM RoutineVaccination WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter.queryNoReturn(
        'UPDATE RoutineVaccination SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM RoutineVaccination WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<int> insertRecord(RoutineVaccination vaccination) {
    return _routineVaccinationInsertionAdapter.insertAndReturnId(
        vaccination, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(RoutineVaccination vaccination) async {
    await _routineVaccinationUpdateAdapter.update(
        vaccination, OnConflictStrategy.abort);
  }
}

class _$DeclinationDao extends DeclinationDao {
  _$DeclinationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _declinationInsertionAdapter = InsertionAdapter(
            database,
            'Declination',
            (Declination item) => <String, Object?>{
                  'id': item.id,
                  'sex': item.sex,
                  'dateOfBirth': _dateTimeConverter.encode(item.dateOfBirth),
                  'dobEstimated': item.dobEstimated == null
                      ? null
                      : (item.dobEstimated! ? 1 : 0),
                  'pregnancyStatus': item.pregnancyStatus,
                  'levelOfEducation': item.levelOfEducation,
                  'email': item.email,
                  'state': item.state,
                  'lga': item.lga,
                  'team': item.team,
                  'date': _dateTimeConverter.encode(item.date),
                  'address': item.address,
                  'phone': item.phone,
                  'latLng': _latLngConverter.encode(item.latLng),
                  'reasonsForDeclining': _declinationReasonsConverter
                      .encode(item.reasonsForDeclining),
                  'occupation': item.occupation,
                  'occupationType': item.occupationType,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Declination> _declinationInsertionAdapter;

  @override
  Future<List<Declination>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Declination',
        mapper: (Map<String, Object?> row) => Declination(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            sex: row['sex'] as String?,
            dateOfBirth: _dateTimeConverter.decode(row['dateOfBirth'] as int),
            dobEstimated: row['dobEstimated'] == null
                ? null
                : (row['dobEstimated'] as int) != 0,
            pregnancyStatus: row['pregnancyStatus'] as String?,
            email: row['email'] as String?,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            address: row['address'] as String?,
            phone: row['phone'] as String?,
            latLng: _latLngConverter.decode(row['latLng'] as String),
            reasonsForDeclining: _declinationReasonsConverter
                .decode(row['reasonsForDeclining'] as String),
            occupation: row['occupation'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0,
            occupationType: row['occupationType'] as String?));
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter
        .queryNoReturn('UPDATE Declination SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM Declination WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<int> insertRecord(Declination declination) {
    return _declinationInsertionAdapter.insertAndReturnId(
        declination, OnConflictStrategy.abort);
  }
}

class _$AccountDao extends AccountDao {
  _$AccountDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'Account',
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'team': item.team,
                  'lga': item.lga,
                  'state': item.state,
                  'artClinic':
                      item.artClinic == null ? null : (item.artClinic! ? 1 : 0),
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'lastSync': _dateTimeConverter.encode(item.lastSync)
                }),
        _accountUpdateAdapter = UpdateAdapter(
            database,
            'Account',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'team': item.team,
                  'lga': item.lga,
                  'state': item.state,
                  'artClinic':
                      item.artClinic == null ? null : (item.artClinic! ? 1 : 0),
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'lastSync': _dateTimeConverter.encode(item.lastSync)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  final UpdateAdapter<Account> _accountUpdateAdapter;

  @override
  Future<Account?> getAccount() async {
    return _queryAdapter.query('SELECT * FROM Account LIMIT 1',
        mapper: (Map<String, Object?> row) => Account(
            state: row['state'] as String,
            team: row['team'] as String,
            lga: row['lga'] as String,
            artClinic: row['artClinic'] == null
                ? null
                : (row['artClinic'] as int) != 0,
            accessToken: row['accessToken'] as String?,
            refreshToken: row['refreshToken'] as String?,
            lastSync: _dateTimeConverter.decode(row['lastSync'] as int)));
  }

  @override
  Future<List<Account>> getAccounts() async {
    return _queryAdapter.queryList('SELECT * FROM Account',
        mapper: (Map<String, Object?> row) => Account(
            state: row['state'] as String,
            team: row['team'] as String,
            lga: row['lga'] as String,
            artClinic: row['artClinic'] == null
                ? null
                : (row['artClinic'] as int) != 0,
            accessToken: row['accessToken'] as String?,
            refreshToken: row['refreshToken'] as String?,
            lastSync: _dateTimeConverter.decode(row['lastSync'] as int)));
  }

  @override
  Future<void> deleteAccount() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Account');
  }

  @override
  Future<int> insertAccount(Account account) {
    return _accountInsertionAdapter.insertAndReturnId(
        account, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAccount(Account account) async {
    await _accountUpdateAdapter.update(account, OnConflictStrategy.abort);
  }
}

class _$AefiDao extends AefiDao {
  _$AefiDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _aEFIInsertionAdapter = InsertionAdapter(
            database,
            'AEFI',
            (AEFI item) => <String, Object?>{
                  'id': item.id,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0),
                  'date': _dateTimeConverter.encode(item.date),
                  'type': item.type,
                  'lga': item.lga,
                  'state': item.state,
                  'ward': item.ward,
                  'healthFacility': item.healthFacility,
                  'vaccinationNo': item.vaccinationNo,
                  'vaccinations':
                      _listVaccinesConverter.encode(item.vaccinations),
                  'anaphylaxis': item.anaphylaxis == null
                      ? null
                      : (item.anaphylaxis! ? 1 : 0),
                  'anaphylaxisBp': item.anaphylaxisBp,
                  'anaphylaxisPulse': item.anaphylaxisPulse,
                  'syncope':
                      item.syncope == null ? null : (item.syncope! ? 1 : 0),
                  'syncopeBp': item.syncopeBp,
                  'syncopePulse': item.syncopePulse,
                  'seizures':
                      item.seizures == null ? null : (item.seizures! ? 1 : 0),
                  'seizuresType': item.seizuresType,
                  'severeLocalReaction1': item.severeLocalReaction1 == null
                      ? null
                      : (item.severeLocalReaction1! ? 1 : 0),
                  'severeLocalReaction2': item.severeLocalReaction2 == null
                      ? null
                      : (item.severeLocalReaction2! ? 1 : 0),
                  'abcess': item.abcess == null ? null : (item.abcess! ? 1 : 0),
                  'generalizedRash': item.generalizedRash == null
                      ? null
                      : (item.generalizedRash! ? 1 : 0),
                  'fever': item.fever == null ? null : (item.fever! ? 1 : 0),
                  'temperature': item.temperature,
                  'persistentCries': item.persistentCries == null
                      ? null
                      : (item.persistentCries! ? 1 : 0),
                  'sepsis': item.sepsis == null ? null : (item.sepsis! ? 1 : 0),
                  'encephalopathy': item.encephalopathy == null
                      ? null
                      : (item.encephalopathy! ? 1 : 0),
                  'toxicShock': item.toxicShock == null
                      ? null
                      : (item.toxicShock! ? 1 : 0),
                  'thrombocytopenia': item.thrombocytopenia == null
                      ? null
                      : (item.thrombocytopenia! ? 1 : 0),
                  'afp': item.afp == null ? null : (item.afp! ? 1 : 0),
                  'otherAdverseEffect': item.otherAdverseEffect,
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'hospitalized': item.hospitalized == null
                      ? null
                      : (item.hospitalized! ? 1 : 0),
                  'dateHealthFacilityNotified': _dateTimeConverter
                      .encode(item.dateHealthFacilityNotified),
                  'symptoms': item.symptoms,
                  'medicalHistory': item.medicalHistory,
                  'treatmentsReceived': item.treatmentsReceived,
                  'investigationDone': item.investigationDone == null
                      ? null
                      : (item.investigationDone! ? 1 : 0),
                  'hospitalized2': item.hospitalized2 == null
                      ? null
                      : (item.hospitalized2! ? 1 : 0),
                  'incapacitation': item.incapacitation == null
                      ? null
                      : (item.incapacitation! ? 1 : 0),
                  'threatToLife': item.threatToLife == null
                      ? null
                      : (item.threatToLife! ? 1 : 0),
                  'death': item.death == null ? null : (item.death! ? 1 : 0),
                  'congenitalAnomaly': item.congenitalAnomaly == null
                      ? null
                      : (item.congenitalAnomaly! ? 1 : 0),
                  'otherChallenges': item.otherChallenges,
                  'movedToReferenceCenter': item.movedToReferenceCenter == null
                      ? null
                      : (item.movedToReferenceCenter! ? 1 : 0),
                  'referenceCenter': item.referenceCenter,
                  'referenceCenterAddress': item.referenceCenterAddress,
                  'dateReferred': _dateTimeConverter.encode(item.dateReferred),
                  'outcome': item.outcome,
                  'dateOfDeath': _dateTimeConverter.encode(item.dateOfDeath),
                  'autopsy':
                      item.autopsy == null ? null : (item.autopsy! ? 1 : 0),
                  'dateOfReporting':
                      _dateTimeConverter.encode(item.dateOfReporting),
                  'reportType': item.reportType,
                  'reporter': item.reporter,
                  'designation': item.designation,
                  'phone': item.phone,
                  'email': item.email
                }),
        _aEFIUpdateAdapter = UpdateAdapter(
            database,
            'AEFI',
            ['id'],
            (AEFI item) => <String, Object?>{
                  'id': item.id,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0),
                  'date': _dateTimeConverter.encode(item.date),
                  'type': item.type,
                  'lga': item.lga,
                  'state': item.state,
                  'ward': item.ward,
                  'healthFacility': item.healthFacility,
                  'vaccinationNo': item.vaccinationNo,
                  'vaccinations':
                      _listVaccinesConverter.encode(item.vaccinations),
                  'anaphylaxis': item.anaphylaxis == null
                      ? null
                      : (item.anaphylaxis! ? 1 : 0),
                  'anaphylaxisBp': item.anaphylaxisBp,
                  'anaphylaxisPulse': item.anaphylaxisPulse,
                  'syncope':
                      item.syncope == null ? null : (item.syncope! ? 1 : 0),
                  'syncopeBp': item.syncopeBp,
                  'syncopePulse': item.syncopePulse,
                  'seizures':
                      item.seizures == null ? null : (item.seizures! ? 1 : 0),
                  'seizuresType': item.seizuresType,
                  'severeLocalReaction1': item.severeLocalReaction1 == null
                      ? null
                      : (item.severeLocalReaction1! ? 1 : 0),
                  'severeLocalReaction2': item.severeLocalReaction2 == null
                      ? null
                      : (item.severeLocalReaction2! ? 1 : 0),
                  'abcess': item.abcess == null ? null : (item.abcess! ? 1 : 0),
                  'generalizedRash': item.generalizedRash == null
                      ? null
                      : (item.generalizedRash! ? 1 : 0),
                  'fever': item.fever == null ? null : (item.fever! ? 1 : 0),
                  'temperature': item.temperature,
                  'persistentCries': item.persistentCries == null
                      ? null
                      : (item.persistentCries! ? 1 : 0),
                  'sepsis': item.sepsis == null ? null : (item.sepsis! ? 1 : 0),
                  'encephalopathy': item.encephalopathy == null
                      ? null
                      : (item.encephalopathy! ? 1 : 0),
                  'toxicShock': item.toxicShock == null
                      ? null
                      : (item.toxicShock! ? 1 : 0),
                  'thrombocytopenia': item.thrombocytopenia == null
                      ? null
                      : (item.thrombocytopenia! ? 1 : 0),
                  'afp': item.afp == null ? null : (item.afp! ? 1 : 0),
                  'otherAdverseEffect': item.otherAdverseEffect,
                  'dateStarted': _dateTimeConverter.encode(item.dateStarted),
                  'hospitalized': item.hospitalized == null
                      ? null
                      : (item.hospitalized! ? 1 : 0),
                  'dateHealthFacilityNotified': _dateTimeConverter
                      .encode(item.dateHealthFacilityNotified),
                  'symptoms': item.symptoms,
                  'medicalHistory': item.medicalHistory,
                  'treatmentsReceived': item.treatmentsReceived,
                  'investigationDone': item.investigationDone == null
                      ? null
                      : (item.investigationDone! ? 1 : 0),
                  'hospitalized2': item.hospitalized2 == null
                      ? null
                      : (item.hospitalized2! ? 1 : 0),
                  'incapacitation': item.incapacitation == null
                      ? null
                      : (item.incapacitation! ? 1 : 0),
                  'threatToLife': item.threatToLife == null
                      ? null
                      : (item.threatToLife! ? 1 : 0),
                  'death': item.death == null ? null : (item.death! ? 1 : 0),
                  'congenitalAnomaly': item.congenitalAnomaly == null
                      ? null
                      : (item.congenitalAnomaly! ? 1 : 0),
                  'otherChallenges': item.otherChallenges,
                  'movedToReferenceCenter': item.movedToReferenceCenter == null
                      ? null
                      : (item.movedToReferenceCenter! ? 1 : 0),
                  'referenceCenter': item.referenceCenter,
                  'referenceCenterAddress': item.referenceCenterAddress,
                  'dateReferred': _dateTimeConverter.encode(item.dateReferred),
                  'outcome': item.outcome,
                  'dateOfDeath': _dateTimeConverter.encode(item.dateOfDeath),
                  'autopsy':
                      item.autopsy == null ? null : (item.autopsy! ? 1 : 0),
                  'dateOfReporting':
                      _dateTimeConverter.encode(item.dateOfReporting),
                  'reportType': item.reportType,
                  'reporter': item.reporter,
                  'designation': item.designation,
                  'phone': item.phone,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AEFI> _aEFIInsertionAdapter;

  final UpdateAdapter<AEFI> _aEFIUpdateAdapter;

  @override
  Future<List<AEFI>> findAll(int offset) async {
    return _queryAdapter.queryList('SELECT * FROM AEFI LIMIT 5 OFFSET ?1',
        mapper: (Map<String, Object?> row) => AEFI(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            type: row['type'] as String,
            lga: row['lga'] as String,
            state: row['state'] as String,
            ward: row['ward'] as String,
            healthFacility: row['healthFacility'] as String,
            vaccinationNo: row['vaccinationNo'] as String,
            vaccinations:
                _listVaccinesConverter.decode(row['vaccinations'] as String),
            anaphylaxisBp: row['anaphylaxisBp'] as String?,
            anaphylaxisPulse: row['anaphylaxisPulse'] as int?,
            syncopeBp: row['syncopeBp'] as String?,
            syncopePulse: row['syncopePulse'] as int?,
            seizures:
                row['seizures'] == null ? null : (row['seizures'] as int) != 0,
            seizuresType: row['seizuresType'] as String?,
            severeLocalReaction1: row['severeLocalReaction1'] == null
                ? null
                : (row['severeLocalReaction1'] as int) != 0,
            severeLocalReaction2: row['severeLocalReaction2'] == null
                ? null
                : (row['severeLocalReaction2'] as int) != 0,
            abcess: row['abcess'] == null ? null : (row['abcess'] as int) != 0,
            anaphylaxis: row['anaphylaxis'] == null
                ? null
                : (row['anaphylaxis'] as int) != 0,
            syncope:
                row['syncope'] == null ? null : (row['syncope'] as int) != 0,
            generalizedRash: row['generalizedRash'] == null
                ? null
                : (row['generalizedRash'] as int) != 0,
            fever: row['fever'] == null ? null : (row['fever'] as int) != 0,
            temperature: row['temperature'] as int?,
            persistentCries: row['persistentCries'] == null
                ? null
                : (row['persistentCries'] as int) != 0,
            sepsis: row['sepsis'] == null ? null : (row['sepsis'] as int) != 0,
            encephalopathy: row['encephalopathy'] == null
                ? null
                : (row['encephalopathy'] as int) != 0,
            toxicShock: row['toxicShock'] == null
                ? null
                : (row['toxicShock'] as int) != 0,
            thrombocytopenia: row['thrombocytopenia'] == null
                ? null
                : (row['thrombocytopenia'] as int) != 0,
            afp: row['afp'] == null ? null : (row['afp'] as int) != 0,
            hospitalized2: row['hospitalized2'] == null
                ? null
                : (row['hospitalized2'] as int) != 0,
            otherAdverseEffect: row['otherAdverseEffect'] as String?,
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            hospitalized: row['hospitalized'] == null
                ? null
                : (row['hospitalized'] as int) != 0,
            dateHealthFacilityNotified: _dateTimeConverter
                .decode(row['dateHealthFacilityNotified'] as int),
            symptoms: row['symptoms'] as String?,
            medicalHistory: row['medicalHistory'] as String?,
            treatmentsReceived: row['treatmentsReceived'] as String?,
            investigationDone: row['investigationDone'] == null
                ? null
                : (row['investigationDone'] as int) != 0,
            incapacitation: row['incapacitation'] == null
                ? null
                : (row['incapacitation'] as int) != 0,
            threatToLife: row['threatToLife'] == null
                ? null
                : (row['threatToLife'] as int) != 0,
            death: row['death'] == null ? null : (row['death'] as int) != 0,
            congenitalAnomaly:
                row['congenitalAnomaly'] == null ? null : (row['congenitalAnomaly'] as int) != 0,
            otherChallenges: row['otherChallenges'] as String?,
            movedToReferenceCenter: row['movedToReferenceCenter'] == null ? null : (row['movedToReferenceCenter'] as int) != 0,
            referenceCenter: row['referenceCenter'] as String?,
            referenceCenterAddress: row['referenceCenterAddress'] as String?,
            dateReferred: _dateTimeConverter.decode(row['dateReferred'] as int),
            outcome: row['outcome'] as String?,
            dateOfDeath: _dateTimeConverter.decode(row['dateOfDeath'] as int),
            autopsy: row['autopsy'] == null ? null : (row['autopsy'] as int) != 0,
            dateOfReporting: _dateTimeConverter.decode(row['dateOfReporting'] as int),
            reportType: row['reportType'] as String,
            reporter: row['reporter'] as String,
            designation: row['designation'] as String,
            phone: row['phone'] as String?,
            email: row['email'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [offset]);
  }

  @override
  Future<int?> numberPages() async {
    return _queryAdapter.query(
        'SELECT CAST(COUNT(*)/5.0 AS INT ) + (COUNT(*)/5.0 > CAST (COUNT(*)/5.0 AS INT )) FROM AEFI',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<AEFI?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM AEFI WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AEFI(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            type: row['type'] as String,
            lga: row['lga'] as String,
            state: row['state'] as String,
            ward: row['ward'] as String,
            healthFacility: row['healthFacility'] as String,
            vaccinationNo: row['vaccinationNo'] as String,
            vaccinations:
                _listVaccinesConverter.decode(row['vaccinations'] as String),
            anaphylaxisBp: row['anaphylaxisBp'] as String?,
            anaphylaxisPulse: row['anaphylaxisPulse'] as int?,
            syncopeBp: row['syncopeBp'] as String?,
            syncopePulse: row['syncopePulse'] as int?,
            seizures:
                row['seizures'] == null ? null : (row['seizures'] as int) != 0,
            seizuresType: row['seizuresType'] as String?,
            severeLocalReaction1: row['severeLocalReaction1'] == null
                ? null
                : (row['severeLocalReaction1'] as int) != 0,
            severeLocalReaction2: row['severeLocalReaction2'] == null
                ? null
                : (row['severeLocalReaction2'] as int) != 0,
            abcess: row['abcess'] == null ? null : (row['abcess'] as int) != 0,
            anaphylaxis: row['anaphylaxis'] == null
                ? null
                : (row['anaphylaxis'] as int) != 0,
            syncope:
                row['syncope'] == null ? null : (row['syncope'] as int) != 0,
            generalizedRash: row['generalizedRash'] == null
                ? null
                : (row['generalizedRash'] as int) != 0,
            fever: row['fever'] == null ? null : (row['fever'] as int) != 0,
            temperature: row['temperature'] as int?,
            persistentCries: row['persistentCries'] == null
                ? null
                : (row['persistentCries'] as int) != 0,
            sepsis: row['sepsis'] == null ? null : (row['sepsis'] as int) != 0,
            encephalopathy: row['encephalopathy'] == null
                ? null
                : (row['encephalopathy'] as int) != 0,
            toxicShock: row['toxicShock'] == null
                ? null
                : (row['toxicShock'] as int) != 0,
            thrombocytopenia: row['thrombocytopenia'] == null
                ? null
                : (row['thrombocytopenia'] as int) != 0,
            afp: row['afp'] == null ? null : (row['afp'] as int) != 0,
            hospitalized2: row['hospitalized2'] == null
                ? null
                : (row['hospitalized2'] as int) != 0,
            otherAdverseEffect: row['otherAdverseEffect'] as String?,
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            hospitalized: row['hospitalized'] == null
                ? null
                : (row['hospitalized'] as int) != 0,
            dateHealthFacilityNotified: _dateTimeConverter
                .decode(row['dateHealthFacilityNotified'] as int),
            symptoms: row['symptoms'] as String?,
            medicalHistory: row['medicalHistory'] as String?,
            treatmentsReceived: row['treatmentsReceived'] as String?,
            investigationDone: row['investigationDone'] == null
                ? null
                : (row['investigationDone'] as int) != 0,
            incapacitation: row['incapacitation'] == null
                ? null
                : (row['incapacitation'] as int) != 0,
            threatToLife: row['threatToLife'] == null
                ? null
                : (row['threatToLife'] as int) != 0,
            death: row['death'] == null ? null : (row['death'] as int) != 0,
            congenitalAnomaly:
                row['congenitalAnomaly'] == null ? null : (row['congenitalAnomaly'] as int) != 0,
            otherChallenges: row['otherChallenges'] as String?,
            movedToReferenceCenter: row['movedToReferenceCenter'] == null ? null : (row['movedToReferenceCenter'] as int) != 0,
            referenceCenter: row['referenceCenter'] as String?,
            referenceCenterAddress: row['referenceCenterAddress'] as String?,
            dateReferred: _dateTimeConverter.decode(row['dateReferred'] as int),
            outcome: row['outcome'] as String?,
            dateOfDeath: _dateTimeConverter.decode(row['dateOfDeath'] as int),
            autopsy: row['autopsy'] == null ? null : (row['autopsy'] as int) != 0,
            dateOfReporting: _dateTimeConverter.decode(row['dateOfReporting'] as int),
            reportType: row['reportType'] as String,
            reporter: row['reporter'] as String,
            designation: row['designation'] as String,
            phone: row['phone'] as String?,
            email: row['email'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<List<AEFI>> findByKeyword(String keyword) async {
    return _queryAdapter.queryList(
        'SELECT * FROM AEFI WHERE LOWER(vaccinationNo) like LOWER(?1))        LIMIT 5',
        mapper: (Map<String, Object?> row) => AEFI(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), type: row['type'] as String, lga: row['lga'] as String, state: row['state'] as String, ward: row['ward'] as String, healthFacility: row['healthFacility'] as String, vaccinationNo: row['vaccinationNo'] as String, vaccinations: _listVaccinesConverter.decode(row['vaccinations'] as String), anaphylaxisBp: row['anaphylaxisBp'] as String?, anaphylaxisPulse: row['anaphylaxisPulse'] as int?, syncopeBp: row['syncopeBp'] as String?, syncopePulse: row['syncopePulse'] as int?, seizures: row['seizures'] == null ? null : (row['seizures'] as int) != 0, seizuresType: row['seizuresType'] as String?, severeLocalReaction1: row['severeLocalReaction1'] == null ? null : (row['severeLocalReaction1'] as int) != 0, severeLocalReaction2: row['severeLocalReaction2'] == null ? null : (row['severeLocalReaction2'] as int) != 0, abcess: row['abcess'] == null ? null : (row['abcess'] as int) != 0, anaphylaxis: row['anaphylaxis'] == null ? null : (row['anaphylaxis'] as int) != 0, syncope: row['syncope'] == null ? null : (row['syncope'] as int) != 0, generalizedRash: row['generalizedRash'] == null ? null : (row['generalizedRash'] as int) != 0, fever: row['fever'] == null ? null : (row['fever'] as int) != 0, temperature: row['temperature'] as int?, persistentCries: row['persistentCries'] == null ? null : (row['persistentCries'] as int) != 0, sepsis: row['sepsis'] == null ? null : (row['sepsis'] as int) != 0, encephalopathy: row['encephalopathy'] == null ? null : (row['encephalopathy'] as int) != 0, toxicShock: row['toxicShock'] == null ? null : (row['toxicShock'] as int) != 0, thrombocytopenia: row['thrombocytopenia'] == null ? null : (row['thrombocytopenia'] as int) != 0, afp: row['afp'] == null ? null : (row['afp'] as int) != 0, hospitalized2: row['hospitalized2'] == null ? null : (row['hospitalized2'] as int) != 0, otherAdverseEffect: row['otherAdverseEffect'] as String?, dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int), hospitalized: row['hospitalized'] == null ? null : (row['hospitalized'] as int) != 0, dateHealthFacilityNotified: _dateTimeConverter.decode(row['dateHealthFacilityNotified'] as int), symptoms: row['symptoms'] as String?, medicalHistory: row['medicalHistory'] as String?, treatmentsReceived: row['treatmentsReceived'] as String?, investigationDone: row['investigationDone'] == null ? null : (row['investigationDone'] as int) != 0, incapacitation: row['incapacitation'] == null ? null : (row['incapacitation'] as int) != 0, threatToLife: row['threatToLife'] == null ? null : (row['threatToLife'] as int) != 0, death: row['death'] == null ? null : (row['death'] as int) != 0, congenitalAnomaly: row['congenitalAnomaly'] == null ? null : (row['congenitalAnomaly'] as int) != 0, otherChallenges: row['otherChallenges'] as String?, movedToReferenceCenter: row['movedToReferenceCenter'] == null ? null : (row['movedToReferenceCenter'] as int) != 0, referenceCenter: row['referenceCenter'] as String?, referenceCenterAddress: row['referenceCenterAddress'] as String?, dateReferred: _dateTimeConverter.decode(row['dateReferred'] as int), outcome: row['outcome'] as String?, dateOfDeath: _dateTimeConverter.decode(row['dateOfDeath'] as int), autopsy: row['autopsy'] == null ? null : (row['autopsy'] as int) != 0, dateOfReporting: _dateTimeConverter.decode(row['dateOfReporting'] as int), reportType: row['reportType'] as String, reporter: row['reporter'] as String, designation: row['designation'] as String, phone: row['phone'] as String?, email: row['email'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [keyword]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM AEFI WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<List<AEFI>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM AEFI',
        mapper: (Map<String, Object?> row) => AEFI(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            type: row['type'] as String,
            lga: row['lga'] as String,
            state: row['state'] as String,
            ward: row['ward'] as String,
            healthFacility: row['healthFacility'] as String,
            vaccinationNo: row['vaccinationNo'] as String,
            vaccinations:
                _listVaccinesConverter.decode(row['vaccinations'] as String),
            anaphylaxisBp: row['anaphylaxisBp'] as String?,
            anaphylaxisPulse: row['anaphylaxisPulse'] as int?,
            syncopeBp: row['syncopeBp'] as String?,
            syncopePulse: row['syncopePulse'] as int?,
            seizures:
                row['seizures'] == null ? null : (row['seizures'] as int) != 0,
            seizuresType: row['seizuresType'] as String?,
            severeLocalReaction1: row['severeLocalReaction1'] == null
                ? null
                : (row['severeLocalReaction1'] as int) != 0,
            severeLocalReaction2: row['severeLocalReaction2'] == null
                ? null
                : (row['severeLocalReaction2'] as int) != 0,
            abcess: row['abcess'] == null ? null : (row['abcess'] as int) != 0,
            anaphylaxis: row['anaphylaxis'] == null
                ? null
                : (row['anaphylaxis'] as int) != 0,
            syncope:
                row['syncope'] == null ? null : (row['syncope'] as int) != 0,
            generalizedRash: row['generalizedRash'] == null
                ? null
                : (row['generalizedRash'] as int) != 0,
            fever: row['fever'] == null ? null : (row['fever'] as int) != 0,
            temperature: row['temperature'] as int?,
            persistentCries: row['persistentCries'] == null
                ? null
                : (row['persistentCries'] as int) != 0,
            sepsis: row['sepsis'] == null ? null : (row['sepsis'] as int) != 0,
            encephalopathy: row['encephalopathy'] == null
                ? null
                : (row['encephalopathy'] as int) != 0,
            toxicShock: row['toxicShock'] == null
                ? null
                : (row['toxicShock'] as int) != 0,
            thrombocytopenia: row['thrombocytopenia'] == null
                ? null
                : (row['thrombocytopenia'] as int) != 0,
            afp: row['afp'] == null ? null : (row['afp'] as int) != 0,
            hospitalized2: row['hospitalized2'] == null
                ? null
                : (row['hospitalized2'] as int) != 0,
            otherAdverseEffect: row['otherAdverseEffect'] as String?,
            dateStarted: _dateTimeConverter.decode(row['dateStarted'] as int),
            hospitalized: row['hospitalized'] == null
                ? null
                : (row['hospitalized'] as int) != 0,
            dateHealthFacilityNotified: _dateTimeConverter
                .decode(row['dateHealthFacilityNotified'] as int),
            symptoms: row['symptoms'] as String?,
            medicalHistory: row['medicalHistory'] as String?,
            treatmentsReceived: row['treatmentsReceived'] as String?,
            investigationDone: row['investigationDone'] == null
                ? null
                : (row['investigationDone'] as int) != 0,
            incapacitation: row['incapacitation'] == null
                ? null
                : (row['incapacitation'] as int) != 0,
            threatToLife: row['threatToLife'] == null
                ? null
                : (row['threatToLife'] as int) != 0,
            death: row['death'] == null ? null : (row['death'] as int) != 0,
            congenitalAnomaly:
                row['congenitalAnomaly'] == null ? null : (row['congenitalAnomaly'] as int) != 0,
            otherChallenges: row['otherChallenges'] as String?,
            movedToReferenceCenter: row['movedToReferenceCenter'] == null ? null : (row['movedToReferenceCenter'] as int) != 0,
            referenceCenter: row['referenceCenter'] as String?,
            referenceCenterAddress: row['referenceCenterAddress'] as String?,
            dateReferred: _dateTimeConverter.decode(row['dateReferred'] as int),
            outcome: row['outcome'] as String?,
            dateOfDeath: _dateTimeConverter.decode(row['dateOfDeath'] as int),
            autopsy: row['autopsy'] == null ? null : (row['autopsy'] as int) != 0,
            dateOfReporting: _dateTimeConverter.decode(row['dateOfReporting'] as int),
            reportType: row['reportType'] as String,
            reporter: row['reporter'] as String,
            designation: row['designation'] as String,
            phone: row['phone'] as String?,
            email: row['email'] as String?,
            synced: row['synced'] == null ? null : (row['synced'] as int) != 0));
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter
        .queryNoReturn('UPDATE AEFI SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM AEFI WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<int> insertRecord(AEFI aefi) {
    return _aEFIInsertionAdapter.insertAndReturnId(
        aefi, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(AEFI aefi) async {
    await _aEFIUpdateAdapter.update(aefi, OnConflictStrategy.abort);
  }
}

class _$SummaryDao extends SummaryDao {
  _$SummaryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _summaryInsertionAdapter = InsertionAdapter(
            database,
            'Summary',
            (Summary item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'stock': item.stock,
                  'covid': item.covid,
                  'syncedCovid': item.syncedCovid,
                  'firstDose': item.firstDose,
                  'secondDose': item.secondDose,
                  'boosterDose': item.boosterDose,
                  'boosterDose2': item.boosterDose2,
                  'johnson': item.johnson,
                  'moderna': item.moderna,
                  'pfizer': item.pfizer,
                  'astra': item.astra,
                  'routine': item.routine,
                  'aefi': item.aefi,
                  'declinations': item.declinations,
                  'state': item.state,
                  'lga': item.lga,
                  'team': item.team,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                }),
        _summaryUpdateAdapter = UpdateAdapter(
            database,
            'Summary',
            ['id'],
            (Summary item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'stock': item.stock,
                  'covid': item.covid,
                  'syncedCovid': item.syncedCovid,
                  'firstDose': item.firstDose,
                  'secondDose': item.secondDose,
                  'boosterDose': item.boosterDose,
                  'boosterDose2': item.boosterDose2,
                  'johnson': item.johnson,
                  'moderna': item.moderna,
                  'pfizer': item.pfizer,
                  'astra': item.astra,
                  'routine': item.routine,
                  'aefi': item.aefi,
                  'declinations': item.declinations,
                  'state': item.state,
                  'lga': item.lga,
                  'team': item.team,
                  'synced': item.synced == null ? null : (item.synced! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Summary> _summaryInsertionAdapter;

  final UpdateAdapter<Summary> _summaryUpdateAdapter;

  @override
  Future<List<Summary>> findUnSynced() async {
    return _queryAdapter.queryList('SELECT * FROM Summary',
        mapper: (Map<String, Object?> row) => Summary(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            stock: row['stock'] as int,
            covid: row['covid'] as int,
            syncedCovid: row['syncedCovid'] as int,
            firstDose: row['firstDose'] as int,
            secondDose: row['secondDose'] as int,
            boosterDose: row['boosterDose'] as int,
            boosterDose2: row['boosterDose2'] as int,
            johnson: row['johnson'] as int,
            routine: row['routine'] as int,
            pfizer: row['pfizer'] as int,
            astra: row['astra'] as int,
            aefi: row['aefi'] as int,
            declinations: row['declinations'] as int,
            moderna: row['moderna'] as int,
            state: row['state'] as String?,
            lga: row['lga'] as String?,
            team: row['team'] as String?,
            synced:
                row['synced'] == null ? null : (row['synced'] as int) != 0));
  }

  @override
  Future<Summary?> getCurrent(
    String state,
    String lga,
    String team,
    DateTime date,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM Summary WHERE state = ?1 AND lga = ?2 AND team = ?3        AND date = ?4 ORDER BY date DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => Summary(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), stock: row['stock'] as int, covid: row['covid'] as int, syncedCovid: row['syncedCovid'] as int, firstDose: row['firstDose'] as int, secondDose: row['secondDose'] as int, boosterDose: row['boosterDose'] as int, boosterDose2: row['boosterDose2'] as int, johnson: row['johnson'] as int, routine: row['routine'] as int, pfizer: row['pfizer'] as int, astra: row['astra'] as int, aefi: row['aefi'] as int, declinations: row['declinations'] as int, moderna: row['moderna'] as int, state: row['state'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [state, lga, team, _dateTimeConverter.encode(date)]);
  }

  @override
  Future<Summary?> getLatest(
    String state,
    String lga,
    String team,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM Summary WHERE state = ?1 AND lga = ?2 AND team = ?3        ORDER BY date DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => Summary(id: row['id'] as int?, date: _dateTimeConverter.decode(row['date'] as int), stock: row['stock'] as int, covid: row['covid'] as int, syncedCovid: row['syncedCovid'] as int, firstDose: row['firstDose'] as int, secondDose: row['secondDose'] as int, boosterDose: row['boosterDose'] as int, boosterDose2: row['boosterDose2'] as int, johnson: row['johnson'] as int, routine: row['routine'] as int, pfizer: row['pfizer'] as int, astra: row['astra'] as int, aefi: row['aefi'] as int, declinations: row['declinations'] as int, moderna: row['moderna'] as int, state: row['state'] as String?, lga: row['lga'] as String?, team: row['team'] as String?, synced: row['synced'] == null ? null : (row['synced'] as int) != 0),
        arguments: [state, lga, team]);
  }

  @override
  Future<void> recordSynced() async {
    await _queryAdapter
        .queryNoReturn('UPDATE Summary SET synced = 1 WHERE synced = 0');
  }

  @override
  Future<void> clearRecordsOlderThan(DateTime date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM Summary WHERE synced = 1 AND date < ?1',
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<int> insertRecord(Summary summary) {
    return _summaryInsertionAdapter.insertAndReturnId(
        summary, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecord(Summary summary) async {
    await _summaryUpdateAdapter.update(summary, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _declinationReasonsConverter = DeclinationReasonsConverter();
final _from6WeeksConverter = From6WeeksConverter();
final _from10WeeksConverter = From10WeeksConverter();
final _from14WeeksConverter = From14WeeksConverter();
final _fromBirthConverter = FromBirthConverter();
final _from15MonthsConverter = From15MonthsConverter();
final _from12MonthsConverter = From12MonthsConverter();
final _from9MonthsConverter = From9MonthsConverter();
final _from6MonthsConverter = From6MonthsConverter();
final _from9YearsConverter = From9YearsConverter();
final _latLngConverter = LatLngConverter();
final _listVaccinationEventsConverter = ListVaccinationEventsConverter();
final _listVaccinesConverter = ListVaccinesConverter();
final _listStockEntryConverter = ListStockEntryConverter();
final _medicalConditionsConverter = MedicalConditionsConverter();
final _stockEntryConverter = StockEntryConverter();
final _stockStateConverter = StockStateConverter();
