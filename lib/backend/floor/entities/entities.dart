import 'package:DDD/app_state.dart';
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
      this.id,
      this.givenName,
      this.familyName,
      this.hospitalNo,
      this.dateOfBirth,
      this.sex,
      this.phone,
      this.facility,
      this.outletCode,
      this.dateDevolved,
      this.facilityCode,
      this.address,
      this.lastClinicVisit,
      this.lastRefillDate,
      this.nextAppointmentDate,
      this.nextVisitDate,
      this.serviceDiscontinued,
      this.reasonDiscontinued,
      this.dateDiscontinued,
      this.dateStarted,
      this.lastClinicStage,
      this.uuid,
      this.lastViralLoad,
      this.uniqueId,
      this.synced);

  factory Patient.fromJson(Map<String, dynamic> row) => Patient(
      null,
      row['givenName'],
      row['familyName'],
      row['hospitalNo'],
      row['dateOfBirth'],
      row['sex'],
      row['phone'],
      row['facility'],
      row['outletCode'],
      row['dateDevolved'],
      row['facilityCode'],
      row['address'],
      row['lastClinicVisit'],
      row['lastRefillDate'],
      row['nextAppointmentDate'],
      row['nextVisitDate'],
      row['serviceDiscontinued'],
      row['reasonDiscontinued'],
      row['dateDiscontinued'],
      row['dateStarted'],
      row['lastClinicStage'],
      row['id'],
      row['lastViralLoad'],
      row['uniqueId'],
      true);

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
        null,
        '',
        '',
        '',
        DateTime(1900),
        '',
        '',
        '',
        null,
        DateTime(1900),
        FFAppState().activationCode,
        '',
        DateTime(1900),
        DateTime(1900),
        DateTime(1900),
        DateTime(1900),
        null,
        null,
        DateTime(1900),
        DateTime(1900),
        null,
        uuid.v4(),
        null,
        '',
        false);
  }
}

@entity
class Refill {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String regimen;
  int regimenId;
  String patientId;
  int quantityPrescribed;
  int quantityDispensed;
  DateTime dateNextRefill;
  bool synced;
  bool? missedDoses;
  bool? adverseIssues;
  String uuid;

  Refill(
      this.id,
      this.date,
      this.regimen,
      this.regimenId,
      this.patientId,
      this.quantityPrescribed,
      this.quantityDispensed,
      this.dateNextRefill,
      this.missedDoses,
      this.adverseIssues,
      this.synced,
      this.uuid);

  factory Refill.fromJson(Map<String, dynamic> row) => Refill(
      null,
      row['date'],
      row['regimen'],
      row['regimeId'],
      row['patientId'],
      row['quantityPrescribed'],
      row['quantityDispensed'],
      row['dateNextRefill'],
      row['missedDoses'],
      row['adverseIssues'],
      true,
      row['id']);

  Map<String, dynamic> toJson() => {
        'id': uuid,
        'date': date.toIso8601String().substring(0, 10),
        'regimenId': regimenId,
        'patientId': patientId,
        'quantityPrescribed': quantityPrescribed,
        'quantityDispensed': quantityDispensed,
        'dateNextRefill': dateNextRefill.toIso8601String().substring(0, 10),
        'missedDoses': missedDoses,
        'adverseIssues': adverseIssues
      };
}

@Entity(tableName: 'clinic')
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

  Regimen(this.id, this.name, this.regimenType);

  factory Regimen.fromJson(Map<String, dynamic> row) =>
      Regimen(row['id'], row['name'], row['regimenType']);
}

@entity
class Facility {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final int level1AD;
  final int level2AD;
  final String code;
  bool? synced = false;
  bool? deleted = false;

  Facility(this.name, this.level1AD, this.level2AD, this.code);

  factory Facility.fromJson(Map<String, dynamic> row) =>
      Facility(row['name'], row['level1AD'], row['level2AD'], row['code']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'level1AD': level1AD,
        'level2AD': level2AD,
        'code': code,
        'deleted': deleted
      };
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
  bool? synced = false;
  bool? deleted = false;

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
        'facilityCode': facilityCode,
        'deleted': deleted
      };
}
