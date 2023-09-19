import 'package:DDD/backend/drift/database.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DevolveModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for reason widget.
  OutletData? outletValue;
  List<OutletData> outlets = [];
  DevolveData? devolve;
  OutletData? outlet;
  bool initialized = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
