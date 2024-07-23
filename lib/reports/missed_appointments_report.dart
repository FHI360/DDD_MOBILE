import 'package:DDD/backend/drift/dao/dao.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '../main.dart';

Future<String> missedAppointmentPdf(
    BuildContext context, DateTime start, DateTime end) async {
  List<LastDispense> rows = await PatientDao(database)
      .listMissedDispense(FFAppState().activationCode, start, end);

  String style = await rootBundle.loadString('assets/css/bootstrap.min.css');
  String content = '''
  <div class="row">
    <div class="col-12 justify-content-center m-3">
      <h1 class="text-center">${FFAppState().name}</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-12 justify-content-center mb-3">
      <h2 class="text-center">${'REPORTS.MISSED_APPOINTMENTS.TITLE'.tr(args: [
        dateTimeFormat('yMMMd', start, locale: context.locale.languageCode),
        dateTimeFormat('yMMMd', end, locale: context.locale.languageCode)
      ])}</h2>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <table class="table table-sm table-striped">
        <thead class="table-light">
        <tr>
            <th scope="col" colspan="1" class="text-center">#</th>
            <th scope="col" colspan="4" class="text-center">${'REPORTS.PATIENT'.tr()}</th>
            <th scope="col" colspan="3" class="text-center">${'REPORTS.HOSPITAL_NO'.tr()}</th>
            <th scope="col" colspan="2" class="text-center">${'REPORTS.DATE_OF_BIRTH'.tr()}</th>
            <th scope="col" class="text-center">${'REPORTS.SEX'.tr()}</th>
            ''';
  if (!FFAppState().outlet) {
    content += '''
            <th scope="col" colspan="4" class="text-center">${'REPORTS.OUTLET'.tr()}</th>
    ''';
  }
  content += '''
            <th scope="col" colspan="2" class="text-center">${'REPORTS.LAST_REFILL'.tr()}</th>
            <th scope="col" colspan="2" class="text-center">${'REPORTS.APPOINTMENT_DATE'.tr()}</th>
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
        <td class="justify-content-start">${e.sex == 'female' ? 'PAGES.PATIENT.FEMALE'.tr() : 'PAGES.PATIENT.MALE'.tr()}</td>
        ''';
    if (!FFAppState().outlet) {
      content += '''
        <td class="justify-content-start" colspan="4">${e.outlet}</td>
      ''';
    }
    content += '''
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
