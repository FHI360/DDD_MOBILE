
import 'package:DDD/backend/drift/database.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PatientListModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> clients = [];
  int patientCount = 0;
  int totalCount = 0;
  void addToClients(dynamic item) => clients.add(item);
  void removeFromClients(dynamic item) => clients.remove(item);
  void removeAtIndexFromClients(int index) => clients.removeAt(index);

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
  List<PatientData> patients = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    keywordController?.dispose();
  }

  /// Additional helper methods are added here.

}
