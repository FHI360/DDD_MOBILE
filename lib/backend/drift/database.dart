import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:DDD/app_state.dart';
import 'package:DDD/backend/drift/entities.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'converters.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Clinic,
  Devolve,
  Dispense,
  Facility,
  Outlet,
  Patient,
  Regimen,
  ViralLoad
])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  if (FFAppState().passphrase.isEmpty) {
    FFAppState().passphrase = createCryptoRandomString();
  }
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ddd.sqlite'));
    return NativeDatabase(file, setup: (rawDb) {
      rawDb.execute("PRAGMA key = '${FFAppState().passphrase}';");
    });
  });
}


String createCryptoRandomString([int length = 32]) {
  final Random _random = Random.secure();
  var values = List<int>.generate(length, (i) => _random.nextInt(256));

  return base64Url.encode(values);
}