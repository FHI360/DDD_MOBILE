// Automatic FlutterFlow imports

import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:DDD/backend/drift/database.dart';
import 'package:DDD/main.dart';

import '/flutter_flow/flutter_flow_util.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<PatientData>> filterPatients(String keyword) async {
  // Add your function code here!
  return PatientDao(database)
      .findByKeyword(FFAppState().activationCode, keyword);
}
