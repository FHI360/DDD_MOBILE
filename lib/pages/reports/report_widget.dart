import 'package:DDD/app_state.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/pages/drawer/drawer.widget.dart';
import 'package:flutter/material.dart';
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
        title: const Text(
          'Select Report to generate',
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
                    EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 10.0),
                    child: Text(
                      'Run report',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
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
