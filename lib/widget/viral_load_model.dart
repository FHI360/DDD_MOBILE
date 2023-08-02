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

    if (int.tryParse(val) == null) {
      return 'PAGES.VIRAL_LOAD.INPUT_NUMBER'.tr();
    }

    if (int.parse(val) < 0) {
      return 'PAGES.VIRAL_LOAD.MINIMUM'.tr();
    }

    if (int.parse(val) > 999 && datePicked != null) {
      datePicked1 =
          DateTime(datePicked!.year, datePicked!.month + 3, datePicked!.day);
    } else if (datePicked != null) {
      datePicked1 =
          DateTime(datePicked!.year + 1, datePicked!.month, datePicked!.day);
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
