import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

@entity
class Patient {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String givenName;
  String familyName;
  String hospitalNo;
  String? uniqueId;
  DateTime dateOfBirth;
  String sex;
  String? phone;
  String? facility;
  String? outletCode;
  DateTime dateDevolved;
  String facilityCode;
  String address;
  DateTime lastClinicVisit;
  DateTime lastRefillDate;
  DateTime nextAppointmentDate;
  DateTime nextVisitDate;
  bool? serviceDiscontinued;
  String? reasonDiscontinued;
  DateTime dateDiscontinued;
  DateTime dateStarted;
  String uuid;
  bool synced;
  String? lastClinicStage;
  String? lastViralLoad;
  bool? deleted = false;

  Patient(
      {this.id,
      required this.givenName,
      required this.familyName,
      required this.hospitalNo,
      required this.dateOfBirth,
      required this.sex,
      this.phone,
      this.facility,
      this.outletCode,
      required this.dateDevolved,
      required this.facilityCode,
      required this.address,
      required this.lastClinicVisit,
      required this.lastRefillDate,
      required this.nextAppointmentDate,
      required this.nextVisitDate,
      this.serviceDiscontinued,
      this.reasonDiscontinued,
      required this.dateDiscontinued,
      required this.dateStarted,
      this.lastClinicStage,
      required this.uuid,
      this.lastViralLoad,
      this.uniqueId,
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
      dateDevolved: row['dateDevolved'] != null
          ? DateTime.parse(row['dateDevolved'])
          : DateTime(1900),
      facilityCode: row['facilityCode'],
      address: row['address'],
      lastClinicVisit: row['lastClinicVisit'] != null
          ? DateTime.parse(row['lastClinicVisit'])
          : DateTime(1900),
      lastRefillDate: row['lastRefillDate'] != null
          ? DateTime.parse(row['lastRefillDate'])
          : DateTime(1900),
      nextAppointmentDate: row['nextAppointmentDate'] != null
          ? DateTime.parse(row['nextAppointmentDate'])
          : DateTime(1900),
      nextVisitDate: row['nextVisitDate'] != null
          ? DateTime.parse(row['nextVisitDate'])
          : DateTime(1900),
      serviceDiscontinued: row['serviceDiscontinued'],
      reasonDiscontinued: row['reasonDiscontinued'],
      dateDiscontinued: row['dateDiscontinued'] != null
          ? DateTime.parse(row['dateDiscontinued'])
          : DateTime(1900),
      dateStarted: row['dateStarted'] != null
          ? DateTime.parse(row['dateStarted'])
          : DateTime(1900),
      lastClinicStage: row['lastClinicStage'],
      uuid: row['id'],
      lastViralLoad: row['lastViralLoad'],
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
        'facility': facility,
        'outletCode': outletCode,
        'facilityCode': facilityCode,
        'address': address,
        'lastClinicVisit': lastClinicVisit.toIso8601String().substring(0, 10),
        'lastRefillDate': lastRefillDate.toIso8601String().substring(0, 10),
        'nextAppointmentDate':
            nextAppointmentDate.toIso8601String().substring(0, 10),
        'nextVisitDate': nextVisitDate.toIso8601String().substring(0, 10),
        'serviceDiscontinued': serviceDiscontinued,
        'reasonDiscontinued': reasonDiscontinued,
        'dateDiscontinued': dateDiscontinued.toIso8601String().substring(0, 10),
        'dateStarted': dateDiscontinued.toIso8601String().substring(0, 10),
        'deleted': deleted,
        'lastViralLoad': lastViralLoad,
        'dateDevolved': dateDevolved.toIso8601String().substring(0, 10)
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
        dateDevolved: DateTime(1900),
        facilityCode: '',
        address: '',
        lastClinicVisit: DateTime(1900),
        lastRefillDate: DateTime(1900),
        nextAppointmentDate: DateTime(1900),
        nextVisitDate: DateTime(1900),
        serviceDiscontinued: false,
        reasonDiscontinued: '',
        dateDiscontinued: DateTime(1900),
        dateStarted: DateTime(1900),
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
      'patientId': patientId,
      'dateNextRefill': dateNextRefill.toIso8601String().substring(0, 10),
      'missedDoses': missedDoses,
      'adverseIssues': adverseIssues,
      'medications': medications
    };
  }

  List<Medication> getArvs() {
    return medications.where((m) => m.arv).toList();
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
      row['patientId'],
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
        'patientId': patientId,
        'date': date.toIso8601String().substring(0, 10),
        'coughing': coughing,
        'swelling': swelling,
        'fever': fever,
        'weightLoss': weightLoss,
        'tbReferred': tbReferred
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
      Regimen(row['id'], row['name'], row['regimenType'], row['arv']);
}

@entity
class Facility {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final int level1AD;
  final int level2AD;
  final String code;

  Facility(this.name, this.level1AD, this.level2AD, this.code);

  factory Facility.fromJson(Map<String, dynamic> row) =>
      Facility(row['name'], row['level1AD'], row['level2AD'], row['code']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'level1AD': level1AD, 'level2AD': level2AD, 'code': code};
}

@entity
class Outlet {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String type;
  final String code;
  String? facilityCode;

  Outlet(this.name, this.address, this.phone, this.email, this.type, this.code,
      this.facilityCode);

  factory Outlet.fromJson(Map<String, dynamic> row) => Outlet(
      row['name'],
      row['address'],
      row['phone'],
      row['email'],
      row['type'],
      row['code'],
      row['facilityCode']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
        'code': code,
        'email': email,
        'type': type,
        'facilityCode': facilityCode
      };
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
      quantityPrescribed: row['quantityPrescribed'],
      quantityDispensed: row['quantityDispensed'],
      arv: row['arv']);

  Map<String, dynamic> toJson() => {
        'regimen': regimen,
        'quantityDispensed': quantityDispensed,
        'quantityPrescribed': quantityPrescribed,
        'arv': arv
      };
}
