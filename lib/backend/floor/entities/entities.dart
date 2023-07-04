import 'package:floor/floor.dart';

@entity
class Patient {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String givenName;
  String familyName;
  String hospitalNo;
  DateTime dateOfBirth;
  String sex;
  String phone;
  String facility;
  String outletCode;
  String facilityCode;
  String address;
  DateTime lastClinicVisit;
  DateTime lastRefillDate;
  DateTime nextAppointmentDate;
  DateTime nextVisitDate;
  bool serviceDiscontinued;
  String reasonDiscontinued;
  DateTime dateDiscontinued;
  DateTime dateStarted;
  String uuid;
  bool synced;

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
      this.uuid,
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
      row['id'],
      row['synced']);

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
        'dateStarted': dateDiscontinued.toIso8601String().substring(0, 10)
      };
}

@entity
class Refill {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String regimen;
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
      this.patientId,
      this.quantityPrescribed,
      this.quantityDispensed,
      this.dateNextRefill,
      this.missedDoses,
      this.adverseIssues,
      this.synced,
      this.uuid);
}

@Entity(tableName: 'clinic')
class ClinicData {
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

  ClinicData(
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
}
