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
  String phoneNumber;
  String facility;
  String siteCode;
  String address;
  DateTime lastClinicVisit;
  DateTime lastRefillDate;
  DateTime nextAppointmentDate;
  DateTime nextVisitDate;
  bool serviceDiscontinued;
  String reasonDiscontinued;
  DateTime dateDiscontinued;
  bool synced;

  Patient(
      this.id,
      this.givenName,
      this.familyName,
      this.hospitalNo,
      this.dateOfBirth,
      this.sex,
      this.phoneNumber,
      this.facility,
      this.siteCode,
      this.address,
      this.lastClinicVisit,
      this.lastRefillDate,
      this.nextAppointmentDate,
      this.nextVisitDate,
      this.serviceDiscontinued,
      this.reasonDiscontinued,
      this.dateDiscontinued,
      this.synced);

  factory Patient.fromJson(Map<String, dynamic> row) => Patient(
      row['id'],
      row['givenName'],
      row['familyName'],
      row['hospitalNo'],
      row['dateOfBirth'],
      row['sex'],
      row['phoneNumber'],
      row['assignedRegimen'],
      row['facility'],
      row['siteCode'],
      row['address'],
      row['lastClinicVisit'],
      row['lastRefillDate'],
      row['nextTptDate'],
      row['nextAppointmentDate'],
      row['reasonDiscontinued'],
      row['dateDiscontinued'],
      row['synced']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'givenName': givenName,
        'familyName': familyName,
        'hospitalNo': hospitalNo,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'sex': sex,
        'phoneNumber': phoneNumber,
        'facility': facility,
        'siteCode': siteCode,
        'address': address,
        'lastClinicVisit':
            lastClinicVisit != null ? lastClinicVisit.toIso8601String() : null,
        'lastRefillDate':
            lastRefillDate != null ? lastRefillDate.toIso8601String() : null,
        'nextViralLoadDate': nextAppointmentDate != null
            ? nextAppointmentDate.toIso8601String()
            : null,
        'nextVisitDate':
            nextVisitDate != null ? nextVisitDate.toIso8601String() : null,
        'serviceDiscontinued': serviceDiscontinued,
        'reasonDiscontinued': reasonDiscontinued,
        'dateDiscontinued':
            dateDiscontinued != null ? dateDiscontinued.toIso8601String() : null
      };
}

@entity
class Refill {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String regimen;
  int patientId;
  int quantityPrescribed;
  int quantityDispensed;
  DateTime dateNextRefill;
  bool synced;
  bool? missedDoses;
  bool? adverseIssues;
  String? barcode;

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
      this.barcode,
      this.synced);
}

@Entity(tableName: 'clinic')
class ClinicData {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? systolic;
  int? diastolic;
  double? weight;
  double? temperature;
  final int patientId;
  final DateTime date;
  bool? coughing;
  bool? swelling;
  bool? sweating;
  bool? fever;
  bool? weightLoss;
  bool? tbReferred;
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
      this.synced);
}
