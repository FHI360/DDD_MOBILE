import 'dart:convert';

import 'package:drift/drift.dart';

import 'entities.dart';

class ListMedicationConverter extends TypeConverter<List<Medication>, String> {

  @override
  List<Medication> fromSql(String fromDb) {

    final value = json.decode(fromDb);
    List<Medication> medications = [];
    medications = List.from(value).map((e) => Medication.fromJson(e)).toList();

    return medications;
  }

  @override
  String toSql(List<Medication> value) {
    final List<Map<String, dynamic>> data = [];
    value.forEach((e) => data.add(e.toJson()));

    return json.encode(data);
  }
}

