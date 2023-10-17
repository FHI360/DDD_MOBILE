import 'dart:ffi';

import 'package:DDD/app_state.dart';
import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/flutter_flow/nav/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
//import 'flutter_flow/flutter_flow_util.dart';
import 'package:sqlite3/open.dart';

String currentVersion = '2023.1 13-10-2023';
String databaseName = 'ddd.db';

void setupSqlCipher() {
  open.overrideFor(
      OperatingSystem.android, () => DynamicLibrary.open('libsqlcipher.so'));
}

final database = Database();

final _appStateNotifier = AppStateNotifier();
final router = createRouter(_appStateNotifier);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlutterFlowTheme.initialize();

  final appState = FFAppState();
  await FFAppState(). initializePersistedState();
  setupSqlCipher();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fr')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        useOnlyLangCode: true,
        child: MyApp()),
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

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: 'DDD',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ...context.localizationDelegates,
          MonthYearPickerLocalizations.delegate,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
