import 'dart:ui';

import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:DDD/main.dart';
import 'package:DDD/widget/devolve_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

export 'discontinue_service_model.dart';

class DevolveWidget extends StatefulWidget {
  const DevolveWidget({
    Key? key,
    this.patient,
  }) : super(key: key);

  final Patient? patient;

  @override
  _DevolveWidgetWidgetState createState() => _DevolveWidgetWidgetState();
}

class _DevolveWidgetWidgetState extends State<DevolveWidget> {
  late DevolveModel _model;

  Future<void> initialize() async {
    final _database = await database;
    _model.outlets = await _database.outletDao.findAll();
    _model.outlets.sort((o1, o2) => o1.name.compareTo(o2.name));
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevolveModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 8,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 700,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Color(0x33000000),
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: DateTime(1900),
                                        lastDate: getCurrentTimestamp,
                                      );

                                      if (_datePickedDate != null) {
                                        setState(() {
                                          _model.datePicked = DateTime(
                                            _datePickedDate.year,
                                            _datePickedDate.month,
                                            _datePickedDate.day,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Date devolved',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'yMMMd',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Icon(
                                                    Icons.date_range,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Outlet',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                Outlet>(
                                                          initialOption: null,
                                                          options:
                                                              _model.outlets,
                                                          optionLabels: _model
                                                              .outlets
                                                              .map(
                                                                  (e) => e.name)
                                                              .toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.outletValue =
                                                                      val),
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: (_model.datePicked == null) ||
                                              (_model.outletValue == null)
                                          ? null
                                          : () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model.datePicked == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Date is required',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFFB7463A),
                                                  ),
                                                );
                                                return;
                                              }
                                              if (_model.outletValue == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please select outlet',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFFB7463A),
                                                  ),
                                                );
                                                return;
                                              }
                                              final _database = await database;
                                              var devolve = Devolve.instance();
                                              devolve.patientId =
                                                  widget.patient!.uuid;
                                              devolve.outletCode =
                                                  FFAppState().activationCode;
                                              devolve.date = _model.datePicked!;
                                              devolve.outletCode =
                                                  _model.outletValue!.code;

                                              await _database.devolveDao
                                                  .insertRecord(devolve);

                                              Navigator.pop(context, devolve);
                                            },
                                      text: 'Devolve',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
