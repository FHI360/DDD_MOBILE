import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ViralLoadModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  DateTime? datePicked1;

  TextEditingController? valueController;
  String? Function(BuildContext, String?)? valueControllerValidator;

  String? _valueControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FIELD_REQUIRED'.tr();
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    valueControllerValidator = _valueControllerValidator;
  }

  void dispose() {}

  /// Additional helper methods are added here.
}
