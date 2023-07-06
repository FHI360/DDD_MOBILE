import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:DDD/main.dart';
import 'package:DDD/pages/drawer/drawer.widget.dart';
import 'package:DDD/widget/devolve_widget.dart';
import 'package:DDD/widget/discontinue_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'patient_profile_model.dart';

export 'patient_profile_model.dart';

class PatientProfileWidget extends StatefulWidget {
  const PatientProfileWidget({
    Key? key,
    this.patientId,
  }) : super(key: key);

  final int? patientId;

  @override
  _PatientProfileWidgetState createState() => _PatientProfileWidgetState();
}

class _PatientProfileWidgetState extends State<PatientProfileWidget> {
  late PatientProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var _database = await database;
      var patient = await _database.patientDao.findById(widget.patientId!);
      setState(() {
        _model.patient = patient;
        print("Initialized");
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  Future<List<Refill>> getRefill(String patientId) async {
    var _database = await database;
    return _database.refillDao.findByPatient(patientId);
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      drawer: DDDDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Patient Profile',
        ),
        backgroundColor: const Color(0xccdf6f3e),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x230F1113),
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child:
                                Row(mainAxisSize: MainAxisSize.max, children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${_model.patient?.givenName} ${_model.patient?.familyName}',
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _model.patient?.hospitalNo ?? '',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          _model.patient?.sex == 'MALE'
                                              ? 'Male'
                                              : 'Female',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 0, 0),
                                        child: Text(
                                          functions.formatAge(
                                              _model.patient?.dateOfBirth),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _model.patient?.phone ?? '',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Text(
                                              _model.patient?.address ?? '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230F1113),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!(_model
                                                .patient?.serviceDiscontinued ??
                                            false))
                                          InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'patientEdit',
                                                queryParams: {
                                                  'patientId': serializeParam(
                                                    _model.patient!.id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              height: 32,
                                              constraints: BoxConstraints(
                                                maxHeight: 32,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x32171717),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Text(
                                                        'Edit',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (_model
                                            .patient?.outletCode == null)
                                          InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                    MediaQuery.of(context)
                                                        .viewInsets,
                                                    child:
                                                    DevolveWidget(
                                                      patient: _model.patient,
                                                    ),
                                                  );
                                                },
                                              ).then((value) => setState(() {
                                                if (value != null &&
                                                    value ??
                                                    false) {
                                                  _model.patient!
                                                      .serviceDiscontinued =
                                                  true;
                                                }
                                              }));
                                            },
                                            child: Container(
                                              height: 32,
                                              constraints: BoxConstraints(
                                                maxHeight: 32,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x32171717),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(30),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 12, 0),
                                                      child: Text(
                                                        'Devolve',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText1Family,
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .white,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyText1Family),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_circle_right_outlined,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (!(_model
                                                .patient?.serviceDiscontinued ??
                                            false))
                                          InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        DiscontinueServiceWidget(
                                                      patient: _model.patient,
                                                    ),
                                                  );
                                                },
                                              ).then((value) => setState(() {
                                                    if (value != null &&
                                                            value ??
                                                        false) {
                                                      _model.patient!
                                                              .serviceDiscontinued =
                                                          true;
                                                    }
                                                  }));
                                            },
                                            child: Container(
                                              height: 32,
                                              constraints: BoxConstraints(
                                                maxHeight: 32,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x32171717),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Text(
                                                        'Discontinue',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.cancel_outlined,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Appointments',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(
                                context)
                                .bodyText1Family,
                            fontWeight: FontWeight.w300,
                            color:  FlutterFlowTheme.of(context).secondaryColor,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(
                                    context)
                                    .bodyText1Family),
                          ),

                        ),
                      ],
                    ),
                  ),
                  if(_model.patient != null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230F1113),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 20,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Last Refill',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                        if (_model.patient!.lastRefillDate !=
                                            DateTime(1900))
                                          Text(
                                            dateTimeFormat('yMMMd',
                                                _model.patient?.lastRefillDate),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 20,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Last VL Date',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                        if (_model.patient!.lastClinicVisit !=
                                            DateTime(1900))
                                          Text(
                                            dateTimeFormat(
                                                'yMMMd',
                                                _model
                                                    .patient?.lastClinicVisit!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 20,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Last Clinic',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd',
                                              _model.patient?.lastClinicVisit ==
                                                      DateTime(1900)
                                                  ? null
                                                  : _model.patient
                                                      ?.lastClinicVisit),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 20,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Next Appointment',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'yMMMd',
                                              _model.patient
                                                          ?.nextAppointmentDate ==
                                                      DateTime(1900)
                                                  ? null
                                                  : _model.patient
                                                      ?.nextAppointmentDate),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!(_model.patient?.serviceDiscontinued ?? false))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'refill',
                                queryParams: {
                                  'patientId': serializeParam(
                                    _model.patient!.id!,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              height: 32,
                              constraints: BoxConstraints(
                                maxHeight: 32,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Refill',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if(_model.patient != null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Refill history',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(
                                context)
                                .bodyText1Family,
                            fontWeight: FontWeight.w300,
                            color:  FlutterFlowTheme.of(context).secondaryColor,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(
                                    context)
                                    .bodyText1Family),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(_model.patient != null)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<List<Refill>>(
                                future: getRefill(_model.patient!.uuid),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<Refill> listViewRefillRowList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewRefillRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewRefillRow =
                                          listViewRefillRowList[listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 16,
                                                    height: 16,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                        'yMMMd',
                                                                        listViewRefillRow
                                                                            .date),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText2Family,
                                                                          color:
                                                                              Color(0xFF747550),
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Regimen',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      listViewRefillRow
                                                                          .regimen,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Prescribed Qty',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        listViewRefillRow
                                                                            .quantityPrescribed,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#,##0',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Dispensed Qty',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        listViewRefillRow
                                                                            .quantityDispensed,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#,##0',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
