import 'package:DDD/app_state.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/pages/drawer/drawer.widget.dart';
import 'package:DDD/widget/missed_appointments_widget.dart';
import 'package:DDD/widget/monthly_summary_widget.dart';
import 'package:DDD/widget/refill_info_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportWidget extends StatefulWidget {
  _ReportWidget createState() => _ReportWidget();
}

class _ReportWidget extends State<ReportWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Scaffold(
      drawer: DDDDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PAGES.REPORTS.TITLE'.tr(),
        ),
        backgroundColor: const Color(0xccdf6f3e),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 3.0,
                    indent: 150.0,
                    endIndent: 150.0,
                    color: Color(0xFF465056),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 30.0),
                    child: Text(
                      'PAGES.REPORTS.RUN'.tr(),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 10.0),
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: MissedAppointmentsWidget(),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 32,
                        constraints: BoxConstraints(
                          maxHeight: 32,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x32171717),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Text(
                                  'PAGES.REPORTS.MISSED_APPOINTMENTS'.tr(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 10.0),
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: RefillInfoWidget(),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 32,
                        constraints: BoxConstraints(
                          maxHeight: 32,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x32171717),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Text(
                                  'PAGES.REPORTS.REFILL'.tr(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 10.0),
                    child: InkWell(
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
                              child: MonthlySummaryReportWidget(),
                            );
                          },
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
                            MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional
                                    .fromSTEB(
                                    0, 0, 12, 0),
                                child: Text(
                                  'PAGES.REPORTS.SUMMARY_REPORT'.tr(),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
