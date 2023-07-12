import 'package:DDD/backend/floor/entities/entities.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:DDD/main.dart';

import 'api.dart';

class AccountService {
  Future<void> processAccount() async {
    final response =
        await api.get('${FFAppState().baseUrl}/api/ddd/data-services');
    final data = await response.data;
    final _database = await database;
    final patients = data.patients;
    await _database.patientDao.deleteAll();
    patients.forEach((p) async {
      await _database.patientDao.insertRecord(Patient.fromJson(p));
    });
    await _database.facilityDao.deleteAll();
    final facilities = data.facilities;
    facilities.forEach((f) async {
      await _database.facilityDao.insertRecord(Facility.fromJson(f));
    });
    await _database.outletDao.deleteAll();
    final outlets = data.outlets;
    outlets.forEach((o) async {
      await _database.outletDao.insertRecord(Outlet.fromJson(o));
    });
    final regimens = data.regimens;
    await _database.regimenDao.deleteAll();
    regimens.forEach((r) async {
      await _database.regimenDao.insertRecord(Regimen.fromJson(r));
    });
    final dispenses = patients.expand((p) => p.dispenses);
    await _database.dispenseDao.deleteAll();
    dispenses.forEach((r) async {
      await _database.dispenseDao.insertRecord(Dispense.fromJson(r));
    });
  }
}
