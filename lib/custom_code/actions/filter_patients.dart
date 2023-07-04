// Automatic FlutterFlow imports

import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:DDD/main.dart';

import '/flutter_flow/flutter_flow_util.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<Patient>> filterPatients(String keyword) async {
  // Add your function code here!
  var _database = await database;
  keyword = '%$keyword%';
  return _database.patientDao
      .findByKeyword(FFAppState().activationCode, keyword);
}
