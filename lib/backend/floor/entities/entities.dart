import 'dart:core';

import 'package:floor/floor.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

@Entity(tableName: 'Summary')
class Summary {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  int stock;
  int covid;
  int syncedCovid;
  int firstDose;
  int secondDose;
  int boosterDose;
  int boosterDose2;
  int johnson;
  int moderna;
  int pfizer;
  int astra;
  int routine;
  int aefi;
  int declinations;
  String? state;
  String? lga;
  String? team;
  bool? synced = false;

  Summary(
      {this.id,
      required this.date,
      required this.stock,
      required this.covid,
      required this.syncedCovid,
      required this.firstDose,
      required this.secondDose,
      required this.boosterDose,
      required this.boosterDose2,
      required this.johnson,
      required this.routine,
      required this.pfizer,
      required this.astra,
      required this.aefi,
      required this.declinations,
      required this.moderna,
      this.state,
      this.lga,
      this.team,
      this.synced});

  factory Summary.instance() {
    final now = DateTime.now();
    return Summary(
        date: DateTime(now.year, now.month, now.day),
        stock: 0,
        covid: 0,
        syncedCovid: 0,
        firstDose: 0,
        secondDose: 0,
        boosterDose: 0,
        boosterDose2: 0,
        johnson: 0,
        routine: 0,
        pfizer: 0,
        astra: 0,
        aefi: 0,
        declinations: 0,
        moderna: 0);
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String().substring(0, 10),
        'stock': stock,
        'covid': covid,
        'firstDose': firstDose,
        'secondDose': secondDose,
        'boosterDose': boosterDose,
        'boosterDose2': boosterDose2,
        'johnson': johnson,
        'moderna': moderna,
        'pfizer': pfizer,
        'astra': astra,
        'routine': routine,
        'aefi': aefi,
        'declinations': declinations,
        'state': state,
        'lga': lga,
        'team': team
      };
}

@Entity(tableName: 'AEFI')
class AEFI {
  @PrimaryKey(autoGenerate: true)
  int? id;
  bool? synced;
  DateTime date;
  String type;
  String lga;
  String state;
  String ward;
  String healthFacility;
  String vaccinationNo;
  List<Vaccination> vaccinations;
  bool? anaphylaxis;
  String? anaphylaxisBp;
  int? anaphylaxisPulse;
  bool? syncope;
  String? syncopeBp;
  int? syncopePulse;
  bool? seizures;
  String? seizuresType;
  bool? severeLocalReaction1;
  bool? severeLocalReaction2;
  bool? abcess;
  bool? generalizedRash;
  bool? fever;
  int? temperature;
  bool? persistentCries;
  bool? sepsis;
  bool? encephalopathy;
  bool? toxicShock;
  bool? thrombocytopenia;
  bool? afp;
  String? otherAdverseEffect;
  DateTime dateStarted;
  bool? hospitalized;
  DateTime dateHealthFacilityNotified;
  String? symptoms;
  String? medicalHistory;
  String? treatmentsReceived;
  bool? investigationDone;
  bool? hospitalized2;
  bool? incapacitation;
  bool? threatToLife;
  bool? death;
  bool? congenitalAnomaly;
  String? otherChallenges;
  bool? movedToReferenceCenter;
  String? referenceCenter;
  String? referenceCenterAddress;
  DateTime dateReferred;
  String? outcome;
  DateTime dateOfDeath;
  bool? autopsy;
  DateTime dateOfReporting;
  String reportType;
  String reporter;
  String designation;
  String? phone;
  String? email;

  AEFI(
      {this.id,
      required this.date,
      required this.type,
      required this.lga,
      required this.state,
      required this.ward,
      required this.healthFacility,
      required this.vaccinationNo,
      required this.vaccinations,
      this.anaphylaxisBp,
      this.anaphylaxisPulse,
      this.syncopeBp,
      this.syncopePulse,
      this.seizures,
      this.seizuresType,
      this.severeLocalReaction1,
      this.severeLocalReaction2,
      this.abcess,
      this.anaphylaxis,
      this.syncope,
      this.generalizedRash,
      this.fever,
      this.temperature,
      this.persistentCries,
      this.sepsis,
      this.encephalopathy,
      this.toxicShock,
      this.thrombocytopenia,
      this.afp,
      this.hospitalized2,
      this.otherAdverseEffect,
      required this.dateStarted,
      this.hospitalized,
      required this.dateHealthFacilityNotified,
      this.symptoms,
      this.medicalHistory,
      this.treatmentsReceived,
      this.investigationDone,
      this.incapacitation,
      this.threatToLife,
      this.death,
      this.congenitalAnomaly,
      this.otherChallenges,
      this.movedToReferenceCenter,
      this.referenceCenter,
      this.referenceCenterAddress,
      required this.dateReferred,
      this.outcome,
      required this.dateOfDeath,
      this.autopsy,
      required this.dateOfReporting,
      required this.reportType,
      required this.reporter,
      required this.designation,
      this.phone,
      this.email,
      this.synced});

  factory AEFI.instance() => AEFI(
      date: DateTime.now(),
      type: '',
      lga: '',
      state: '',
      ward: '',
      healthFacility: '',
      vaccinationNo: '',
      vaccinations: [],
      dateStarted: DateTime(1900),
      dateHealthFacilityNotified: DateTime(1900),
      dateReferred: DateTime(1900),
      dateOfDeath: DateTime(1900),
      dateOfReporting: DateTime(1900),
      reportType: '',
      reporter: '',
      designation: '');

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data = [];
    vaccinations.forEach((e) => data.add(e.toJson()));

    return {
      'date': date.toIso8601String().substring(0, 10),
      'type': type,
      'lga': lga,
      'state': state,
      'ward': ward,
      'healthFacility': healthFacility,
      'vaccinationNo': vaccinationNo,
      'vaccinations': data,
      'anaphylaxis': anaphylaxis,
      'anaphylaxisBp': anaphylaxisBp,
      'anaphylaxisPulse': anaphylaxisPulse,
      'syncope': syncope,
      'syncopeBp': syncopeBp,
      'syncopePulse': syncopePulse,
      'seizures': seizures,
      'seizuresType': seizuresType,
      'severeLocalReaction1': severeLocalReaction1,
      'severeLocalReaction2': severeLocalReaction2,
      'abcess': abcess,
      'generalizedRash': generalizedRash,
      'fever': fever,
      'temperature': temperature,
      'persistentCries': persistentCries,
      'sepsis': sepsis,
      'encephalopathy': encephalopathy,
      'toxicShock': toxicShock,
      'thrombocytopenia': thrombocytopenia,
      'afp': afp,
      'otherAdverseEffect': otherAdverseEffect,
      'dateStarted': dateStarted.toIso8601String().substring(0, 10),
      'hospitalized': hospitalized,
      'dateHealthFacilityNotified': dateHealthFacilityNotified != DateTime(1900)
          ? dateHealthFacilityNotified.toIso8601String().substring(0, 10)
          : null,
      'symptoms': symptoms,
      'medicalHistory': medicalHistory,
      'treatmentsReceived': treatmentsReceived,
      'investigationDone': investigationDone,
      'hospitalized2': hospitalized2,
      'incapacitation': incapacitation,
      'threatToLife': threatToLife,
      'death': death,
      'congenitalAnomaly': congenitalAnomaly,
      'otherChallenges': otherChallenges,
      'movedToReferenceCenter': movedToReferenceCenter,
      'referenceCenter': referenceCenter,
      'referenceCenterAddress': referenceCenterAddress,
      'dateReferred': dateReferred != DateTime(1900)
          ? dateReferred.toIso8601String().substring(0, 10)
          : null,
      'outcome': outcome,
      'dateOfDeath': dateOfDeath != DateTime(1900)
          ? dateOfDeath.toIso8601String().substring(0, 10)
          : null,
      'autopsy': autopsy,
      'dateOfReporting': dateOfReporting.toIso8601String().substring(0, 10),
      'reportType': reportType,
      'reporter': reporter,
      'designation': designation,
      'phone': phone,
      'email': email,
    };
  }
}

@Entity(tableName: 'Account')
class Account {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String team;
  String lga;
  String state;
  bool? artClinic;
  String? accessToken;
  String? refreshToken;
  DateTime lastSync;

  Account(
      {required this.state,
      required this.team,
      required this.lga,
      required this.artClinic,
      this.accessToken,
      this.refreshToken,
      required this.lastSync});

  bool valid() =>
      refreshToken != null &&
      refreshToken!.isNotEmpty &&
      JwtDecoder.tryDecode(refreshToken!) != null &&
      !JwtDecoder.isExpired(refreshToken!);
}

@Entity(tableName: 'Declination')
class Declination {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? sex;
  DateTime dateOfBirth;
  bool? dobEstimated = false;
  String? pregnancyStatus;
  String? levelOfEducation;
  String? email;
  String? state;
  String? lga;
  String? team;
  DateTime date;
  String? address;
  String? phone;
  LatLng latLng;
  DeclinationReasons reasonsForDeclining;
  String? occupation;
  String? occupationType;
  bool? synced;

  Declination(
      {this.id,
      required this.date,
      this.sex,
      required this.dateOfBirth,
      this.dobEstimated,
      this.pregnancyStatus,
      this.email,
      this.state,
      this.lga,
      this.team,
      this.address,
      this.phone,
      required this.latLng,
      required this.reasonsForDeclining,
      this.occupation,
      this.synced,
      this.occupationType});

  factory Declination.instance() => Declination(
      date: DateTime.now(),
      dateOfBirth: DateTime(1900),
      latLng: LatLng.instance(),
      reasonsForDeclining: DeclinationReasons());

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String().substring(0, 10),
      'sex': sex,
      'dateOfBirth': dateOfBirth.toIso8601String().substring(0, 10),
      'dobEstimated': dobEstimated,
      'pregnancyStatus': pregnancyStatus,
      'email': email,
      'state': state,
      'lga': lga,
      'team': team,
      'address': address,
      'phone': phone,
      'latLng': latLng.toJson(),
      'reasonsForDeclining': reasonsForDeclining.reasons,
      'occupation': occupation,
      'occupationType': occupationType
    };
  }
}

@Entity(tableName: 'CovidVaccination')
class CovidVaccination {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String? familyName;
  String? givenName;
  String? sex;
  DateTime dateOfBirth;
  bool? dobEstimated = false;
  String? vaccinationNo;
  String? uniqueId;
  String? pregnancyStatus;
  String? email;
  String? state;
  String? lga;
  String? address;
  String? phone;
  LatLng latLng;
  String? occupation;
  String? occupationType;
  String? idType;
  String? idNumber;
  String? qrCode;
  bool? historyOfAllergy;
  MedicalConditions medicalConditions = MedicalConditions();
  String? picture;
  String? levelOfEducation;
  String? team;
  List<VaccinationEvent> events;
  bool? synced;

  CovidVaccination(
      {this.id,
      required this.date,
      this.familyName,
      this.givenName,
      this.sex,
      required this.dateOfBirth,
      this.dobEstimated,
      this.pregnancyStatus,
      this.vaccinationNo,
      this.email,
      this.state,
      this.lga,
      this.team,
      this.address,
      this.phone,
      required this.latLng,
      this.idType,
      this.idNumber,
      this.occupation,
      this.occupationType,
      this.qrCode,
      this.historyOfAllergy,
      required this.events,
      this.levelOfEducation,
      required this.medicalConditions,
      this.picture,
      this.synced});

  factory CovidVaccination.instance() => CovidVaccination(
      date: DateTime.now(),
      dateOfBirth: DateTime(1900, 1, 1),
      latLng: LatLng(latitude: 0, longitude: 0),
      events: [],
      medicalConditions: MedicalConditions());

  factory CovidVaccination.fromJson(Map<String, dynamic> payload) {
    dynamic value = payload['events'];
    List<VaccinationEvent> events = [];
    events = List.from(value).map((e) => VaccinationEvent.fromJson(e)).toList();

    value = payload['medicalConditions'];
    MedicalConditions medicalConditions = MedicalConditions();
    final _value = value?.map((e) => e.toString()).toList();
    final List<String> conditions = [];
    _value?.forEach((v) => value.add(v.toString()));
    medicalConditions.conditions = conditions;

    return CovidVaccination(
        date: payload['date'] != null
            ? DateTime.parse(payload['date'])
            : DateTime.now(),
        dateOfBirth: DateTime.parse(payload['dateOfBirth']),
        latLng: payload['latLng'] != null
            ? LatLng.fromJson(payload['latLng'])
            : LatLng.instance(),
        events: events,
        medicalConditions: medicalConditions,
        familyName: payload['familyName'],
        givenName: payload['givenName'],
        sex: payload['sex'],
        vaccinationNo: payload['vaccinationNo'],
        state: payload['state'],
        lga: payload['lga'],
        team: payload['team'],
        address: payload['address'],
        qrCode: payload['qrCode'],
        dobEstimated: payload['dobEstimated'],
        pregnancyStatus: payload['pregnancyStatus'],
        email: payload['email'],
        phone: payload['phone'],
        idType: payload['idType'],
        idNumber: payload['idNumber'],
        occupation: payload['occupation'],
        occupationType: payload['occupationType'],
        historyOfAllergy: payload['historyOfAllergy'],
        picture: payload['picture'],
        levelOfEducation: payload['levelOfEducation']);
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data = [];
    events.forEach((e) => data.add(e.toJson()));
    return {
      'familyName': familyName,
      'givenName': givenName,
      'sex': sex,
      'dateOfBirth': dateOfBirth.toIso8601String().substring(0, 10),
      'vaccinationNo': vaccinationNo,
      'state': state,
      'lga': lga,
      'team': team,
      'address': address,
      'qrCode': qrCode,
      'dobEstimated': dobEstimated,
      'pregnancyStatus': pregnancyStatus,
      'email': email,
      'phone': phone,
      'latLng': latLng.toJson(),
      'idType': idType,
      'idNumber': idNumber,
      'occupation': occupation,
      'occupationType': occupationType,
      'historyOfAllergy': historyOfAllergy,
      'picture': picture,
      'levelOfEducation': levelOfEducation,
      'medicalConditions': medicalConditions.conditions,
      'events': data
    };
  }
}

@Entity(tableName: 'DCT')
class DCT {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? vaccineCards;
  int? qrCodes;
  int? vaccineRegisters;
  int? tallyRegisters;
  DateTime date;
  String? state;
  String? team;
  String? lga;
  bool? synced;

  DCT(
      {this.id,
      this.vaccineCards,
      this.qrCodes,
      this.vaccineRegisters,
      this.tallyRegisters,
      required this.date,
      this.state,
      this.lga,
      this.synced,
      this.team});

  factory DCT.instance() => DCT(
        date: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'vaccinationCards': vaccineCards,
        'vaccineRegisters': vaccineRegisters,
        'tallyRegisters': tallyRegisters,
        'qrCodes': qrCodes,
        'team': team,
        'state': state,
        'lga': lga,
        'date': date.toIso8601String().substring(0, 10)
      };
}

@Entity(tableName: 'RoutineVaccination')
class RoutineVaccination {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String? familyName;
  String? givenName;
  String? sex;
  DateTime dateOfBirth;
  String? vaccinationNo;
  String? stateOfOrigin;
  String? lgaOfOrigin;
  String? nationality;
  String? address;
  String? state;
  String? lga;
  String? team;
  FromBirth fromBirth;
  From6Weeks from6Weeks;
  From10Weeks from10Weeks;
  From14Weeks from14Weeks;
  From6Months from6Months;
  From9Months from9Months;
  From12Months from12Months;
  From15Months from15Months;
  From9Years from9Years;
  bool? synced;
  String? caregiver;
  String? caregiverPhone;
  String? caregiverGender;
  String? caregiverRelationship;

  RoutineVaccination(
      {this.id,
      required this.date,
      this.familyName,
      this.givenName,
      this.sex,
      required this.dateOfBirth,
      this.vaccinationNo,
      this.nationality,
      this.stateOfOrigin,
      this.lgaOfOrigin,
      this.state,
      this.address,
      this.lga,
      this.team,
      this.caregiver,
      this.caregiverPhone,
      this.caregiverGender,
      this.caregiverRelationship,
      required this.fromBirth,
      required this.from6Weeks,
      required this.from10Weeks,
      required this.from14Weeks,
      required this.from6Months,
      required this.from9Months,
      required this.from12Months,
      required this.from15Months,
      required this.from9Years,
      this.synced});

  factory RoutineVaccination.instance() => RoutineVaccination(
      date: DateTime.now(),
      dateOfBirth: DateTime(1900),
      fromBirth: FromBirth.instance(),
      from6Weeks: From6Weeks.instance(),
      from10Weeks: From10Weeks.instance(),
      from14Weeks: From14Weeks.instance(),
      from6Months: From6Months.instance(),
      from9Months: From9Months.instance(),
      from12Months: From12Months.instance(),
      from15Months: From15Months.instance(),
      from9Years: From9Years.instance());

  Map<String, dynamic> toJson() => {
        'familyName': familyName,
        'givenName': givenName,
        'sex': sex,
        'dateOfBirth': dateOfBirth.toIso8601String().substring(0, 10),
        'vaccinationNo': vaccinationNo,
        'stateOfOrigin': stateOfOrigin,
        'lgaOfOrigin': lgaOfOrigin,
        'nationality': nationality,
        'address': address,
        'state': state,
        'lga': lga,
        'team': team,
        'caregiver': caregiver,
        'caregiverPhone': caregiverPhone,
        'caregiverGender': caregiverGender,
        'caregiverRelationship': caregiverRelationship,
        'fromBirth': fromBirth.toJson(),
        'from6Weeks': from6Weeks.toJson(),
        'from10Weeks': from10Weeks.toJson(),
        'from14Weeks': from14Weeks.toJson(),
        'from6Months': from6Months.toJson(),
        'from9Months': from9Months.toJson(),
        'from12Months': from12Months.toJson(),
        'from15Months': from15Months.toJson(),
        'from9Years': from9Years.toJson()
      };
}

@Entity(tableName: 'stock')
class Stock {
  @PrimaryKey(autoGenerate: true)
  int? id;
  DateTime date;
  String? state;
  String? team;
  String? lga;
  List<StockEntry> opening;
  StockState used;
  StockState discarded;
  StockState returned;
  bool? synced;

  Stock(
      {this.id,
      required this.date,
      this.state,
      this.team,
      this.lga,
      this.synced,
      required this.opening,
      required this.used,
      required this.discarded,
      required this.returned});

  factory Stock.instance() => Stock(
      date: DateTime.now(),
      opening: [],
      used: StockState.instance(),
      discarded: StockState.instance(),
      returned: StockState.instance());

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> data = [];
    opening.forEach((e) => data.add(e.toJson()));
    /*final data = <String, dynamic>{};
    opening.forEach((e) => data.addAll(e.toJson()));*/
    return {
      'date': date.toIso8601String().substring(0, 10),
      'state': state,
      'lga': lga,
      'team': team,
      'opening': data,
      'used': used.toJson(),
      'discarded': discarded.toJson(),
      'returned': returned.toJson()
    };
  }
}

class StockEntry {
  String? vaccine;
  int? vials;
  String? batchNo;
  DateTime? expiryDate;

  StockEntry({this.vials, this.vaccine, this.batchNo, this.expiryDate});

  factory StockEntry.instance() => StockEntry();

  factory StockEntry.fromJson(Map<String, dynamic> json) => StockEntry(
      vials: json['vials'],
      vaccine: json['vaccine'],
      batchNo: json['batchNo'],
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null);

  Map<String, dynamic> toJson() => {
        'batchNo': batchNo,
        'vials': vials,
        'vaccine': vaccine,
        'expiryDate': expiryDate != null
            ? expiryDate!.toIso8601String().substring(0, 10)
            : null
      };
}

class StockState {
  int? astrazenca;
  int? pfizer;
  int? johnson;
  int? moderna;

  StockState({this.astrazenca, this.pfizer, this.johnson, this.moderna});

  factory StockState.instance() => StockState();

  bool hasEntry() =>
      astrazenca != null ||
      pfizer != null ||
      johnson != null ||
      moderna != null;

  factory StockState.fromJson(Map<String, dynamic> json) => StockState(
      astrazenca: json['astrazenca'],
      pfizer: json['pfizer'],
      johnson: json['johnson'],
      moderna: json['moderna']);

  Map<String, dynamic> toJson() => {
        'astrazenca': astrazenca,
        'pfizer': pfizer,
        'johnson': johnson,
        'moderna': moderna
      };
}

class VaccinationEvent {
  String dose;
  String vaccine;
  DateTime date;
  String? location;
  String? batchNo;
  DateTime expiryDate;
  String? adverseEffect;
  DateTime dateOfAdverseEffect;
  LatLng latLng;
  String lga;
  String team;
  String state;
  bool? backlog;
  bool? saved;

  VaccinationEvent(
      {required this.dose,
      required this.vaccine,
      required this.date,
      this.location,
      this.batchNo,
      this.backlog,
      required this.expiryDate,
      this.adverseEffect,
      required this.dateOfAdverseEffect,
      required this.latLng,
      required this.state,
      required this.lga,
      required this.team,
      this.saved});

  factory VaccinationEvent.fromJson(Map<String, dynamic> json) =>
      VaccinationEvent(
          dose: json['dose'],
          vaccine: json['vaccine'],
          date: json['date'] != null
              ? DateTime.parse(json['date'])
              : DateTime(1900),
          location: json['location'],
          batchNo: json['batchNo'],
          expiryDate: json['expiryDate'] != null
              ? DateTime.parse(json['expiryDate'])
              : DateTime(1900),
          adverseEffect: json['adverseEffect'],
          dateOfAdverseEffect: json['dateOfAdverseEffect'] != null
              ? DateTime.parse(json['dateOfAdverseEffect'])
              : DateTime(1900),
          latLng: json['latLng'] != null
              ? LatLng.fromJson(json['latLng'])
              : LatLng.instance(),
          state: json['state'] ?? '',
          saved: json['saved'] != null && json['saved'],
          lga: json['lga'] ?? '',
          backlog: json['backlog'] ?? false,
          team: json['team'] ?? '');

  Map<String, dynamic> toJson() => {
        'dose': dose,
        'vaccine': vaccine,
        'date': date.toIso8601String().substring(0, 10),
        'location': location,
        'batchNo': batchNo,
        'expiryDate': expiryDate.toIso8601String().substring(0, 10),
        'adverseEffect': adverseEffect,
        'dateOfAdverseEffect':
            dateOfAdverseEffect.toIso8601String().substring(0, 10),
        'backlog': backlog,
        'latLng': latLng.toJson(),
        'state': state,
        'lga': lga,
        'team': team,
        'saved': saved
      };
}

class LatLng {
  double latitude;
  double longitude;

  LatLng({required this.latitude, required this.longitude});

  factory LatLng.instance() => LatLng(latitude: 0, longitude: 0);

  factory LatLng.fromJson(Map<String, dynamic> json) =>
      LatLng(latitude: json['latitude'], longitude: json['longitude']);

  Map<String, dynamic> toJson() =>
      {'latitude': latitude, 'longitude': longitude};
}

class From6Months {
  DateTime vitaminA;
  LatLng? vitaminALatLng;
  String? vitaminATeam;

  From6Months({required this.vitaminA, this.vitaminALatLng, this.vitaminATeam});

  factory From6Months.instance() => From6Months(
      vitaminA: DateTime(1900),
      vitaminALatLng: LatLng.instance(),
      vitaminATeam: '');

  factory From6Months.fromJson(Map<String, dynamic> json) => From6Months(
      vitaminA: json['vitaminA'] != null
          ? DateTime.parse(json['vitaminA'])
          : DateTime(1900, 1, 1),
      vitaminALatLng: json['vitaminALatLng'] != null
          ? LatLng.fromJson(json['vitaminALatLng'])
          : null,
      vitaminATeam: json['vitaminATeam']);

  Map<String, dynamic> toJson() => {
        'vitaminA': vitaminA.toIso8601String().substring(0, 10),
        'vitaminALatLng': vitaminALatLng,
        'vitaminATeam': vitaminATeam
      };
}

class From6Weeks {
  DateTime pentavalent;
  LatLng? pentavalentLatLng;
  String? pentavalentTeam;
  DateTime pnemoccocal;
  LatLng? pnemoccocalLatLng;
  String? pnemoccocalTeam;
  DateTime opv;
  LatLng? opvLatLng;
  String? opvTeam;
  DateTime ipv;
  LatLng? ipvLatLng;
  String? ipvTeam;
  DateTime rotavirus;
  LatLng? rotavirusLatLng;
  String? rotavirusTeam;

  From6Weeks(
      {required this.pentavalent,
      this.pentavalentLatLng,
      this.pentavalentTeam,
      required this.pnemoccocal,
      this.pnemoccocalLatLng,
      this.pnemoccocalTeam,
      required this.opv,
      this.opvLatLng,
      this.opvTeam,
      required this.ipv,
      this.ipvLatLng,
      this.ipvTeam,
      required this.rotavirus,
      this.rotavirusLatLng,
      this.rotavirusTeam});

  factory From6Weeks.instance() => From6Weeks(
      pentavalent: DateTime(1900),
      pnemoccocal: DateTime(1900),
      opv: DateTime(1900),
      ipv: DateTime(1900),
      rotavirus: DateTime(1900));

  factory From6Weeks.fromJson(Map<String, dynamic> json) => From6Weeks(
      pentavalent: json['pentavalent'] != null
          ? DateTime.parse(json['pentavalent'])
          : DateTime(1900, 1, 1),
      pentavalentLatLng: json['pentavalentLatLng'] != null
          ? LatLng.fromJson(json['pentavalentLatLng'])
          : null,
      pentavalentTeam: json['pentavalentTeam'],
      pnemoccocal: json['pnemoccocal'] != null
          ? DateTime.parse(json['pnemoccocal'])
          : DateTime(1900, 1, 1),
      pnemoccocalLatLng: json['pnemoccocalLatLng'] != null
          ? LatLng.fromJson(json['pnemoccocalLatLng'])
          : null,
      pnemoccocalTeam: json['pnemoccocalTeam'],
      opv: json['opv'] != null
          ? DateTime.parse(json['opv'])
          : DateTime(1900, 1, 1),
      opvLatLng:
          json['opvLatLng'] != null ? LatLng.fromJson(json['opvLatLng']) : null,
      opvTeam: json['opvTeam'],
      ipv: json['ipv'] != null
          ? DateTime.parse(json['ipv'])
          : DateTime(1900, 1, 1),
      ipvLatLng:
          json['ipvLatLng'] != null ? LatLng.fromJson(json['ipvLatLng']) : null,
      ipvTeam: json['ipvTeam'],
      rotavirus: json['rotavirus'] != null
          ? DateTime.parse(json['rotavirus'])
          : DateTime(1900, 1, 1),
      rotavirusLatLng: json['rotavirusLatLng'] != null
          ? LatLng.fromJson(json['rotavirusLatLng'])
          : null,
      rotavirusTeam: json['rotavirusTeam']);

  Map<String, dynamic> toJson() => {
        'pentavalent': pentavalent.toIso8601String().substring(0, 10),
        'pentavalentLatLng': pentavalentLatLng,
        'pentavalentTeam': pentavalentTeam,
        'pnemoccocal': pnemoccocal.toIso8601String().substring(0, 10),
        'pnemoccocalLatLng': pnemoccocalLatLng,
        'pnemoccocalTeam': pnemoccocalTeam,
        'opv': opv.toIso8601String().substring(0, 10),
        'opvLatLng': opvLatLng,
        'opvTeam': opvTeam,
        'ipv': ipv.toIso8601String().substring(0, 10),
        'ipvLatLng': ipvLatLng,
        'ipvTeam': ipvTeam,
        'rotavirus': rotavirus.toIso8601String().substring(0, 10),
        'rotavirusLatLng': rotavirusLatLng,
        'rotavirusTeam': rotavirusTeam,
      };
}

class From9Months {
  DateTime measles;
  LatLng? measlesLatLng;
  String? measlesTeam;
  DateTime yellowFever;
  LatLng? yellowFeverLatLng;
  String? yellowFeverTeam;
  DateTime meningitis;
  LatLng? meningitisLatLng;
  String? meningitisTeam;
  DateTime vitaminA;
  LatLng? vitaminALatLng;
  String? vitaminATeam;
  DateTime rotavirus;
  LatLng? rotavirusLatLng;
  String? rotavirusTeam;

  From9Months(
      {required this.measles,
      this.measlesLatLng,
      this.measlesTeam,
      required this.yellowFever,
      this.yellowFeverLatLng,
      this.yellowFeverTeam,
      required this.meningitis,
      this.meningitisLatLng,
      this.meningitisTeam,
      required this.vitaminA,
      this.vitaminALatLng,
      this.vitaminATeam,
      required this.rotavirus,
      this.rotavirusLatLng,
      this.rotavirusTeam});

  factory From9Months.instance() => From9Months(
      measles: DateTime(1900),
      yellowFever: DateTime(1900),
      meningitis: DateTime(1900),
      vitaminA: DateTime(1900),
      rotavirus: DateTime(1900));

  factory From9Months.fromJson(Map<String, dynamic> json) => From9Months(
      measles: json['measles'] != null
          ? DateTime.parse(json['measles'])
          : DateTime(1900, 1, 1),
      measlesLatLng: json['measlesLatLng'] != null
          ? LatLng.fromJson(json['measlesLatLng'])
          : null,
      measlesTeam: json['measlesTeam'],
      yellowFever: json['yellowFever'] != null
          ? DateTime.parse(json['yellowFever'])
          : DateTime(1900, 1, 1),
      yellowFeverLatLng: json['yellowFeverLatLng'] != null
          ? LatLng.fromJson(json['yellowFeverLatLng'])
          : null,
      yellowFeverTeam: json['yellowFeverTeam'],
      meningitis: json['meningitis'] != null
          ? DateTime.parse(json['meningitis'])
          : DateTime(1900, 1, 1),
      meningitisLatLng: json['meningitisLatLng'] != null
          ? LatLng.fromJson(json['meningitisLatLng'])
          : null,
      meningitisTeam: json['meningitisTeam'],
      vitaminA: json['vitaminA'] != null
          ? DateTime.parse(json['vitaminA'])
          : DateTime(1900, 1, 1),
      vitaminALatLng: json['vitaminALatLng'] != null
          ? LatLng.fromJson(json['vitaminALatLng'])
          : null,
      vitaminATeam: json['vitaminATeam'],
      rotavirus: json['rotavirus'] != null
          ? DateTime.parse(json['rotavirus'])
          : DateTime(1900, 1, 1),
      rotavirusLatLng: json['rotavirusLatLng'] != null
          ? LatLng.fromJson(json['rotavirusLatLng'])
          : null,
      rotavirusTeam: json['rotavirusTeam']);

  Map<String, dynamic> toJson() => {
        'measles': measles.toIso8601String().substring(0, 10),
        'measlesLatLng': measlesLatLng,
        'measlesTeam': measlesTeam,
        'yellowFever': yellowFever.toIso8601String().substring(0, 10),
        'yellowFeverLatLng': yellowFeverLatLng,
        'yellowFeverTeam': yellowFeverTeam,
        'meningitis': meningitis.toIso8601String().substring(0, 10),
        'meningitisLatLng': meningitisLatLng,
        'meningitisTeam': meningitisTeam,
        'vitaminA': vitaminA.toIso8601String().substring(0, 10),
        'vitaminALatLng': vitaminALatLng,
        'vitaminATeam': vitaminATeam,
        'rotavirus': rotavirus.toIso8601String().substring(0, 10),
        'rotavirusLatLng': rotavirusLatLng,
        'rotavirusTeam': rotavirusTeam,
      };
}

class From9Years {
  DateTime hpv;
  LatLng hpvLatLng;
  String hpvTeam;

  From9Years(
      {required this.hpv, required this.hpvLatLng, required this.hpvTeam});

  factory From9Years.instance() => From9Years(
      hpv: DateTime(1900), hpvLatLng: LatLng.instance(), hpvTeam: '');

  factory From9Years.fromJson(Map<String, dynamic> json) => From9Years(
      hpv: json['hpv'] != null
          ? DateTime.parse(json['hpv'])
          : DateTime(1900, 1, 1),
      hpvLatLng: LatLng.fromJson(json['hpvLatLng']),
      hpvTeam: json['hpvTeam']);

  Map<String, dynamic> toJson() => {
        'hpv': hpv.toIso8601String().substring(0, 10),
        'hpvLatLng': hpvLatLng,
        'hpvTeam': hpvTeam
      };
}

class From10Weeks {
  DateTime pentavalent;
  LatLng? pentavalentLatLng;
  String? pentavalentTeam;
  DateTime pnemoccocal;
  LatLng? pnemoccocalLatLng;
  String? pnemoccocalTeam;
  DateTime opv;
  LatLng? opvLatLng;
  String? opvTeam;
  DateTime rotavirus;
  LatLng? rotavirusLatLng;
  String? rotavirusTeam;

  From10Weeks(
      {required this.pentavalent,
      this.pentavalentLatLng,
      this.pentavalentTeam,
      required this.pnemoccocal,
      this.pnemoccocalLatLng,
      this.pnemoccocalTeam,
      required this.opv,
      this.opvLatLng,
      this.opvTeam,
      required this.rotavirus,
      this.rotavirusLatLng,
      this.rotavirusTeam});

  factory From10Weeks.instance() => From10Weeks(
      pentavalent: DateTime(1900),
      pnemoccocal: DateTime(1900),
      opv: DateTime(1900),
      rotavirus: DateTime(1900));

  factory From10Weeks.fromJson(Map<String, dynamic> json) => From10Weeks(
      pentavalent: json['pentavalent'] != null
          ? DateTime.parse(json['pentavalent'])
          : DateTime(1900, 1, 1),
      pentavalentLatLng: json['pentavalentLatLng'] != null
          ? LatLng.fromJson(json['pentavalentLatLng'])
          : null,
      pentavalentTeam: json['pentavalentTeam'],
      pnemoccocal: json['pnemoccocal'] != null
          ? DateTime.parse(json['pnemoccocal'])
          : DateTime(1900, 1, 1),
      pnemoccocalLatLng: json['pnemoccocalLatLng'] != null
          ? LatLng.fromJson(json['pnemoccocalLatLng'])
          : null,
      pnemoccocalTeam: json['pnemoccocalTeam'],
      opv: json['opv'] != null
          ? DateTime.parse(json['opv'])
          : DateTime(1900, 1, 1),
      opvLatLng:
          json['opvLatLng'] != null ? LatLng.fromJson(json['opvLatLng']) : null,
      opvTeam: json['opvTeam'],
      rotavirus: json['rotavirus'] != null
          ? DateTime.parse(json['rotavirus'])
          : DateTime(1900, 1, 1),
      rotavirusLatLng: json['rotavirusLatLng'] != null
          ? LatLng.fromJson(json['rotavirusLatLng'])
          : null,
      rotavirusTeam: json['rotavirusTeam']);

  Map<String, dynamic> toJson() => {
        'pentavalent': pentavalent.toIso8601String().substring(0, 10),
        'pentavalentLatLng': pentavalentLatLng,
        'pentavalentTeam': pentavalentTeam,
        'pnemoccocal': pnemoccocal.toIso8601String().substring(0, 10),
        'pnemoccocalLatLng': pnemoccocalLatLng,
        'pnemoccocalTeam': pnemoccocalTeam,
        'opv': opv.toIso8601String().substring(0, 10),
        'opvLatLng': opvLatLng,
        'opvTeam': opvTeam,
        'rotavirus': rotavirus.toIso8601String().substring(0, 10),
        'rotavirusLatLng': rotavirusLatLng,
        'rotavirusTeam': rotavirusTeam,
      };
}

class From12Months {
  DateTime measles;
  LatLng? measlesLatLng;
  String? measlesTeam;
  DateTime yellowFever;
  LatLng? yellowFeverLatLng;
  String? yellowFeverTeam;
  DateTime meningitis;
  LatLng? meningitisLatLng;
  String? meningitisTeam;
  DateTime vitaminA;
  LatLng? vitaminALatLng;
  String? vitaminATeam;
  DateTime rotavirus;
  LatLng? rotavirusLatLng;
  String? rotavirusTeam;

  From12Months(
      {required this.measles,
      this.measlesLatLng,
      this.measlesTeam,
      required this.yellowFever,
      this.yellowFeverLatLng,
      this.yellowFeverTeam,
      required this.meningitis,
      this.meningitisLatLng,
      this.meningitisTeam,
      required this.vitaminA,
      this.vitaminALatLng,
      this.vitaminATeam,
      required this.rotavirus,
      this.rotavirusLatLng,
      this.rotavirusTeam});

  factory From12Months.instance() => From12Months(
      measles: DateTime(1900),
      yellowFever: DateTime(1900),
      meningitis: DateTime(1900),
      vitaminA: DateTime(1900),
      rotavirus: DateTime(1900));

  factory From12Months.fromJson(Map<String, dynamic> json) => From12Months(
      measles: json['measles'] != null
          ? DateTime.parse(json['measles'])
          : DateTime(1900, 1, 1),
      measlesLatLng: json['measlesLatLng'] != null
          ? LatLng.fromJson(json['measlesLatLng'])
          : null,
      measlesTeam: json['measlesTeam'],
      yellowFever: json['yellowFever'] != null
          ? DateTime.parse(json['yellowFever'])
          : DateTime(1900, 1, 1),
      yellowFeverLatLng: json['yellowFeverLatLng'] != null
          ? LatLng.fromJson(json['yellowFeverLatLng'])
          : null,
      yellowFeverTeam: json['yellowFeverTeam'],
      meningitis: json['meningitis'] != null
          ? DateTime.parse(json['meningitis'])
          : DateTime(1900, 1, 1),
      meningitisLatLng: json['meningitisLatLng'] != null
          ? LatLng.fromJson(json['meningitisLatLng'])
          : null,
      meningitisTeam: json['meningitisTeam'],
      vitaminA: json['vitaminA'] != null
          ? DateTime.parse(json['vitaminA'])
          : DateTime(1900, 1, 1),
      vitaminALatLng: json['vitaminALatLng'] != null
          ? LatLng.fromJson(json['vitaminALatLng'])
          : null,
      vitaminATeam: json['vitaminATeam'],
      rotavirus: json['rotavirus'] != null
          ? DateTime.parse(json['rotavirus'])
          : DateTime(1900, 1, 1),
      rotavirusLatLng: json['rotavirusLatLng'] != null
          ? LatLng.fromJson(json['rotavirusLatLng'])
          : null,
      rotavirusTeam: json['rotavirusTeam']);

  Map<String, dynamic> toJson() => {
        'measles': measles.toIso8601String().substring(0, 10),
        'measlesLatLng': measlesLatLng,
        'measlesTeam': measlesTeam,
        'yellowFever': yellowFever.toIso8601String().substring(0, 10),
        'yellowFeverLatLng': yellowFeverLatLng,
        'yellowFeverTeam': yellowFeverTeam,
        'meningitis': meningitis.toIso8601String().substring(0, 10),
        'meningitisLatLng': meningitisLatLng,
        'meningitisTeam': meningitisTeam,
        'vitaminA': vitaminA.toIso8601String().substring(0, 10),
        'vitaminALatLng': vitaminALatLng,
        'vitaminATeam': vitaminATeam,
        'rotavirus': rotavirus.toIso8601String().substring(0, 10),
        'rotavirusLatLng': rotavirusLatLng,
        'rotavirusTeam': rotavirusTeam,
      };
}

class From14Weeks {
  DateTime pentavalent;
  LatLng? pentavalentLatLng;
  String? pentavalentTeam;
  DateTime pnemoccocal;
  LatLng? pnemoccocalLatLng;
  String? pnemoccocalTeam;
  DateTime opv;
  LatLng? opvLatLng;
  String? opvTeam;
  DateTime ipv;
  LatLng? ipvLatLng;
  String? ipvTeam;
  DateTime rotavirus;
  LatLng? rotavirusLatLng;
  String? rotavirusTeam;

  From14Weeks(
      {required this.pentavalent,
      this.pentavalentLatLng,
      this.pentavalentTeam,
      required this.pnemoccocal,
      this.pnemoccocalLatLng,
      this.pnemoccocalTeam,
      required this.opv,
      this.opvLatLng,
      this.opvTeam,
      required this.ipv,
      this.ipvLatLng,
      this.ipvTeam,
      required this.rotavirus,
      this.rotavirusLatLng,
      this.rotavirusTeam});

  factory From14Weeks.instance() => From14Weeks(
      pentavalent: DateTime(1900),
      pnemoccocal: DateTime(1900),
      opv: DateTime(1900),
      ipv: DateTime(1900),
      rotavirus: DateTime(1900));

  factory From14Weeks.fromJson(Map<String, dynamic> json) => From14Weeks(
      pentavalent: json['pentavalent'] != null
          ? DateTime.parse(json['pentavalent'])
          : DateTime(1900, 1, 1),
      pentavalentLatLng: json['pentavalentLatLng'] != null
          ? LatLng.fromJson(json['pentavalentLatLng'])
          : null,
      pentavalentTeam: json['pentavalentTeam'],
      pnemoccocal: json['pnemoccocalFever'] != null
          ? DateTime.parse(json['pnemoccocalFever'])
          : DateTime(1900, 1, 1),
      pnemoccocalLatLng: json['pnemoccocalLatLng'] != null
          ? LatLng.fromJson(json['pnemoccocalLatLng'])
          : null,
      pnemoccocalTeam: json['pnemoccocalTeam'],
      opv: json['opv'] != null
          ? DateTime.parse(json['opv'])
          : DateTime(1900, 1, 1),
      opvLatLng:
          json['opvLatLng'] != null ? LatLng.fromJson(json['opvLatLng']) : null,
      opvTeam: json['opvTeam'],
      ipv: json['ipv'] != null
          ? DateTime.parse(json['ipv'])
          : DateTime(1900, 1, 1),
      ipvLatLng:
          json['ipvLatLng'] != null ? LatLng.fromJson(json['ipvLatLng']) : null,
      ipvTeam: json['ipvTeam'],
      rotavirus: json['rotavirus'] != null
          ? DateTime.parse(json['rotavirus'])
          : DateTime(1900, 1, 1),
      rotavirusLatLng: json['rotavirusLatLng'] != null
          ? LatLng.fromJson(json['rotavirusLatLng'])
          : null,
      rotavirusTeam: json['rotavirusTeam']);

  Map<String, dynamic> toJson() => {
        'pentavalent': pentavalent.toIso8601String().substring(0, 10),
        'pentavalentLatLng': pentavalentLatLng,
        'pentavalentTeam': pentavalentTeam,
        'pnemoccocal': pnemoccocal.toIso8601String().substring(0, 10),
        'pnemoccocalLatLng': pnemoccocalLatLng,
        'pnemoccocalTeam': pnemoccocalTeam,
        'opv': opv.toIso8601String().substring(0, 10),
        'opvLatLng': opvLatLng,
        'opvTeam': opvTeam,
        'rotavirus': rotavirus.toIso8601String().substring(0, 10),
        'rotavirusLatLng': rotavirusLatLng,
        'rotavirusTeam': rotavirusTeam,
      };
}

class From15Months {
  DateTime measles;
  LatLng measlesLatLng;
  String measlesTeam;

  From15Months(
      {required this.measles,
      required this.measlesLatLng,
      required this.measlesTeam});

  factory From15Months.instance() => From15Months(
      measles: DateTime(1900),
      measlesLatLng: LatLng.instance(),
      measlesTeam: '');

  factory From15Months.fromJson(Map<String, dynamic> json) => From15Months(
      measles: json['measles'] != null
          ? DateTime.parse(json['measles'])
          : DateTime(1900, 1, 1),
      measlesLatLng: LatLng.fromJson(json['measlesLatLng']),
      measlesTeam: json['measlesTeam']);

  Map<String, dynamic> toJson() => {
        'measles': measles.toIso8601String().substring(0, 10),
        'measlesLatLng': measlesLatLng,
        'measlesTeam': measlesTeam,
      };
}

class FromBirth {
  DateTime opv;
  LatLng? opvLatLng;
  String? opvTeam;
  DateTime bcg;
  LatLng? bcgLatLng;
  String? bcgTeam;
  DateTime hepB;
  LatLng? hepBLatLng;
  String? hepBTeam;

  FromBirth(
      {required this.opv,
      this.opvLatLng,
      this.opvTeam,
      required this.bcg,
      this.bcgLatLng,
      this.bcgTeam,
      required this.hepB,
      this.hepBLatLng,
      this.hepBTeam});

  factory FromBirth.instance() =>
      FromBirth(opv: DateTime(1900), bcg: DateTime(1900), hepB: DateTime(1900));

  factory FromBirth.fromJson(Map<String, dynamic> json) => FromBirth(
      bcg: json['bcg'] != null
          ? DateTime.parse(json['bcg'])
          : DateTime(1900, 1, 1),
      bcgLatLng:
          json['bcgLatLng'] != null ? LatLng.fromJson(json['bcgLatLng']) : null,
      bcgTeam: json['bcgTeam'],
      hepB: json['hepB'] != null
          ? DateTime.parse(json['hepB'])
          : DateTime(1900, 1, 1),
      hepBLatLng: json['hepBLatLng'] != null
          ? LatLng.fromJson(json['hepBLatLng'])
          : null,
      hepBTeam: json['hepBTeam'],
      opv: json['opv'] != null
          ? DateTime.parse(json['opv'])
          : DateTime(1900, 1, 1),
      opvLatLng:
          json['opvLatLng'] != null ? LatLng.fromJson(json['opvLatLng']) : null,
      opvTeam: json['opvTeam']);

  Map<String, dynamic> toJson() => {
        'bcg': bcg.toIso8601String().substring(0, 10),
        'bcgLatLng': bcgLatLng,
        'bcgTeam': bcgTeam,
        'hepB': hepB.toIso8601String().substring(0, 10),
        'hepBLatLng': hepBLatLng,
        'hepBTeam': hepBTeam,
        'opv': opv.toIso8601String().substring(0, 10),
        'opvLatLng': opvLatLng,
        'opvTeam': opvTeam
      };
}

class DeclinationReasons {
  List<String> reasons = [];
}

class MedicalConditions {
  List<String> conditions = [];
}

class Vaccination {
  String vaccine;
  String brand;
  DateTime dateOfVaccination;
  String dose;
  String batchNo;
  String diluentBatchNo;
  String inventoryNumber;
  String diluentInventoryNumber;
  DateTime expirationDate;
  DateTime diluentExpirationDate;

  Vaccination({
    required this.vaccine,
    required this.brand,
    required this.dateOfVaccination,
    required this.dose,
    required this.batchNo,
    required this.diluentBatchNo,
    required this.inventoryNumber,
    required this.diluentInventoryNumber,
    required this.expirationDate,
    required this.diluentExpirationDate,
  });

  factory Vaccination.instance() => Vaccination(
      vaccine: '',
      brand: '',
      dateOfVaccination: DateTime(1900),
      dose: '',
      batchNo: '',
      diluentBatchNo: '',
      inventoryNumber: '',
      diluentInventoryNumber: '',
      expirationDate: DateTime(1900),
      diluentExpirationDate: DateTime(1900));

  Map<String, dynamic> toJson() => {
        'vaccine': vaccine,
        'brand': brand,
        'dateOfVaccination':
            dateOfVaccination.toIso8601String().substring(0, 10),
        'dose': dose,
        'batchNo': batchNo,
        'diluentBatchNo': diluentBatchNo,
        'inventoryNumber': inventoryNumber,
        'diluentInventoryNumber': diluentInventoryNumber,
        'expirationDate': expirationDate.toIso8601String().substring(0, 10),
        'diluentExpirationDate':
            diluentExpirationDate.toIso8601String().substring(0, 10)
      };

  factory Vaccination.fromJson(Map<String, dynamic> data) => Vaccination(
      vaccine: data['vaccine'],
      brand: data['brand'],
      dateOfVaccination: DateTime.parse(data['dateOfVaccination']),
      dose: data['dose'],
      batchNo: data['batchNo'],
      diluentBatchNo: data['diluentBatchNo'],
      inventoryNumber: data['inventoryNumber'],
      diluentInventoryNumber: data['diluentInventoryNumber'],
      expirationDate: DateTime.parse(data['expirationDate']),
      diluentExpirationDate: DateTime.parse(data['diluentExpirationDate']));
}
