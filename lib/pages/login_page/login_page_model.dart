import 'package:DDD/flutter_flow/flutter_flow_model.dart';
import 'package:DDD/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel {
  InstantTimer? instantTimer;
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress-login widget.
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  // State field(s) for password-login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
  }

  void dispose() {
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    instantTimer?.cancel();
  }

  /// Additional helper methods are added here.

}
