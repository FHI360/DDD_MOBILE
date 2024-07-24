import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/backend/drift/entities.dart';
import 'package:DDD/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:uuid/uuid.dart';

import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'refill_model.dart';

import 'package:drift/drift.dart' as df;
import 'package:uuid/uuid.dart';

class RefillWidget extends StatefulWidget {
  const RefillWidget({
    Key? key,
    this.patientId,
    this.dispenseId
  }) : super(key: key);

  final int? patientId;
  final int? dispenseId;

  @override
  _RefillWidgetState createState() => _RefillWidgetState();
}

class _RefillWidgetState extends State<RefillWidget> {
  late RefillModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  String? boolToString(bool? value) {
    if (value == null) {
      return null;
    }
    return value ? 'Yes' : 'No';
  }

  Future<void> initialize() async {
    _model.regimen = await RegimenDao(database).findAll();
    _model.dispense =
    await DispenseDao(database).findById(widget.dispenseId ?? 0);
    if (_model.dispense != null) {
      print(_model.dispense);
      _model.missedDosesValue = boolToString(_model.dispense!.missedDoses);
      _model.adverseIssuesValue = boolToString(_model.dispense!.adverseIssues);
      _model.datePicked1 = _model.dispense!.date;
      _model.datePicked = _model.dispense!.dateNextRefill;

      _model.clinic = await ClinicDao(database).findByPatientAndDate(
          _model.patient!.uuid, _model.dispense!.date);

      if (_model.clinic != null) {
        _model.coughingValue = boolToString(_model.clinic!.coughing);
        _model.feverValue = boolToString(_model.clinic!.fever);
        _model.weightLossValue = boolToString(_model.clinic!.weightLoss);
        _model.nightSweatValue = boolToString(_model.clinic!.sweating);
        _model.swellingsValue = boolToString(_model.clinic!.swelling);
        _model.tbReferValue = boolToString(_model.clinic!.tbReferred);
      }
    }

    _model.weightController ??= TextEditingController(
        text: _model.clinic != null ? _model.clinic!.weight?.toString() : '');
    _model.systolicController ??= TextEditingController(
        text: _model.clinic != null ? _model.clinic!.systolic?.toString() : ''
    );
    _model.diastolicController ??= TextEditingController(
        text: _model.clinic != null ? _model.clinic!.systolic?.toString() : ''
    );
    _model.temperatureController ??= TextEditingController(
        text: _model.clinic != null
            ? _model.clinic!.temperature?.toString()
            : ''
    );
    int? qtyDispensed;
    int? qtyPrescribed;
    if (_model.dispense != null) {
      var medication = _model.dispense!
          .medications!
          .where((m) => m.arv)
          .firstOrNull;
      if (medication != null) {
        qtyDispensed = medication.quantityDispensed;
        qtyPrescribed = medication.quantityPrescribed;
        _model.regimenValue =
        await RegimenDao(database).findByName(medication.regimen);
      }
    }
    _model.qtyPrescribedController ??= TextEditingController(
        text: qtyPrescribed != null ? qtyPrescribed.toString() : ''
    );
    _model.qtyDispensedController ??= TextEditingController(
        text: qtyDispensed != null ? qtyDispensed.toString() : ''
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefillModel());
    initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var patient = await PatientDao(database).findById(widget.patientId!);
      setState(() {
        _model.patient = patient;
      });
      setState(() {});
    });
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
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'PAGES.REFILL.TITLE'.tr(),
          style: FlutterFlowTheme
              .of(context)
              .title2
              .override(
            fontFamily: FlutterFlowTheme
                .of(context)
                .title2Family,
            color: Colors.white,
            fontSize: 22,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme
                .of(context)
                .title2Family),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                              child: PageView(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .overlay,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'PAGES.REFILL.VITALS'.tr(),
                                                    style: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .title2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final _datePickedDate =
                                                    await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                      _model.datePicked1 ??
                                                          getCurrentTimestamp,
                                                      firstDate: _model.patient!
                                                          .dateStarted!.subtract(
                                                          Duration(days: 730)
                                                      ),
                                                      locale: context.locale,
                                                      lastDate:
                                                      getCurrentTimestamp,
                                                    );

                                                    if (_datePickedDate !=
                                                        null) {
                                                      setState(() {
                                                        _model.datePicked1 =
                                                            DateTime(
                                                              _datePickedDate
                                                                  .year,
                                                              _datePickedDate
                                                                  .month,
                                                              _datePickedDate
                                                                  .day,
                                                            );

                                                        DateTime
                                                        nrd =
                                                        DateTime(
                                                            _model
                                                                .datePicked1!
                                                                .year,
                                                            _model
                                                                .datePicked1!
                                                                .month,
                                                            _model
                                                                .datePicked1!
                                                                .day +
                                                                (int
                                                                    .tryParse(
                                                                    _model
                                                                        .qtyDispensedController
                                                                        .text) ??
                                                                    0));
                                                        _model
                                                            .datePicked =
                                                            nrd;
                                                      });
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              3.0,
                                                              3.0,
                                                              3.0,
                                                              0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                      'PAGES.REFILL.VISIT_DATE'
                                                                          .tr(),
                                                                      style: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'yMMMd',
                                                                        _model
                                                                            .datePicked1,
                                                                        locale: context
                                                                            .locale
                                                                            .languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    1.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .date_range,
                                                                  color: FlutterFlowTheme
                                                                      .of(
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              'PAGES.REFILL.BODY_WEIGHT'
                                                                  .tr(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1Family,
                                                                fontSize:
                                                                12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1Family),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 110.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model
                                                                        .weightController,
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      hintStyle:
                                                                      FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText2,
                                                                      enabledBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1,
                                                                    validator: _model
                                                                        .weightControllerValidator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              'PAGES.REFILL.SYSTOLIC'
                                                                  .tr(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1Family,
                                                                fontSize:
                                                                12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1Family),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 110.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model
                                                                        .systolicController,
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      hintStyle:
                                                                      FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText2,
                                                                      enabledBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1,
                                                                    validator: _model
                                                                        .systolicControllerValidator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              'PAGES.REFILL.DIASTOLIC'
                                                                  .tr(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1Family,
                                                                fontSize:
                                                                12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1Family),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 110.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model
                                                                        .diastolicController,
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      hintStyle:
                                                                      FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText2,
                                                                      enabledBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1,
                                                                    validator: _model
                                                                        .diastolicControllerValidator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                              'PAGES.REFILL.TEMPERATURE'
                                                                  .tr(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1Family,
                                                                fontSize:
                                                                12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                    .containsKey(
                                                                    FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1Family),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 110.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model
                                                                        .temperatureController,
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      hintStyle:
                                                                      FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .bodyText2,
                                                                      enabledBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(
                                                                              0x00000000),
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                        borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                          topLeft:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                          topRight:
                                                                          Radius
                                                                              .circular(
                                                                              4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodyText1,
                                                                    validator: _model
                                                                        .temperatureControllerValidator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                )),
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .overlay,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'PAGES.REFILL.TB_SCREENING'
                                                          .tr(),
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .title2
                                                          .override(
                                                        fontFamily: FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .bodyText1Family,
                                                        fontSize: 21.0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme
                                                                .of(context)
                                                                .bodyText1Family),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.COUGHING'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .coughingValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .coughingValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.FEVER'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .feverValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .feverValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.WEIGHT_LOSS'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .weightLossValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .weightLossValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.NIGHT_SWEAT'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .nightSweatValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .nightSweatValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.SWELLINGS'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .swellingsValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .swellingsValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.TB_REFER'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .tbReferValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .tbReferValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .overlay,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'PAGES.REFILL.DRUG_REFILL'
                                                          .tr(),
                                                      style:
                                                      FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .title2
                                                          .override(
                                                        fontFamily: FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .bodyText1Family,
                                                        fontSize: 21.0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme
                                                                .of(context)
                                                                .bodyText1Family),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.REGIMEN'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            RegimenData>(
                                                                          initialOption:
                                                                          _model
                                                                              .regimenValue,
                                                                          options:
                                                                          _model
                                                                              .regimen,
                                                                          optionLabels: _model
                                                                              .regimen
                                                                              .map((
                                                                              r) =>
                                                                          r
                                                                              .name)
                                                                              .toList(),
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .regimenValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.PRESCRIBED_QTY'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            int>(
                                                                          initialOption:
                                                                          int
                                                                              .tryParse(
                                                                              _model
                                                                                  .qtyPrescribedController
                                                                                  .text),
                                                                          options: [
                                                                            30,
                                                                            60,
                                                                            90,
                                                                            120,
                                                                            150,
                                                                            180
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.30_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.60_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.90_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.120_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.150_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.180_DAYS'
                                                                                .tr()
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() {
                                                                                _model
                                                                                    .qtyPrescribedController
                                                                                    .text =
                                                                                val !=
                                                                                    null
                                                                                    ? val
                                                                                    .toString()
                                                                                    : '';
                                                                              }),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.DISPENSED_QTY'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            int>(
                                                                          initialOption:
                                                                          int
                                                                              .tryParse(
                                                                              _model
                                                                                  .qtyDispensedController
                                                                                  .text),
                                                                          options: [
                                                                            30,
                                                                            60,
                                                                            90,
                                                                            120,
                                                                            150,
                                                                            180
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.30_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.60_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.90_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.120_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.150_DAYS'
                                                                                .tr(),
                                                                            'PAGES.REFILL.180_DAYS'
                                                                                .tr()
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() {
                                                                                _model
                                                                                    .qtyDispensedController
                                                                                    .text =
                                                                                val !=
                                                                                    null
                                                                                    ? val
                                                                                    .toString()
                                                                                    : '';
                                                                                DateTime
                                                                                nrd =
                                                                                DateTime(
                                                                                    _model
                                                                                        .datePicked1!
                                                                                        .year,
                                                                                    _model
                                                                                        .datePicked1!
                                                                                        .month,
                                                                                    _model
                                                                                        .datePicked1!
                                                                                        .day +
                                                                                        (int
                                                                                            .tryParse(
                                                                                            _model
                                                                                                .qtyDispensedController
                                                                                                .text) ??
                                                                                            0));
                                                                                _model
                                                                                    .datePicked =
                                                                                    nrd;
                                                                              }),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.MISSED_DOSES'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .missedDosesValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .missedDosesValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Text(
                                                                        'PAGES.REFILL.ADVERSE_ISSUES'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1Family,
                                                                          fontSize: 12.0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodyText1Family),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          initialOption:
                                                                          _model
                                                                              .adverseIssuesValue,
                                                                          options: [
                                                                            'No',
                                                                            'Yes'
                                                                          ],
                                                                          optionLabels: [
                                                                            'PAGES.REFILL.NO'
                                                                                .tr(),
                                                                            'PAGES.REFILL.YES'
                                                                                .tr(),
                                                                          ],
                                                                          onChanged: (
                                                                              val) =>
                                                                              setState(() =>
                                                                              _model
                                                                                  .adverseIssuesValue =
                                                                                  val),
                                                                          width:
                                                                          double
                                                                              .infinity,
                                                                          height:
                                                                          50.0,
                                                                          textStyle: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyText1Family,
                                                                            color: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .primaryText,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodyText1Family),
                                                                          ),
                                                                          fillColor:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondaryBackground,
                                                                          elevation:
                                                                          2.0,
                                                                          borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                          borderWidth:
                                                                          0.0,
                                                                          borderRadius:
                                                                          0.0,
                                                                          margin: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                          true,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      DateTime nrd = DateTime(
                                                          getCurrentTimestamp
                                                              .year,
                                                          getCurrentTimestamp
                                                              .month,
                                                          getCurrentTimestamp
                                                              .day +
                                                              (int.tryParse(
                                                                  _model
                                                                      .qtyDispensedController
                                                                      .text) ??
                                                                  0));
                                                      final _datePickedDate =
                                                      await showDatePicker(
                                                        context: context,
                                                        initialDate: _model
                                                            .datePicked ?? nrd,
                                                        firstDate:
                                                        _model
                                                            .datePicked!,
                                                        locale: context.locale,
                                                        lastDate:
                                                        DateTime(2050),
                                                      );

                                                      if (_datePickedDate !=
                                                          null) {
                                                        setState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                                _datePickedDate
                                                                    .year,
                                                                _datePickedDate
                                                                    .month,
                                                                _datePickedDate
                                                                    .day,
                                                              );
                                                        });
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                3.0,
                                                                3.0,
                                                                3.0,
                                                                0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        'PAGES.REFILL.NEXT_REFILL'
                                                                            .tr(),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1,
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'yMMMd',
                                                                          _model
                                                                              .datePicked,
                                                                          locale: context
                                                                              .locale
                                                                              .languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      1.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .date_range,
                                                                    color: FlutterFlowTheme
                                                                        .of(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 30, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pop();
                                                      },
                                                      text: 'CANCEL'.tr(),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .secondaryColor,
                                                        textStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .subtitle2
                                                            .override(
                                                          fontFamily: FlutterFlowTheme
                                                              .of(
                                                              context)
                                                              .subtitle2Family,
                                                          color: Colors
                                                              .white,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme
                                                                  .of(context)
                                                                  .subtitle2Family),
                                                        ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: ((int.tryParse(
                                                          _model
                                                              .qtyDispensedController
                                                              .text) ==
                                                          null) ||
                                                          _model.regimenValue ==
                                                              null ||
                                                          _model.datePicked1 ==
                                                              null ||
                                                          _model.datePicked ==
                                                              null)
                                                          ? null
                                                          : () async {
                                                        if (_model.formKey
                                                            .currentState ==
                                                            null ||
                                                            !_model
                                                                .formKey
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        final uuid =
                                                        Uuid();
                                                        var clinic = ClinicCompanion
                                                            .insert(
                                                            patientId: _model
                                                                .patient!
                                                                .uuid,
                                                            date: _model
                                                                .datePicked1!,
                                                            systolic: df.Value
                                                              (
                                                                int.tryParse(
                                                                    _model
                                                                        .systolicController
                                                                        .text)),
                                                            diastolic: df.Value
                                                              (
                                                                int.tryParse(
                                                                    _model
                                                                        .diastolicController
                                                                        .text)),
                                                            weight: df.Value
                                                              (
                                                                double.tryParse(
                                                                    _model
                                                                        .weightController
                                                                        .text)),
                                                            temperature: df
                                                                .Value
                                                              (
                                                                double.tryParse(
                                                                    _model
                                                                        .temperatureController
                                                                        .text)),
                                                            coughing: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .coughingValue)),
                                                            swelling: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .swellingsValue)),
                                                            sweating: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .nightSweatValue)),
                                                            fever: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .feverValue)),
                                                            weightLoss: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .weightLossValue)),
                                                            tbReferred: df.Value
                                                              (
                                                                functions
                                                                    .booleanFromYesNo(
                                                                    _model
                                                                        .tbReferValue)),
                                                            uuid: _model.clinic?.uuid ?? uuid
                                                                .v4());

                                                        if (_model.clinic != null) {
                                                            clinic = clinic.copyWith(
                                                              id: df.Value(_model.clinic!.id),
                                                              synced: df.Value(false)
                                                            );
                                                        }

                                                        await database.into(
                                                            database.clinic)
                                                            .insert(clinic,
                                                            mode: df.InsertMode.replace
                                                        );

                                                        final medication =
                                                        Medication
                                                            .instance();
                                                        medication
                                                            .regimen =
                                                            _model
                                                                .regimenValue!
                                                                .name;
                                                        medication.arv =
                                                            _model
                                                                .regimenValue!
                                                                .arv;
                                                        medication
                                                            .quantityPrescribed =
                                                            int.tryParse(_model
                                                                .qtyPrescribedController
                                                                .text) ??
                                                                0;
                                                        medication
                                                            .quantityDispensed =
                                                            int.tryParse(_model
                                                                .qtyDispensedController
                                                                .text) ??
                                                                0;
                                                        var dispense;
                                                        if (widget.dispenseId != null) {
                                                          dispense = await
                                                          DispenseDao(database)
                                                              .findById(widget.dispenseId!);
                                                        }
                                                        if (dispense == null) {
                                                          dispense = await
                                                          DispenseDao(database)
                                                              .findByPatientAndDate(
                                                              _model
                                                                  .patient!
                                                                  .uuid,
                                                              _model
                                                                  .datePicked1!);
                                                        }

                                                        var nextAppointment;
                                                        if (dispense ==
                                                            null) {
                                                          final dispense1 = DispenseCompanion
                                                              .insert(
                                                              date: _model
                                                                  .datePicked1!,
                                                              patientId: _model
                                                                  .patient!
                                                                  .uuid,
                                                              dateNextRefill: _model
                                                                  .datePicked!,
                                                              adverseIssues: df
                                                                  .Value
                                                                  .ofNullable(
                                                                  functions
                                                                      .booleanFromYesNo(
                                                                      _model
                                                                          .adverseIssuesValue)),
                                                              missedDoses: df
                                                                  .Value
                                                                  .ofNullable
                                                                (
                                                                  functions
                                                                      .booleanFromYesNo(
                                                                      _model
                                                                          .missedDosesValue)),
                                                              medications: df
                                                                  .Value([
                                                                medication
                                                              ]),
                                                              uuid: uuid
                                                                  .v4());
                                                          int id = await database
                                                              .into(
                                                              database.dispense)
                                                              .insert(
                                                              dispense1);
                                                          dispense =
                                                          await DispenseDao(
                                                              database)
                                                              .findById(id);
                                                          if (medication
                                                              .arv) {
                                                            nextAppointment =
                                                                _model
                                                                    .datePicked;
                                                          }
                                                        } else {
                                                          dispense = dispense.copyWith(
                                                            date: _model
                                                                .datePicked1!,
                                                            adverseIssues: functions
                                                                .booleanFromYesNo(
                                                                _model
                                                                    .adverseIssuesValue),
                                                            missedDoses: functions
                                                                .booleanFromYesNo(
                                                                _model
                                                                    .missedDosesValue),
                                                            dateNextRefill: _model
                                                                .datePicked!,
                                                            synced: false
                                                          );

                                                          dispense
                                                              .medications!
                                                              .add(
                                                              medication);
                                                          if (medication
                                                              .arv) {
                                                            final medications =
                                                            dispense.medications!.where((med)=> !med.arv)
                                                                .toList();
                                                            medications.add(medication);
                                                            dispense.medications!.clear();
                                                            dispense.medications!.addAll(medications);
                                                            dispense = dispense
                                                                .copyWith(
                                                                dateNextRefill: _model
                                                                    .datePicked!);
                                                          }

                                                          await DispenseDao(
                                                              database)
                                                              .updateRecord(
                                                              dispense);
                                                        }
                                                        var latest = await DispenseDao(
                                                            database)
                                                            .findLatestByPatient(
                                                            _model
                                                                .patient!
                                                                .uuid);

                                                        if (nextAppointment !=
                                                            null &&
                                                            (latest ==
                                                                null ||
                                                                !latest
                                                                    .date
                                                                    .isAfter(
                                                                    _model
                                                                        .datePicked!))) {
                                                          var patient = await PatientDao(
                                                              database)
                                                              .findById(
                                                              _model.patient!
                                                                  .id);
                                                          patient =
                                                              patient!.copyWith(
                                                                  nextAppointmentDate: df
                                                                      .Value(
                                                                      nextAppointment),
                                                                  lastRefillDate: df
                                                                      .Value
                                                                    (
                                                                      _model
                                                                          .datePicked1));
                                                          await PatientDao(
                                                              database)
                                                              .updateRecord(
                                                              patient);
                                                        }
                                                        showToast(
                                                          'PAGES.REFILL.SAVE_SUCCESS'
                                                              .tr(),
                                                          duration:
                                                          Duration(
                                                              seconds:
                                                              10),
                                                          position:
                                                          ToastPosition
                                                              .bottom,
                                                          backgroundColor:
                                                          Colors
                                                              .green,
                                                          radius: 3.0,
                                                          textStyle:
                                                          TextStyle(
                                                              fontSize:
                                                              15.0),
                                                        );
                                                        context.pushNamed(
                                                          'patientProfile',
                                                          queryParams: {
                                                            'patientId':
                                                            serializeParam(
                                                              _model
                                                                  .patient!
                                                                  .id,
                                                              ParamType
                                                                  .int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: 'SAVE'.tr(),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .primaryColor,
                                                        textStyle:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .subtitle2
                                                            .override(
                                                          fontFamily: FlutterFlowTheme
                                                              .of(
                                                              context)
                                                              .subtitle2Family,
                                                          color: Colors
                                                              .white,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme
                                                                  .of(context)
                                                                  .subtitle2Family),
                                                        ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                            Align(
                              alignment: AlignmentDirectional(0, -0.95),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child:
                                smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 3,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) {
                                    _model.pageViewController!.animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect:
                                  smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 2,
                                    spacing: 8,
                                    radius: 16,
                                    dotWidth: 16,
                                    dotHeight: 16,
                                    dotColor: FlutterFlowTheme
                                        .of(context)
                                        .tertiaryColor,
                                    activeDotColor: FlutterFlowTheme
                                        .of(context)
                                        .secondaryColor,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
