
import 'package:DDD/backend/floor/entities/entities.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientListModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> clients = [];
  void addToClients(dynamic item) => clients.add(item);
  void removeFromClients(dynamic item) => clients.remove(item);
  void removeAtIndexFromClients(int index) => clients.removeAt(index);

  bool fullList = true;

  List<dynamic> filteredClients = [];
  void addToFilteredClients(dynamic item) => filteredClients.add(item);
  void removeFromFilteredClients(dynamic item) => filteredClients.remove(item);
  void removeAtIndexFromFilteredClients(int index) =>
      filteredClients.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // State field(s) for keyword widget.
  TextEditingController? keywordController;
  String? Function(BuildContext, String?)? keywordControllerValidator;
  // Stores action output result for [Custom Action - filterPatients] action in IconButton widget.
  List<Patient>? patients;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    keywordController?.dispose();
  }

  /// Additional helper methods are added here.

}
