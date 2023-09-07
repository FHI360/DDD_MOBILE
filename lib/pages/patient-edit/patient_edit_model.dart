import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PatientEditModel extends FlutterFlowModel {
  final formKey = GlobalKey<FormState>();
  Patient? patient;
  TextEditingController? givenNameController;
  TextEditingController? familyNameController;
  TextEditingController? uniqueIdController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? hospitalNoController;
  String? sexValue;
  String? clinicStageValue;
  String? targetGroupValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  bool? ageEstimatedValue;
  TextEditingController? viralLoadController;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? givenNameControllerValidator;
  String? Function(BuildContext, String?)? familyNameControllerValidator;
  String? Function(BuildContext, String?)? ageControllerValidator;
  String? Function(BuildContext, String?)? hospitalNoControllerValidator;
  String? Function(BuildContext, String?)? uniqueIdControllerValidator;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? Function(BuildContext, String?)? phoneControllerValidator;

  String? _requiredControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FIELD_REQUIRED'.tr();
    }

    return null;
  }

  String? _givenNameControllerValidator(BuildContext context, String? val) {
    if ((val == null || val.isEmpty) && FFAppState().requireName) {
      return 'FIELD_REQUIRED'.tr();
    }

    return null;
  }

  String? _hospitalNoControllerValidator(BuildContext context, String? val) {
    return null;
  }

  String? _familyNameControllerValidator(BuildContext context, String? val) {
    if ((val == null || val.isEmpty) && FFAppState().requireName) {
      return 'FIELD_REQUIRED'.tr();
    }

    return null;
  }

  String? _ageControllerValidator(BuildContext context, String? val) {
    if ((val == null || val.isEmpty) &&
        this.ageEstimatedValue != null &&
        this.ageEstimatedValue!) {
      return 'FIELD_REQUIRED'.tr();
    }
    int? age = int.tryParse(val!);
    if (age != null && age < 1) {
      return 'PAGES.PATIENT.AGE_MIN'.tr();
    }

    return null;
  }

  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'FIELD_REQUIRED'.tr();
    }

    if(val.length < 5 || val.length > 13) {
      return 'PAGES.PATIENT.PHONE_NUMBER_LENGTH'.tr();
    }

    return null;
  }

  @override
  void dispose() {
    givenNameController?.dispose();
    familyNameController?.dispose();
    ageController?.dispose();
    uniqueIdController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    hospitalNoController?.dispose();
  }

  @override
  void initState(BuildContext context) {
    givenNameControllerValidator = _givenNameControllerValidator;
    familyNameControllerValidator = _familyNameControllerValidator;
    ageControllerValidator = _ageControllerValidator;
    hospitalNoControllerValidator = _hospitalNoControllerValidator;
    uniqueIdControllerValidator = _requiredControllerValidator;
    addressControllerValidator = _requiredControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
  }
}
