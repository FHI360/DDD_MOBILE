import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RefillModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Patient? patient;
  List<Regimen> regimen = [];

  // State field(s) for PageView widget.
  PageController? pageViewController;
  DateTime? datePicked;
  DateTime? datePicked1;
  DateTime? nrd;

  // State field(s) for weight widget.
  TextEditingController? weightController;
  String? Function(BuildContext, String?)? weightControllerValidator;

  // State field(s) for systolic widget.
  TextEditingController? systolicController;
  String? Function(BuildContext, String?)? systolicControllerValidator;

  // State field(s) for diastolic widget.
  TextEditingController? diastolicController;
  String? Function(BuildContext, String?)? diastolicControllerValidator;

  // State field(s) for temperature widget.
  TextEditingController? temperatureController;
  String? Function(BuildContext, String?)? temperatureControllerValidator;

  // State field(s) for coughing widget.
  String? coughingValue;

  // State field(s) for fever widget.
  String? feverValue;

  // State field(s) for weightLoss widget.
  String? weightLossValue;

  // State field(s) for nightSweat widget.
  String? nightSweatValue;

  // State field(s) for swellings widget.
  String? swellingsValue;

  // State field(s) for tbRefer widget.
  String? tbReferValue;

  Regimen? regimenValue;

  // State field(s) for qtyPrescribed widget.
  TextEditingController? qtyPrescribedController;

  // State field(s) for qtyDispensed widget.
  TextEditingController? qtyDispensedController;

  // State field(s) for missedDoses widget.
  String? missedDosesValue;

  // State field(s) for adverseIssues widget.
  String? adverseIssuesValue;

  String? _numericControllerValidator(BuildContext context, String? val) {
    if (val != null && val.isNotEmpty && int.tryParse(val) == null) {
      return 'Please input a number.';
    }

    if (val != null && int.tryParse(val) != null && int.parse(val) < 1) {
      return 'Minimum value is 1.';
    }

    return null;
  }

  String? _weightControllerValidator(BuildContext context, String? val) {
    if (val != null && val.isNotEmpty && int.tryParse(val) == null) {
      return 'Please input a number.';
    }

    if (val != null && int.tryParse(val) != null) {
      if (int.parse(val) < 1) {
        return 'Minimum value is 1kg';
      } else if (int.parse(val) > 500) {
        return 'Maximum value is 500kg';
      }
    }

    return null;
  }

  String? _bpControllerValidator(BuildContext context, String? val) {
    if (val != null && val.isNotEmpty && int.tryParse(val) == null) {
      return 'Please input a number.';
    }

    if (val != null && int.tryParse(val) != null) {
      if (int.parse(val) < 60) {
        return 'Minimum value is 60mmHg';
      } else if (int.parse(val) > 370) {
        return 'Maximum value is 370mmHg';
      }
    }

    return null;
  }

  String? _temperatureControllerValidator(BuildContext context, String? val) {
    if (val != null && val.isNotEmpty && int.tryParse(val) == null) {
      return 'Please input a number.';
    }

    if (val != null && int.tryParse(val) != null) {
      if (int.parse(val) < 10) {
        return 'Minimum value is 10°C';
      } else if (int.parse(val) > 46) {
        return 'Maximum value is 46°C';
      }
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    weightControllerValidator = _weightControllerValidator;
    systolicControllerValidator = _bpControllerValidator;
    diastolicControllerValidator = _bpControllerValidator;
    temperatureControllerValidator = _temperatureControllerValidator;
  }

  void dispose() {
    weightController?.dispose();
    systolicController?.dispose();
    diastolicController?.dispose();
    temperatureController?.dispose();
    qtyPrescribedController?.dispose();
    qtyDispensedController?.dispose();
  }

  /// Additional helper methods are added here.
}
