import 'package:DDD/backend/drift/converters.dart';
import 'package:drift/drift.dart';

class Patient extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get givenName => text().withLength(max: 64)();

  TextColumn get familyName => text().withLength(max: 64)();

  TextColumn get hospitalNo => text().named('hospitalNo').withLength(max: 64)();

  TextColumn get uniqueId => text().withLength(max: 64).nullable()();

  DateTimeColumn get dateOfBirth => dateTime().named('dateOfBirth')();

  TextColumn get sex => text().withLength(max: 8)();

  TextColumn get phone => text().withLength(max: 32).nullable()();

  TextColumn get facility => text().withLength(max: 256)();

  TextColumn get outletCode =>
      text().named('outletCode').withLength(max: 37).nullable()();

  TextColumn get facilityCode =>
      text().named('facilityCode').withLength(max: 37)();

  TextColumn get address => text().withLength(max: 512).nullable()();

  DateTimeColumn get lastClinicVisit => dateTime().nullable()();

  DateTimeColumn get lastRefillDate => dateTime().nullable()();

  DateTimeColumn get nextAppointmentDate => dateTime().nullable()();

  DateTimeColumn get nextVisitDate => dateTime().nullable()();

  DateTimeColumn get dateStarted => dateTime().nullable()();

  TextColumn get uuid => text().withLength(max: 37)();

  DateTimeColumn get viralLoadDate => dateTime().nullable()();

  BoolColumn get synced => boolean().withDefault(Constant(false))();

  TextColumn get lastClinicStage => text().withLength(max: 16).nullable()();

  TextColumn get lastViralLoad => text().withLength(max: 16).nullable()();

  BoolColumn get deleted => boolean().withDefault(Constant(false))();

  TextColumn get targetGroup => text().withLength(max: 16).nullable()();
}

class Dispense extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  TextColumn get patientId => text().named('patientId').withLength(max: 37)();

  DateTimeColumn get dateNextRefill => dateTime().named('dateNextRefill')();

  TextColumn get medications =>
      text().map(ListMedicationConverter()).nullable()();

  BoolColumn get synced => boolean().withDefault(Constant(false))();

  BoolColumn get missedDoses => boolean().withDefault(Constant(false))();

  BoolColumn get adverseIssues => boolean().withDefault(Constant(false))();

  TextColumn get uuid => text().withLength(max: 37)();

/*Medication? getArv() {
    var meds = medications.where((m) => m.arv).toList();
    if (meds.isNotEmpty) {
      return meds.first;
    }
    return null;
  }*/
}

class Medication {
  String regimen;
  int quantityPrescribed;
  int quantityDispensed;
  bool arv;

  factory Medication.instance() => Medication(
      regimen: '', quantityPrescribed: 0, quantityDispensed: 0, arv: true);

  Medication(
      {required this.regimen,
      required this.quantityPrescribed,
      required this.quantityDispensed,
      required this.arv});

  factory Medication.fromJson(Map<String, dynamic> row) => Medication(
      regimen: row['regimen'],
      quantityPrescribed: row['qtyPrescribed'] ?? 0,
      quantityDispensed: row['qtyDispensed'] ?? 0,
      arv: row['arv']);

  Map<String, dynamic> toJson() => {
        'regimen': regimen,
        'qtyDispensed': quantityDispensed,
        'qtyPrescribed': quantityPrescribed,
        'arv': arv
      };
}

class Clinic extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get systolic => integer().nullable()();

  IntColumn get diastolic => integer().nullable()();

  RealColumn get weight => real().nullable()();

  RealColumn get temperature => real().nullable()();

  TextColumn get patientId => text().named('patientId').withLength(max: 37)();

  DateTimeColumn get date => dateTime()();

  BoolColumn get coughing => boolean().nullable()();

  BoolColumn get swelling => boolean().nullable()();

  BoolColumn get sweating => boolean().nullable()();

  BoolColumn get fever => boolean().nullable()();

  BoolColumn get weightLoss => boolean().nullable()();

  BoolColumn get tbReferred => boolean().nullable()();

  TextColumn get uuid => text().withLength(max: 37)();

  BoolColumn get synced => boolean().withDefault(Constant(false))();

/*bool isEmpty() =>
      systolic == null &&
          diastolic == null &&
          weight == null &&
          temperature == null &&
          coughing == null &&
          swelling == null &&
          sweating == null &&
          fever == null &&
          weightLoss == null &&
          tbReferred == null;*/
}

class ViralLoad extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  TextColumn get value => text().withLength(max: 16)();

  DateTimeColumn get nextAppointment => dateTime()();

  TextColumn get patientId => text().withLength(max: 37)();

  TextColumn get uuid => text().withLength(max: 37)();

  TextColumn get type => text().withLength(max: 16).nullable()();

  BoolColumn get synced => boolean().withDefault(Constant(false))();
}

class Regimen extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 256)();

  TextColumn get regimenType => text().withLength(max: 256)();

  BoolColumn get arv => boolean().withDefault(Constant(false))();
}

class Devolve extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get reasonDiscontinued => text().withLength(max: 128).nullable()();

  DateTimeColumn get date => dateTime()();

  TextColumn get outletCode => text().withLength(max: 37)();

  TextColumn get patientId => text().withLength(max: 37)();

  TextColumn get uuid => text().withLength(max: 37)();

  BoolColumn get synced => boolean().withDefault(Constant(false))();
}

class Facility extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 256)();

  TextColumn get code => text().withLength(max: 37)();
}

class Outlet extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 256)();

  TextColumn get code => text().withLength(max: 37)();
}
