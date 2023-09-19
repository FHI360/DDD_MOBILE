import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class PreferenceModel extends FlutterFlowModel {
  final formKey = GlobalKey<FormState>();
  String? facilityValue;
  List<FacilityData> facilities = [];

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState(BuildContext context) {
    // TODO: implement initState
  }
}
