import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'backend/floor/database.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

String currentVersion = '1.0.9';
String databaseName = '_360vaxdatabase.db';

final migration1To2 = Migration(1, 2, (database) {
  database.execute('''
  ALTER TABLE CovidVaccination ADD COLUMN date INTEGER DEFAULT ${DateTime.now().millisecondsSinceEpoch};
  ''');
  database.execute('''
  ALTER TABLE RoutineVaccination ADD COLUMN date INTEGER DEFAULT ${DateTime.now().millisecondsSinceEpoch};
  ''');

  return Future(() => null);
});

final migration2To3 = Migration(2, 3, (database) async {
  try {
    await database.execute('''UPDATE CovidVaccination SET synced = false;''');
    await database.execute('''UPDATE RoutineVaccination SET synced = false;''');
    await database.execute('''UPDATE Stock SET synced = false;''');
    await database.execute('''UPDATE DCT SET synced = false;''');
    await database.execute('''UPDATE AEFI SET synced = false;''');
    await database.execute('''UPDATE Declination SET synced = false;''');
  } catch (e) {}
  try {
    await database.execute('''
  ALTER TABLE RoutineVaccination ADD COLUMN date INTEGER DEFAULT ${DateTime.now().millisecondsSinceEpoch};
  ''');
  } catch (e) {}

  return Future(() => null);
});

final migration3To4 = Migration(3, 4, (database) async {
  await database.execute(
      'CREATE TABLE IF NOT EXISTS `Summary` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` INTEGER NOT NULL, `stock` INTEGER NOT NULL, `covid` INTEGER NOT NULL, `firstDose` INTEGER NOT NULL, `secondDose` INTEGER NOT NULL, `boosterDose` INTEGER NOT NULL, `boosterDose2` INTEGER NOT NULL, `johnson` INTEGER NOT NULL, `moderna` INTEGER NOT NULL, `pfizer` INTEGER NOT NULL, `astra` INTEGER NOT NULL, `routine` INTEGER NOT NULL, `aefi` INTEGER NOT NULL, `declinations` INTEGER NOT NULL, `state` TEXT, `lga` TEXT, `team` TEXT, `synced` INTEGER NOT NULL)');
  return Future(() => null);
});

final migration4To5 = Migration(4, 5, (database) async {
  await database.execute('DELETE FROM `Summary` WHERE state IS NULL');
  return Future(() => null);
});

final migration5To6 = Migration(5, 6, (database) async {
  await database
      .execute('ALTER TABLE Summary ADD COLUMN syncedCovid INTEGER DEFAULT 0');
});

final migration6To7 = Migration(6, 7, (database) async {
  await database.execute(
      'CREATE VIEW IF NOT EXISTS `CovidVaccinationView` AS SELECT date, familyName, givenName, sex, dateOfBirth, dobEstimated, vaccinationNo, uniqueId, pregnancyStatus, email, state, lga, address, phone, latLng, occupation, occupationType, idType, idNumber, qrCode, historyOfAllergy, medicalConditions, levelOfEducation, team, events, synced FROM CovidVaccination WHERE givenName IS NOT NULL AND state IS NOT NULL AND lga IS NOT NULL AND team IS NOT NULL AND synced = 0');
  await database.execute(
      'CREATE VIEW IF NOT EXISTS `PictureView` AS SELECT vaccinationNo, picture FROM CovidVaccination WHERE givenName IS NOT NULL');
});

final migration7To8 = Migration(7, 8, (database) async {
  await database.execute('DROP VIEW IF EXISTS CovidVaccinationView');
  await database.execute('DROP VIEW IF EXISTS PictureView');
  await database.execute(
      'CREATE VIEW IF NOT EXISTS `CovidVaccinationView` AS SELECT date, familyName, givenName, sex, dateOfBirth, dobEstimated, vaccinationNo, uniqueId, pregnancyStatus, email, state, lga, address, phone, latLng, occupation, occupationType, idType, idNumber, qrCode, historyOfAllergy, medicalConditions, levelOfEducation, team, events, synced FROM CovidVaccination WHERE givenName IS NOT NULL AND state IS NOT NULL AND lga IS NOT NULL AND team IS NOT NULL AND synced = 0');
  await database.execute(
      'CREATE VIEW IF NOT EXISTS `PictureView` AS SELECT vaccinationNo, picture FROM CovidVaccination WHERE givenName IS NOT NULL AND synced = 0');
});

final migration8To9 = Migration(8, 9, (database) async {
  try {
    await database.execute(
        'ALTER TABLE Account ADD COLUMN lastSync INTEGER DEFAULT ${DateTime.now().millisecondsSinceEpoch}');
  } catch (e) {}
});

final database = $FloorAppDatabase.databaseBuilder(databaseName).addMigrations([
  migration1To2,
  migration2To3,
  migration3To4,
  migration4To5,
  migration5To6,
  migration6To7,
  migration7To8,
  migration8To9
]).build();

runMigrations() async {
  await database.then((value) async {
    try {
      await value.database.execute(
          'ALTER TABLE Account ADD COLUMN lastSync INTEGER DEFAULT ${DateTime.now().millisecondsSinceEpoch}');
    } catch (e) {}
  });
}

final _appStateNotifier = AppStateNotifier();
final router = createRouter(_appStateNotifier);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  runMigrations();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: '360VAX',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
        ],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
