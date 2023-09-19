import 'package:DDD/backend/drift/database.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PatientProfileModel extends FlutterFlowModel {
  /// Initialization and disposal methods.
  PatientData? patient;
  DevolveData? devolve;
  List<DispenseData> dispenses = [];
  String? refOrganisation;
  List<OutletData> outlets = [];

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
