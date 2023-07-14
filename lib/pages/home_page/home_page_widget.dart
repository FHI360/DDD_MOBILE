import 'dart:io';

import 'package:DDD/backend/http/account_service.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:DDD/main.dart';
import 'package:DDD/pages/drawer/drawer.widget.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../backend/http/sync_service.dart';
import 'home_page_model.dart';

export 'home_page_model.dart';

Future<void> downloadDatabase() async {
  final dbPath = await sqfliteDatabaseFactory.getDatabasePath(databaseName);

  var dir = await getExternalStorageDirectory();
  int idx = dir!.path.indexOf('Android');
  String path = dir.path.substring(0, idx) + 'Download/backup.db';

  File(dbPath).copySync(path);
  showToast(
    'Database successfully backed up to the Download folder',
    duration: Duration(seconds: 3),
    position: ToastPosition.bottom,
    backgroundColor: Colors.green,
    radius: 3.0,
    textStyle: TextStyle(fontSize: 15.0),
  );
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  String? team = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> initialize() async {
    final syncService = SyncService();
    syncService.processSync();

    final service = AccountService();
    await service.processAccount();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    //initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
        ),
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      ),
      drawer: DDDDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).bodyText1Family),
              ),
            ),
            Text(
              FFAppState().name,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 20,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
