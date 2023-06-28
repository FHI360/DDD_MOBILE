import 'dart:convert';

import 'package:floor/floor.dart';

import 'entities/entities.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

class StockEntryConverter extends TypeConverter<StockEntry, String> {
  @override
  StockEntry decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return StockEntry.fromJson(value);
  }

  @override
  String encode(StockEntry value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class StockStateConverter extends TypeConverter<StockState, String> {
  @override
  StockState decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return StockState.fromJson(value);
  }

  @override
  String encode(StockState value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class LatLngConverter extends TypeConverter<LatLng, String> {
  @override
  LatLng decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return LatLng.fromJson(value);
  }

  @override
  String encode(LatLng value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class FromBirthConverter extends TypeConverter<FromBirth, String> {
  @override
  FromBirth decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return FromBirth.fromJson(value);
  }

  @override
  String encode(FromBirth value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From6WeeksConverter extends TypeConverter<From6Weeks, String> {
  @override
  From6Weeks decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From6Weeks.fromJson(value);
  }

  @override
  String encode(From6Weeks value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From10WeeksConverter extends TypeConverter<From10Weeks, String> {
  @override
  From10Weeks decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From10Weeks.fromJson(value);
  }

  @override
  String encode(From10Weeks value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From14WeeksConverter extends TypeConverter<From14Weeks, String> {
  @override
  From14Weeks decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From14Weeks.fromJson(value);
  }

  @override
  String encode(From14Weeks value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From6MonthsConverter extends TypeConverter<From6Months, String> {
  @override
  From6Months decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From6Months.fromJson(value);
  }

  @override
  String encode(From6Months value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From9MonthsConverter extends TypeConverter<From9Months, String> {
  @override
  From9Months decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From9Months.fromJson(value);
  }

  @override
  String encode(From9Months value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From12MonthsConverter extends TypeConverter<From12Months, String> {
  @override
  From12Months decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From12Months.fromJson(value);
  }

  @override
  String encode(From12Months value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From15MonthsConverter extends TypeConverter<From15Months, String> {
  @override
  From15Months decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From15Months.fromJson(value);
  }

  @override
  String encode(From15Months value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class From9YearsConverter extends TypeConverter<From9Years, String> {
  @override
  From9Years decode(String databaseValue) {
    final value = json.decode(databaseValue);
    return From9Years.fromJson(value);
  }

  @override
  String encode(From9Years value) {
    final data = value.toJson();
    return json.encode(data);
  }
}

class DeclinationReasonsConverter
    extends TypeConverter<DeclinationReasons, String> {
  @override
  DeclinationReasons decode(String databaseValue) {
    final _value = json.decode(databaseValue).map((e) => e.toString()).toList();
    final List<String> value = [];
    _value.forEach((v) => value.add(v.toString()));
    final reason = DeclinationReasons();
    reason.reasons = value;
    return reason;
  }

  @override
  String encode(DeclinationReasons value) {
    return json.encode(value.reasons);
  }
}

class MedicalConditionsConverter
    extends TypeConverter<MedicalConditions, String> {
  @override
  MedicalConditions decode(String databaseValue) {
    final _value = json.decode(databaseValue).map((e) => e.toString()).toList();
    final List<String> value = [];
    _value.forEach((v) => value.add(v.toString()));
    final reason = MedicalConditions();
    reason.conditions = value;
    return reason;
  }

  @override
  String encode(MedicalConditions value) {
    return json.encode(value.conditions);
  }
}

class ListVaccinationEventsConverter
    extends TypeConverter<List<VaccinationEvent>, String> {
  @override
  List<VaccinationEvent> decode(String databaseValue) {
    final value = json.decode(databaseValue);
    List<VaccinationEvent> events = [];
    events = List.from(value).map((e) => VaccinationEvent.fromJson(e)).toList();

    return events;
  }

  @override
  String encode(List<VaccinationEvent> value) {
    final List<Map<String, dynamic>> data = [];
    value.forEach((e) => data.add(e.toJson()));

    return json.encode(data);
  }
}

class ListStockEntryConverter extends TypeConverter<List<StockEntry>, String> {
  @override
  List<StockEntry> decode(String databaseValue) {
    final value = json.decode(databaseValue);
    List<StockEntry> events = [];
    events = List.from(value).map((e) => StockEntry.fromJson(e)).toList();

    return events;
  }

  @override
  String encode(List<StockEntry> value) {
    final List<Map<String, dynamic>> data = [];
    value.forEach((e) => data.add(e.toJson()));

    return json.encode(data);
  }
}

class ListVaccinesConverter extends TypeConverter<List<Vaccination>, String> {
  @override
  List<Vaccination> decode(String databaseValue) {
    final value = json.decode(databaseValue);
    List<Vaccination> events = [];
    events = List.from(value).map((e) => Vaccination.fromJson(e)).toList();

    return events;
  }

  @override
  String encode(List<Vaccination> value) {
    final List<Map<String, dynamic>> data = [];
    value.forEach((e) => data.add(e.toJson()));

    return json.encode(data);
  }
}
