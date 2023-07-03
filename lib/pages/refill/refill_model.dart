import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RefillModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Patient? patient;

  // State field(s) for PageView widget.
  PageController? pageViewController;
  DateTime? datePicked;
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

  // State field(s) for qtyPrescribed widget.
  TextEditingController? qtyPrescribedController;

  // State field(s) for qtyDispensed widget.
  TextEditingController? qtyDispensedController;

  // State field(s) for missedDoses widget.
  String? missedDosesValue;

  // State field(s) for adverseIssues widget.
  String? adverseIssuesValue;
  var barcode = '';
  bool verified = false;

  String? _numericControllerValidator(BuildContext context, String? val) {
    if (val != null && val.isNotEmpty && int.tryParse(val) == null) {
      return 'Please input a number.';
    }

    if (val != null && int.tryParse(val) != null && int.parse(val) < 1) {
      return 'Minimum value is 1.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    weightControllerValidator = _numericControllerValidator;
    systolicControllerValidator = _numericControllerValidator;
    diastolicControllerValidator = _numericControllerValidator;
    temperatureControllerValidator = _numericControllerValidator;
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
