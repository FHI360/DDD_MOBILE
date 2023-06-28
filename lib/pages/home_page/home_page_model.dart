import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;

  late DateTime lastSync;
  bool flagSync = false;

  // Stores action output result for [Custom Action - checkNetworkAvailabilityAction] action in homePage widget.
  bool? online;
  bool updateAvailable = false;
  double progress = 0;
  bool downloading = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
  }

  /// Additional helper methods are added here.
}
