import 'package:easy_localization/easy_localization.dart';

import 'flutter_flow_util.dart';

String formatSex(String? sex) {
  return sex == 'FEMALE'
      ? 'Female'
      : sex == 'MALE'
          ? 'Male'
          : '';
}

String formatAge(DateTime? dob) {
  if (dob == null) {
    return '';
  }
  DateTime now = DateTime.now();
  Duration difference = now.difference(dob);
  double age = difference.inDays / 365.25;

  return 'AGE'.tr(args: [age.toStringAsFixed(0)]);
}

String? formatDate(String? date) {
  return '';
}

bool? booleanFromYesNo(String? value) {
  if (value == null) {
    return null;
  }
  return value == 'Yes'
      ? true
      : value == 'No'
          ? false
          : null;
}

String formatJsonDate(String value) {
  DateTime date = DateTime.tryParse(value) as DateTime;
  return dateTimeFormat('yMMMd', date);
}

DateTime? datetimeFromString(String value) {
  return DateTime.tryParse(value);
}
