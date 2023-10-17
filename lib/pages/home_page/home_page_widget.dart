import 'package:DDD/backend/device_profile/device_profile_service.dart';
import 'package:DDD/backend/http/account_service.dart';
import 'package:DDD/backend/http/api.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:DDD/flutter_flow/instant_timer.dart';
import 'package:DDD/pages/drawer/drawer.widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../backend/http/sync_service.dart';
import 'home_page_model.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_model.instantTimer == null || !_model.instantTimer.isActive) {
        _model.instantTimer = InstantTimer.periodic(
          duration: Duration(minutes: FFAppState().heartbeat),
          callback: (timer) async {
            if (FFAppState().accessToken.isEmpty &&
                _model.instantTimer != null) {
              _model.instantTimer!.cancel();
            }
            if (FFAppState().accessToken.isNotEmpty) {
              await executeTimerEvent();
            }
            if (FFAppState().activeHeartbeat != FFAppState().heartbeat) {
              await resetTimer();
            }
          },
          startImmediately: true,
        );
        FFAppState().activeHeartbeat = FFAppState().heartbeat;
      }
      setState(() {});
    });
  }

  resetTimer() async {
    _model.instantTimer = InstantTimer.periodic(
      duration: Duration(minutes: FFAppState().heartbeat),
      callback: (timer) async {
        if (FFAppState().accessToken.isEmpty &&
            _model.instantTimer != null) {
          _model.instantTimer!.cancel();
        }
        if (FFAppState().accessToken.isNotEmpty) {
          await executeTimerEvent();
        }
      },
      startImmediately: true,
    );
    FFAppState().activeHeartbeat = FFAppState().heartbeat;
  }

  executeTimerEvent() async {
    try {
      final infoService = DeviceInfoService();
      await infoService.syncProfile();
    } catch (e) {
    }
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
        title: Text(
          'DDD'.tr(),
        ),
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      ),
      drawer: DDDDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PAGES.HOME.WELCOME'.tr(),
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
              textAlign: TextAlign.center,
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
