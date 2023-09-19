import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../main.dart';

Future<String> monthlySummaryReport(BuildContext context, DateTime start) async {
  DateTime end = DateTime(start.year, start.month + 1, 0);
  List<DispenseInfo> rows = await DispenseDao(database)
      .listDispenseInfo(FFAppState().activationCode, start, end);
  String style = await rootBundle.loadString('assets/css/bootstrap.min.css');
  String content = '''
  <div class="row">
    <div class="col-12 justify-content-center m-3">
      <h1 class="text-center">${FFAppState().name}</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-12 justify-content-center mb-3">
      <h2 class="text-center">Monthly Summary Report for ${dateTimeFormat('yMMM', start, locale: context.locale.languageCode)}</h2>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <table class="table table-sm table-striped">
        <thead class="table-light">
        <tr>
            <th scope="col" colspan="1" class="text-center">#</th>
            <th scope="col" colspan="4" class="text-center">Patient</th>
            <th scope="col" colspan="3" class="text-center">Hospital No.</th>
            <th scope="col" colspan="2" class="text-center">Date of Birth</th>
            <th scope="col" class="text-center">Sex</th>
            <th scope="col" colspan="4" class="text-center">Regimen</th>
            <th scope="col" class="text-center">Duration</th>
            <th scope="col" colspan="2" class="text-center">Last Refill</th>
            <th scope="col" colspan="2" class="text-center">Next Appointment</th>
        </tr>
        </thead>   
        <tbody>
  ''';
  rows.mapIndexed((i, e) {
    content += '''
      <tr>
        <th scope="row">${i + 1}</th>
        <td class="justify-content-start" colspan="4">${e.givenName} ${e.familyName}</td>
        <td class="justify-content-start" colspan="3">${e.hospitalNo}</td>
        <td class="justify-content-start" colspan="2">${dateTimeFormat('yMMMd', e.dateOfBirth, locale: context.locale.languageCode)}</td>
        <td class="justify-content-start">${e.sex}</td>
        <td class="justify-content-start" colspan="4">${e.medications.first.regimen}</td>
        <td class="justify-content-start">${formatNumber(
      e.medications.first.quantityDispensed,
      formatType: FormatType.custom,
      format: '#,##0',
      locale: '',
    )}</td>
        <td class="justify-content-start" colspan="2">${dateTimeFormat('yMMMd', e.date, locale: context.locale.languageCode)}</td>
        <td class="justify-content-start" colspan="2">${dateTimeFormat('yMMMd', e.dateNextRefill, locale: context.locale.languageCode)}</td>
      </tr>
    ''';
  });

  content += '</tbody></table></div></div>';

  String html = '''
  <!DOCTYPE html>
  <html lang="en">
    <style>
      $style
    </style>
    <body>
      <div class="container">
        $content
      </div>
    </body>
  </html>
  ''';
  return html;
}
