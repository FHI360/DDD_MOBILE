import 'package:DDD/app_state.dart';
import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

@entity
class Patient {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String givenName;
  String familyName;
  String? hospitalNo;
  String uniqueId;
  DateTime dateOfBirth;
  String sex;
  String? phone;
  String? facility;
  String? outletCode;
  String facilityCode;
  String address;
  DateTime lastClinicVisit;
  DateTime lastRefillDate;
  DateTime nextAppointmentDate;
  DateTime nextVisitDate;
  DateTime dateStarted;
  String uuid;
  DateTime viralLoadDate;
  bool synced;
  String? lastClinicStage;
  String? lastViralLoad;
  bool? deleted = false;
  String? targetGroup;

  Patient(
      {this.id,
      required this.givenName,
      required this.familyName,
      this.hospitalNo,
      required this.dateOfBirth,
      required this.sex,
      this.targetGroup,
      this.phone,
      this.facility,
      this.outletCode,
      required this.facilityCode,
      required this.address,
      required this.lastClinicVisit,
      required this.lastRefillDate,
      required this.nextAppointmentDate,
      required this.nextVisitDate,
      required this.dateStarted,
      this.lastClinicStage,
      required this.uuid,
      this.lastViralLoad,
      required this.viralLoadDate,
      required this.uniqueId,
      required this.synced});

  factory Patient.fromJson(Map<String, dynamic> row) => Patient(
      id: null,
      givenName: row['givenName'],
      familyName: row['familyName'],
      hospitalNo: row['hospitalNo'],
      dateOfBirth: DateTime.parse(row['dateOfBirth']),
      sex: row['sex'],
      phone: row['phone'],
      facility: row['facility'],
      outletCode: row['outletCode'],
      facilityCode: row['facilityCode'],
      address: row['address'],
      targetGroup: row['targetGroup'],
      lastClinicVisit: row['lastClinicVisit'] != null
          ? DateTime.parse(row['lastClinicVisit'])
          : DateTime(1900),
      lastRefillDate: row['lastRefillDate'] != null
          ? DateTime.parse(row['lastRefillDate'])
          : DateTime(1900),
      nextAppointmentDate: row['nextRefillDate'] != null
          ? DateTime.parse(row['nextRefillDate'])
          : DateTime(1900),
      nextVisitDate: row['nextVisitDate'] != null
          ? DateTime.parse(row['nextVisitDate'])
          : DateTime(1900),
      viralLoadDate: row['viralLoadDate'] != null
          ? DateTime.parse(row['viralLoadDate'])
          : DateTime(1900),
      dateStarted: row['dateStarted'] != null
          ? DateTime.parse(row['dateStarted'])
          : DateTime(1900),
      lastClinicStage: row['clinicStage'],
      uuid: row['id'],
      lastViralLoad: row['viralLoad'],
      uniqueId: row['uniqueId'],
      synced: true);

  Map<String, dynamic> toJson() => {
        'id': uuid,
        'givenName': givenName,
        'familyName': familyName,
        'hospitalNo': hospitalNo,
        'dateOfBirth': dateOfBirth.toIso8601String().substring(0, 10),
        'sex': sex,
        'phone': phone,
        'organisation': {'id': facilityCode},
        'address': address,
        'dateStarted': dateStarted.toIso8601String().substring(0, 10),
        'archived': deleted,
        'uniqueId': uniqueId,
        'clinicStage': lastClinicStage,
        'targetGroup': targetGroup
      };

  factory Patient.instance() {
    var uuid = Uuid();
    return Patient(
        id: null,
        givenName: '',
        familyName: '',
        hospitalNo: '',
        dateOfBirth: DateTime(1900),
        sex: '',
        phone: '',
        facility: '',
        outletCode: '',
        facilityCode: '',
        address: '',
        lastClinicVisit: DateTime(1900),
        lastRefillDate: DateTime(1900),
        nextAppointmentDate: DateTime(1900),
        nextVisitDate: DateTime(1900),
        dateStarted: DateTime(1900),
        viralLoadDate: DateTime(1900),
        lastClinicStage: '',
        uuid: uuid.v4(),
        lastViralLoad: '',
        uniqueId: '',
        synced: false);
  }
}

@entity
class Dispense {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String patientId;
  DateTime dateNextRefill;
  List<Medication> medications;
  bool synced;
  bool? missedDoses;
  bool? adverseIssues;
  String uuid;

  Dispense(
      {this.id,
      required this.date,
      required this.patientId,
      required this.dateNextRefill,
      this.missedDoses,
      this.adverseIssues,
      required this.medications,
      required this.synced,
      required this.uuid});

  factory Dispense.fromJson(Map<String, dynamic> row) {
    dynamic value = row['medications'];
    List<Medication> medications = [];
    medications = List.from(value).map((e) => Medication.fromJson(e)).toList();
    return Dispense(
        id: null,
        date: DateTime.parse(row['date']),
        patientId: row['patientId'],
        dateNextRefill: DateTime.parse(row['dateNextRefill']),
        missedDoses: row['missedDoses'],
        adverseIssues: row['adverseIssues'],
        medications: medications,
        synced: true,
        uuid: row['id']);
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data = [];
    medications.forEach((e) => data.add(e.toJson()));
    return {
      'id': uuid,
      'date': date.toIso8601String().substring(0, 10),
      'patient': {'id': patientId},
      'dateNextRefill': dateNextRefill.toIso8601String().substring(0, 10),
      'missedDoses': missedDoses,
      'adverseIssues': adverseIssues,
      'medications': medications,
      'organisation': {'id': FFAppState().activationCode}
    };
  }

  Medication? getArv() {
    var meds = medications.where((m) => m.arv).toList();
    if (meds.isNotEmpty) {
      return meds.first;
    }
    return null;
  }
}

@Entity(tableName: 'Clinic')
class Clinic {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? systolic;
  int? diastolic;
  double? weight;
  double? temperature;
  final String patientId;
  final DateTime date;
  bool? coughing;
  bool? swelling;
  bool? sweating;
  bool? fever;
  bool? weightLoss;
  bool? tbReferred;
  String uuid;
  final bool synced;

  Clinic(
      this.id,
      this.systolic,
      this.diastolic,
      this.weight,
      this.temperature,
      this.patientId,
      this.date,
      this.coughing,
      this.swelling,
      this.sweating,
      this.fever,
      this.weightLoss,
      this.tbReferred,
      this.uuid,
      this.synced);

  factory Clinic.fromJson(Map<String, dynamic> row) => Clinic(
      null,
      row['systolic'],
      row['diastolic'],
      row['weight'],
      row['temperature'],
      row['patientId']['id'],
      row['date'],
      row['coughing'],
      row['swelling'],
      row['sweating'],
      row['fever'],
      row['weightLoss'],
      row['tbReferred'],
      row['id'],
      true);

  Map<String, dynamic> toJson() => {
        'id': uuid,
        'systolic': systolic,
        'diastolic': diastolic,
        'weight': weight,
        'temperature': temperature,
        'patient': {'id': patientId},
        'date': date.toIso8601String().substring(0, 10),
        'coughing': coughing,
        'swelling': swelling,
        'fever': fever,
        'weightLoss': weightLoss,
        'tbReferred': tbReferred,
        'organisation': {'id': FFAppState().activationCode}
      };
}

@Entity(tableName: 'ViralLoad')
class ViralLoad {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String? value;
  DateTime nextAppointment;
  String patientId;
  String uuid;
  final bool synced;

  ViralLoad(
      {this.id,
      required this.nextAppointment,
      required this.patientId,
      required this.date,
      required this.uuid,
      this.value,
      required this.synced});

  factory ViralLoad.instance() {
    var uuid = Uuid();
    return ViralLoad(
        nextAppointment: DateTime(1900),
        patientId: '',
        date: DateTime.now(),
        uuid: uuid.v4(),
        synced: false);
  }

  Map<String, dynamic> toJson() => {
        'id': uuid,
        'value': value,
        'patient': {'id': patientId},
        'date': date.toIso8601String().substring(0, 10),
        'nextAppointment': nextAppointment.toIso8601String().substring(0, 10)
      };
}

@entity
class Regimen {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String regimenType;
  final bool arv;

  Regimen(this.id, this.name, this.regimenType, this.arv);

  factory Regimen.fromJson(Map<String, dynamic> row) =>
      Regimen(row['id'], row['name'], row['type']['name'], row['arv']);
}

@entity
class Facility {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String code;

  Facility(this.name, this.code);

  factory Facility.fromJson(Map<String, dynamic> row) =>
      Facility(row['name'] ?? '', row['id']);
}

@entity
class Outlet {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String code;
  String? facilityCode;

  Outlet(this.name, this.code, this.facilityCode);

  factory Outlet.fromJson(Map<String, dynamic> row) =>
      Outlet(row['name'] ?? '', row['id'] ?? '', row['facilityCode'] ?? '');
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
      quantityPrescribed: row['qtyPrescribed'],
      quantityDispensed: row['qtyDispensed'],
      arv: row['arv']);

  Map<String, dynamic> toJson() => {
        'regimen': regimen,
        'qtyDispensed': quantityDispensed,
        'qtyPrescribed': quantityPrescribed,
        'arv': arv
      };
}

@entity
class Devolve {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? reasonDiscontinued;
  DateTime date;
  String outletCode;
  String patientId;
  String uuid;
  bool synced;

  Devolve(
      {this.id,
      this.reasonDiscontinued,
      required this.date,
      required this.outletCode,
      required this.patientId,
      required this.synced,
      required this.uuid});

  factory Devolve.instance() {
    final uuid = Uuid();
    return Devolve(
        date: DateTime(1900),
        outletCode: '',
        patientId: '',
        synced: false,
        uuid: uuid.v4());
  }

  factory Devolve.fromJson(Map<String, dynamic> payload) {
    return new Devolve(
        id: null,
        date: DateTime.parse(payload['date']),
        outletCode: payload['outlet'],
        patientId: payload['patientId'],
        uuid: payload['id'],
        reasonDiscontinued: payload['reasonDiscontinued'],
        synced: true);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uuid,
      'date': date.toIso8601String(),
      'patient': {'id': patientId},
      'organisation': {'id': outletCode},
      'reasonDiscontinued': reasonDiscontinued
    };
  }
}
