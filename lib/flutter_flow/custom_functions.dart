import 'flutter_flow_util.dart';

String formatSex(String? sex) {
  return sex == 'FEMALE'
      ? 'Female'
      : sex == 'MALE'
          ? 'Male'
          : '';
}

String formatJsonDate(String value) {
  DateTime date = DateTime.tryParse(value) as DateTime;
  return dateTimeFormat('yMMMd', date);
}

DateTime? datetimeFromString(String value) {
  return DateTime.tryParse(value);
}

