import 'package:DDD/flutter_flow/flutter_flow_model.dart';
import 'package:DDD/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel {
  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress-login widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;

  // State field(s) for password-login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;

  TextEditingController? baseUrlController;
  String? Function(BuildContext, String?)? baseUrlControllerValidator;

  String? _baseUrlControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    final regExp = RegExp(
        r'^(https?://)?([\da-z.-]+)(\.[a-z.]{2,6})?(:\d{1,5})?$',
        caseSensitive: false,
        multiLine: false);

    if (!regExp.hasMatch(val)) {
      return 'Invalid URL';
    }

    return null;
  }

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    baseUrlControllerValidator = _baseUrlControllerValidator;
  }

  void dispose() {
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    baseUrlController?.dispose();
    instantTimer?.cancel();
  }

  /// Additional helper methods are added here.
}
