// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClinicTable extends Clinic with TableInfo<$ClinicTable, ClinicData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _systolicMeta =
      const VerificationMeta('systolic');
  @override
  late final GeneratedColumn<int> systolic = GeneratedColumn<int>(
      'systolic', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _diastolicMeta =
      const VerificationMeta('diastolic');
  @override
  late final GeneratedColumn<int> diastolic = GeneratedColumn<int>(
      'diastolic', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patientId', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _coughingMeta =
      const VerificationMeta('coughing');
  @override
  late final GeneratedColumn<bool> coughing = GeneratedColumn<bool>(
      'coughing', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("coughing" IN (0, 1))'));
  static const VerificationMeta _swellingMeta =
      const VerificationMeta('swelling');
  @override
  late final GeneratedColumn<bool> swelling = GeneratedColumn<bool>(
      'swelling', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("swelling" IN (0, 1))'));
  static const VerificationMeta _sweatingMeta =
      const VerificationMeta('sweating');
  @override
  late final GeneratedColumn<bool> sweating = GeneratedColumn<bool>(
      'sweating', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("sweating" IN (0, 1))'));
  static const VerificationMeta _feverMeta = const VerificationMeta('fever');
  @override
  late final GeneratedColumn<bool> fever = GeneratedColumn<bool>(
      'fever', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fever" IN (0, 1))'));
  static const VerificationMeta _weightLossMeta =
      const VerificationMeta('weightLoss');
  @override
  late final GeneratedColumn<bool> weightLoss = GeneratedColumn<bool>(
      'weight_loss', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("weight_loss" IN (0, 1))'));
  static const VerificationMeta _tbReferredMeta =
      const VerificationMeta('tbReferred');
  @override
  late final GeneratedColumn<bool> tbReferred = GeneratedColumn<bool>(
      'tb_referred', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("tb_referred" IN (0, 1))'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        systolic,
        diastolic,
        weight,
        temperature,
        patientId,
        date,
        coughing,
        swelling,
        sweating,
        fever,
        weightLoss,
        tbReferred,
        uuid,
        synced
      ];
  @override
  String get aliasedName => _alias ?? 'clinic';
  @override
  String get actualTableName => 'clinic';
  @override
  VerificationContext validateIntegrity(Insertable<ClinicData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('systolic')) {
      context.handle(_systolicMeta,
          systolic.isAcceptableOrUnknown(data['systolic']!, _systolicMeta));
    }
    if (data.containsKey('diastolic')) {
      context.handle(_diastolicMeta,
          diastolic.isAcceptableOrUnknown(data['diastolic']!, _diastolicMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    }
    if (data.containsKey('patientId')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patientId']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('coughing')) {
      context.handle(_coughingMeta,
          coughing.isAcceptableOrUnknown(data['coughing']!, _coughingMeta));
    }
    if (data.containsKey('swelling')) {
      context.handle(_swellingMeta,
          swelling.isAcceptableOrUnknown(data['swelling']!, _swellingMeta));
    }
    if (data.containsKey('sweating')) {
      context.handle(_sweatingMeta,
          sweating.isAcceptableOrUnknown(data['sweating']!, _sweatingMeta));
    }
    if (data.containsKey('fever')) {
      context.handle(
          _feverMeta, fever.isAcceptableOrUnknown(data['fever']!, _feverMeta));
    }
    if (data.containsKey('weight_loss')) {
      context.handle(
          _weightLossMeta,
          weightLoss.isAcceptableOrUnknown(
              data['weight_loss']!, _weightLossMeta));
    }
    if (data.containsKey('tb_referred')) {
      context.handle(
          _tbReferredMeta,
          tbReferred.isAcceptableOrUnknown(
              data['tb_referred']!, _tbReferredMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClinicData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      systolic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}systolic']),
      diastolic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}diastolic']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature']),
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patientId'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      coughing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}coughing']),
      swelling: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}swelling']),
      sweating: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sweating']),
      fever: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fever']),
      weightLoss: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}weight_loss']),
      tbReferred: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}tb_referred']),
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $ClinicTable createAlias(String alias) {
    return $ClinicTable(attachedDatabase, alias);
  }
}

class ClinicData extends DataClass implements Insertable<ClinicData> {
  final int id;
  final int? systolic;
  final int? diastolic;
  final double? weight;
  final double? temperature;
  final String patientId;
  final DateTime date;
  final bool? coughing;
  final bool? swelling;
  final bool? sweating;
  final bool? fever;
  final bool? weightLoss;
  final bool? tbReferred;
  final String uuid;
  final bool synced;
  const ClinicData(
      {required this.id,
      this.systolic,
      this.diastolic,
      this.weight,
      this.temperature,
      required this.patientId,
      required this.date,
      this.coughing,
      this.swelling,
      this.sweating,
      this.fever,
      this.weightLoss,
      this.tbReferred,
      required this.uuid,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || systolic != null) {
      map['systolic'] = Variable<int>(systolic);
    }
    if (!nullToAbsent || diastolic != null) {
      map['diastolic'] = Variable<int>(diastolic);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    map['patientId'] = Variable<String>(patientId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || coughing != null) {
      map['coughing'] = Variable<bool>(coughing);
    }
    if (!nullToAbsent || swelling != null) {
      map['swelling'] = Variable<bool>(swelling);
    }
    if (!nullToAbsent || sweating != null) {
      map['sweating'] = Variable<bool>(sweating);
    }
    if (!nullToAbsent || fever != null) {
      map['fever'] = Variable<bool>(fever);
    }
    if (!nullToAbsent || weightLoss != null) {
      map['weight_loss'] = Variable<bool>(weightLoss);
    }
    if (!nullToAbsent || tbReferred != null) {
      map['tb_referred'] = Variable<bool>(tbReferred);
    }
    map['uuid'] = Variable<String>(uuid);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  ClinicCompanion toCompanion(bool nullToAbsent) {
    return ClinicCompanion(
      id: Value(id),
      systolic: systolic == null && nullToAbsent
          ? const Value.absent()
          : Value(systolic),
      diastolic: diastolic == null && nullToAbsent
          ? const Value.absent()
          : Value(diastolic),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      patientId: Value(patientId),
      date: Value(date),
      coughing: coughing == null && nullToAbsent
          ? const Value.absent()
          : Value(coughing),
      swelling: swelling == null && nullToAbsent
          ? const Value.absent()
          : Value(swelling),
      sweating: sweating == null && nullToAbsent
          ? const Value.absent()
          : Value(sweating),
      fever:
          fever == null && nullToAbsent ? const Value.absent() : Value(fever),
      weightLoss: weightLoss == null && nullToAbsent
          ? const Value.absent()
          : Value(weightLoss),
      tbReferred: tbReferred == null && nullToAbsent
          ? const Value.absent()
          : Value(tbReferred),
      uuid: Value(uuid),
      synced: Value(synced),
    );
  }

  factory ClinicData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClinicData(
      id: serializer.fromJson<int>(json['id']),
      systolic: serializer.fromJson<int?>(json['systolic']),
      diastolic: serializer.fromJson<int?>(json['diastolic']),
      weight: serializer.fromJson<double?>(json['weight']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      patientId: serializer.fromJson<String>(json['patientId']),
      date: serializer.fromJson<DateTime>(json['date']),
      coughing: serializer.fromJson<bool?>(json['coughing']),
      swelling: serializer.fromJson<bool?>(json['swelling']),
      sweating: serializer.fromJson<bool?>(json['sweating']),
      fever: serializer.fromJson<bool?>(json['fever']),
      weightLoss: serializer.fromJson<bool?>(json['weightLoss']),
      tbReferred: serializer.fromJson<bool?>(json['tbReferred']),
      uuid: serializer.fromJson<String>(json['uuid']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'systolic': serializer.toJson<int?>(systolic),
      'diastolic': serializer.toJson<int?>(diastolic),
      'weight': serializer.toJson<double?>(weight),
      'temperature': serializer.toJson<double?>(temperature),
      'patientId': serializer.toJson<String>(patientId),
      'date': serializer.toJson<DateTime>(date),
      'coughing': serializer.toJson<bool?>(coughing),
      'swelling': serializer.toJson<bool?>(swelling),
      'sweating': serializer.toJson<bool?>(sweating),
      'fever': serializer.toJson<bool?>(fever),
      'weightLoss': serializer.toJson<bool?>(weightLoss),
      'tbReferred': serializer.toJson<bool?>(tbReferred),
      'uuid': serializer.toJson<String>(uuid),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  ClinicData copyWith(
          {int? id,
          Value<int?> systolic = const Value.absent(),
          Value<int?> diastolic = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          Value<double?> temperature = const Value.absent(),
          String? patientId,
          DateTime? date,
          Value<bool?> coughing = const Value.absent(),
          Value<bool?> swelling = const Value.absent(),
          Value<bool?> sweating = const Value.absent(),
          Value<bool?> fever = const Value.absent(),
          Value<bool?> weightLoss = const Value.absent(),
          Value<bool?> tbReferred = const Value.absent(),
          String? uuid,
          bool? synced}) =>
      ClinicData(
        id: id ?? this.id,
        systolic: systolic.present ? systolic.value : this.systolic,
        diastolic: diastolic.present ? diastolic.value : this.diastolic,
        weight: weight.present ? weight.value : this.weight,
        temperature: temperature.present ? temperature.value : this.temperature,
        patientId: patientId ?? this.patientId,
        date: date ?? this.date,
        coughing: coughing.present ? coughing.value : this.coughing,
        swelling: swelling.present ? swelling.value : this.swelling,
        sweating: sweating.present ? sweating.value : this.sweating,
        fever: fever.present ? fever.value : this.fever,
        weightLoss: weightLoss.present ? weightLoss.value : this.weightLoss,
        tbReferred: tbReferred.present ? tbReferred.value : this.tbReferred,
        uuid: uuid ?? this.uuid,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('ClinicData(')
          ..write('id: $id, ')
          ..write('systolic: $systolic, ')
          ..write('diastolic: $diastolic, ')
          ..write('weight: $weight, ')
          ..write('temperature: $temperature, ')
          ..write('patientId: $patientId, ')
          ..write('date: $date, ')
          ..write('coughing: $coughing, ')
          ..write('swelling: $swelling, ')
          ..write('sweating: $sweating, ')
          ..write('fever: $fever, ')
          ..write('weightLoss: $weightLoss, ')
          ..write('tbReferred: $tbReferred, ')
          ..write('uuid: $uuid, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      systolic,
      diastolic,
      weight,
      temperature,
      patientId,
      date,
      coughing,
      swelling,
      sweating,
      fever,
      weightLoss,
      tbReferred,
      uuid,
      synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicData &&
          other.id == this.id &&
          other.systolic == this.systolic &&
          other.diastolic == this.diastolic &&
          other.weight == this.weight &&
          other.temperature == this.temperature &&
          other.patientId == this.patientId &&
          other.date == this.date &&
          other.coughing == this.coughing &&
          other.swelling == this.swelling &&
          other.sweating == this.sweating &&
          other.fever == this.fever &&
          other.weightLoss == this.weightLoss &&
          other.tbReferred == this.tbReferred &&
          other.uuid == this.uuid &&
          other.synced == this.synced);
}

class ClinicCompanion extends UpdateCompanion<ClinicData> {
  final Value<int> id;
  final Value<int?> systolic;
  final Value<int?> diastolic;
  final Value<double?> weight;
  final Value<double?> temperature;
  final Value<String> patientId;
  final Value<DateTime> date;
  final Value<bool?> coughing;
  final Value<bool?> swelling;
  final Value<bool?> sweating;
  final Value<bool?> fever;
  final Value<bool?> weightLoss;
  final Value<bool?> tbReferred;
  final Value<String> uuid;
  final Value<bool> synced;
  const ClinicCompanion({
    this.id = const Value.absent(),
    this.systolic = const Value.absent(),
    this.diastolic = const Value.absent(),
    this.weight = const Value.absent(),
    this.temperature = const Value.absent(),
    this.patientId = const Value.absent(),
    this.date = const Value.absent(),
    this.coughing = const Value.absent(),
    this.swelling = const Value.absent(),
    this.sweating = const Value.absent(),
    this.fever = const Value.absent(),
    this.weightLoss = const Value.absent(),
    this.tbReferred = const Value.absent(),
    this.uuid = const Value.absent(),
    this.synced = const Value.absent(),
  });
  ClinicCompanion.insert({
    this.id = const Value.absent(),
    this.systolic = const Value.absent(),
    this.diastolic = const Value.absent(),
    this.weight = const Value.absent(),
    this.temperature = const Value.absent(),
    required String patientId,
    required DateTime date,
    this.coughing = const Value.absent(),
    this.swelling = const Value.absent(),
    this.sweating = const Value.absent(),
    this.fever = const Value.absent(),
    this.weightLoss = const Value.absent(),
    this.tbReferred = const Value.absent(),
    required String uuid,
    this.synced = const Value.absent(),
  })  : patientId = Value(patientId),
        date = Value(date),
        uuid = Value(uuid);
  static Insertable<ClinicData> custom({
    Expression<int>? id,
    Expression<int>? systolic,
    Expression<int>? diastolic,
    Expression<double>? weight,
    Expression<double>? temperature,
    Expression<String>? patientId,
    Expression<DateTime>? date,
    Expression<bool>? coughing,
    Expression<bool>? swelling,
    Expression<bool>? sweating,
    Expression<bool>? fever,
    Expression<bool>? weightLoss,
    Expression<bool>? tbReferred,
    Expression<String>? uuid,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (systolic != null) 'systolic': systolic,
      if (diastolic != null) 'diastolic': diastolic,
      if (weight != null) 'weight': weight,
      if (temperature != null) 'temperature': temperature,
      if (patientId != null) 'patientId': patientId,
      if (date != null) 'date': date,
      if (coughing != null) 'coughing': coughing,
      if (swelling != null) 'swelling': swelling,
      if (sweating != null) 'sweating': sweating,
      if (fever != null) 'fever': fever,
      if (weightLoss != null) 'weight_loss': weightLoss,
      if (tbReferred != null) 'tb_referred': tbReferred,
      if (uuid != null) 'uuid': uuid,
      if (synced != null) 'synced': synced,
    });
  }

  ClinicCompanion copyWith(
      {Value<int>? id,
      Value<int?>? systolic,
      Value<int?>? diastolic,
      Value<double?>? weight,
      Value<double?>? temperature,
      Value<String>? patientId,
      Value<DateTime>? date,
      Value<bool?>? coughing,
      Value<bool?>? swelling,
      Value<bool?>? sweating,
      Value<bool?>? fever,
      Value<bool?>? weightLoss,
      Value<bool?>? tbReferred,
      Value<String>? uuid,
      Value<bool>? synced}) {
    return ClinicCompanion(
      id: id ?? this.id,
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      weight: weight ?? this.weight,
      temperature: temperature ?? this.temperature,
      patientId: patientId ?? this.patientId,
      date: date ?? this.date,
      coughing: coughing ?? this.coughing,
      swelling: swelling ?? this.swelling,
      sweating: sweating ?? this.sweating,
      fever: fever ?? this.fever,
      weightLoss: weightLoss ?? this.weightLoss,
      tbReferred: tbReferred ?? this.tbReferred,
      uuid: uuid ?? this.uuid,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (systolic.present) {
      map['systolic'] = Variable<int>(systolic.value);
    }
    if (diastolic.present) {
      map['diastolic'] = Variable<int>(diastolic.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (patientId.present) {
      map['patientId'] = Variable<String>(patientId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (coughing.present) {
      map['coughing'] = Variable<bool>(coughing.value);
    }
    if (swelling.present) {
      map['swelling'] = Variable<bool>(swelling.value);
    }
    if (sweating.present) {
      map['sweating'] = Variable<bool>(sweating.value);
    }
    if (fever.present) {
      map['fever'] = Variable<bool>(fever.value);
    }
    if (weightLoss.present) {
      map['weight_loss'] = Variable<bool>(weightLoss.value);
    }
    if (tbReferred.present) {
      map['tb_referred'] = Variable<bool>(tbReferred.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicCompanion(')
          ..write('id: $id, ')
          ..write('systolic: $systolic, ')
          ..write('diastolic: $diastolic, ')
          ..write('weight: $weight, ')
          ..write('temperature: $temperature, ')
          ..write('patientId: $patientId, ')
          ..write('date: $date, ')
          ..write('coughing: $coughing, ')
          ..write('swelling: $swelling, ')
          ..write('sweating: $sweating, ')
          ..write('fever: $fever, ')
          ..write('weightLoss: $weightLoss, ')
          ..write('tbReferred: $tbReferred, ')
          ..write('uuid: $uuid, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $DevolveTable extends Devolve with TableInfo<$DevolveTable, DevolveData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevolveTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _reasonDiscontinuedMeta =
      const VerificationMeta('reasonDiscontinued');
  @override
  late final GeneratedColumn<String> reasonDiscontinued =
      GeneratedColumn<String>('reason_discontinued', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _outletCodeMeta =
      const VerificationMeta('outletCode');
  @override
  late final GeneratedColumn<String> outletCode = GeneratedColumn<String>(
      'outlet_code', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, reasonDiscontinued, date, outletCode, patientId, uuid, synced];
  @override
  String get aliasedName => _alias ?? 'devolve';
  @override
  String get actualTableName => 'devolve';
  @override
  VerificationContext validateIntegrity(Insertable<DevolveData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reason_discontinued')) {
      context.handle(
          _reasonDiscontinuedMeta,
          reasonDiscontinued.isAcceptableOrUnknown(
              data['reason_discontinued']!, _reasonDiscontinuedMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('outlet_code')) {
      context.handle(
          _outletCodeMeta,
          outletCode.isAcceptableOrUnknown(
              data['outlet_code']!, _outletCodeMeta));
    } else if (isInserting) {
      context.missing(_outletCodeMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DevolveData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DevolveData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      reasonDiscontinued: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reason_discontinued']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      outletCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}outlet_code'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $DevolveTable createAlias(String alias) {
    return $DevolveTable(attachedDatabase, alias);
  }
}

class DevolveData extends DataClass implements Insertable<DevolveData> {
  final int id;
  final String? reasonDiscontinued;
  final DateTime date;
  final String outletCode;
  final String patientId;
  final String uuid;
  final bool synced;
  const DevolveData(
      {required this.id,
      this.reasonDiscontinued,
      required this.date,
      required this.outletCode,
      required this.patientId,
      required this.uuid,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || reasonDiscontinued != null) {
      map['reason_discontinued'] = Variable<String>(reasonDiscontinued);
    }
    map['date'] = Variable<DateTime>(date);
    map['outlet_code'] = Variable<String>(outletCode);
    map['patient_id'] = Variable<String>(patientId);
    map['uuid'] = Variable<String>(uuid);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  DevolveCompanion toCompanion(bool nullToAbsent) {
    return DevolveCompanion(
      id: Value(id),
      reasonDiscontinued: reasonDiscontinued == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonDiscontinued),
      date: Value(date),
      outletCode: Value(outletCode),
      patientId: Value(patientId),
      uuid: Value(uuid),
      synced: Value(synced),
    );
  }

  factory DevolveData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DevolveData(
      id: serializer.fromJson<int>(json['id']),
      reasonDiscontinued:
          serializer.fromJson<String?>(json['reasonDiscontinued']),
      date: serializer.fromJson<DateTime>(json['date']),
      outletCode: serializer.fromJson<String>(json['outletCode']),
      patientId: serializer.fromJson<String>(json['patientId']),
      uuid: serializer.fromJson<String>(json['uuid']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reasonDiscontinued': serializer.toJson<String?>(reasonDiscontinued),
      'date': serializer.toJson<DateTime>(date),
      'outletCode': serializer.toJson<String>(outletCode),
      'patientId': serializer.toJson<String>(patientId),
      'uuid': serializer.toJson<String>(uuid),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  DevolveData copyWith(
          {int? id,
          Value<String?> reasonDiscontinued = const Value.absent(),
          DateTime? date,
          String? outletCode,
          String? patientId,
          String? uuid,
          bool? synced}) =>
      DevolveData(
        id: id ?? this.id,
        reasonDiscontinued: reasonDiscontinued.present
            ? reasonDiscontinued.value
            : this.reasonDiscontinued,
        date: date ?? this.date,
        outletCode: outletCode ?? this.outletCode,
        patientId: patientId ?? this.patientId,
        uuid: uuid ?? this.uuid,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('DevolveData(')
          ..write('id: $id, ')
          ..write('reasonDiscontinued: $reasonDiscontinued, ')
          ..write('date: $date, ')
          ..write('outletCode: $outletCode, ')
          ..write('patientId: $patientId, ')
          ..write('uuid: $uuid, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, reasonDiscontinued, date, outletCode, patientId, uuid, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DevolveData &&
          other.id == this.id &&
          other.reasonDiscontinued == this.reasonDiscontinued &&
          other.date == this.date &&
          other.outletCode == this.outletCode &&
          other.patientId == this.patientId &&
          other.uuid == this.uuid &&
          other.synced == this.synced);
}

class DevolveCompanion extends UpdateCompanion<DevolveData> {
  final Value<int> id;
  final Value<String?> reasonDiscontinued;
  final Value<DateTime> date;
  final Value<String> outletCode;
  final Value<String> patientId;
  final Value<String> uuid;
  final Value<bool> synced;
  const DevolveCompanion({
    this.id = const Value.absent(),
    this.reasonDiscontinued = const Value.absent(),
    this.date = const Value.absent(),
    this.outletCode = const Value.absent(),
    this.patientId = const Value.absent(),
    this.uuid = const Value.absent(),
    this.synced = const Value.absent(),
  });
  DevolveCompanion.insert({
    this.id = const Value.absent(),
    this.reasonDiscontinued = const Value.absent(),
    required DateTime date,
    required String outletCode,
    required String patientId,
    required String uuid,
    this.synced = const Value.absent(),
  })  : date = Value(date),
        outletCode = Value(outletCode),
        patientId = Value(patientId),
        uuid = Value(uuid);
  static Insertable<DevolveData> custom({
    Expression<int>? id,
    Expression<String>? reasonDiscontinued,
    Expression<DateTime>? date,
    Expression<String>? outletCode,
    Expression<String>? patientId,
    Expression<String>? uuid,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reasonDiscontinued != null) 'reason_discontinued': reasonDiscontinued,
      if (date != null) 'date': date,
      if (outletCode != null) 'outlet_code': outletCode,
      if (patientId != null) 'patient_id': patientId,
      if (uuid != null) 'uuid': uuid,
      if (synced != null) 'synced': synced,
    });
  }

  DevolveCompanion copyWith(
      {Value<int>? id,
      Value<String?>? reasonDiscontinued,
      Value<DateTime>? date,
      Value<String>? outletCode,
      Value<String>? patientId,
      Value<String>? uuid,
      Value<bool>? synced}) {
    return DevolveCompanion(
      id: id ?? this.id,
      reasonDiscontinued: reasonDiscontinued ?? this.reasonDiscontinued,
      date: date ?? this.date,
      outletCode: outletCode ?? this.outletCode,
      patientId: patientId ?? this.patientId,
      uuid: uuid ?? this.uuid,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reasonDiscontinued.present) {
      map['reason_discontinued'] = Variable<String>(reasonDiscontinued.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (outletCode.present) {
      map['outlet_code'] = Variable<String>(outletCode.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevolveCompanion(')
          ..write('id: $id, ')
          ..write('reasonDiscontinued: $reasonDiscontinued, ')
          ..write('date: $date, ')
          ..write('outletCode: $outletCode, ')
          ..write('patientId: $patientId, ')
          ..write('uuid: $uuid, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $DispenseTable extends Dispense
    with TableInfo<$DispenseTable, DispenseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DispenseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patientId', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateNextRefillMeta =
      const VerificationMeta('dateNextRefill');
  @override
  late final GeneratedColumn<DateTime> dateNextRefill =
      GeneratedColumn<DateTime>('dateNextRefill', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _medicationsMeta =
      const VerificationMeta('medications');
  @override
  late final GeneratedColumnWithTypeConverter<List<Medication>?, String>
      medications = GeneratedColumn<String>('medications', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<Medication>?>(
              $DispenseTable.$convertermedicationsn);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _missedDosesMeta =
      const VerificationMeta('missedDoses');
  @override
  late final GeneratedColumn<bool> missedDoses = GeneratedColumn<bool>(
      'missed_doses', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("missed_doses" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _adverseIssuesMeta =
      const VerificationMeta('adverseIssues');
  @override
  late final GeneratedColumn<bool> adverseIssues = GeneratedColumn<bool>(
      'adverse_issues', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("adverse_issues" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        patientId,
        dateNextRefill,
        medications,
        synced,
        missedDoses,
        adverseIssues,
        uuid
      ];
  @override
  String get aliasedName => _alias ?? 'dispense';
  @override
  String get actualTableName => 'dispense';
  @override
  VerificationContext validateIntegrity(Insertable<DispenseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('patientId')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patientId']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('dateNextRefill')) {
      context.handle(
          _dateNextRefillMeta,
          dateNextRefill.isAcceptableOrUnknown(
              data['dateNextRefill']!, _dateNextRefillMeta));
    } else if (isInserting) {
      context.missing(_dateNextRefillMeta);
    }
    context.handle(_medicationsMeta, const VerificationResult.success());
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('missed_doses')) {
      context.handle(
          _missedDosesMeta,
          missedDoses.isAcceptableOrUnknown(
              data['missed_doses']!, _missedDosesMeta));
    }
    if (data.containsKey('adverse_issues')) {
      context.handle(
          _adverseIssuesMeta,
          adverseIssues.isAcceptableOrUnknown(
              data['adverse_issues']!, _adverseIssuesMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DispenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DispenseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patientId'])!,
      dateNextRefill: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}dateNextRefill'])!,
      medications: $DispenseTable.$convertermedicationsn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}medications'])),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      missedDoses: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}missed_doses'])!,
      adverseIssues: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}adverse_issues'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
    );
  }

  @override
  $DispenseTable createAlias(String alias) {
    return $DispenseTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Medication>, String> $convertermedications =
      ListMedicationConverter();
  static TypeConverter<List<Medication>?, String?> $convertermedicationsn =
      NullAwareTypeConverter.wrap($convertermedications);
}

class DispenseData extends DataClass implements Insertable<DispenseData> {
  final int id;
  final DateTime date;
  final String patientId;
  final DateTime dateNextRefill;
  final List<Medication>? medications;
  final bool synced;
  final bool missedDoses;
  final bool adverseIssues;
  final String uuid;
  const DispenseData(
      {required this.id,
      required this.date,
      required this.patientId,
      required this.dateNextRefill,
      this.medications,
      required this.synced,
      required this.missedDoses,
      required this.adverseIssues,
      required this.uuid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['patientId'] = Variable<String>(patientId);
    map['dateNextRefill'] = Variable<DateTime>(dateNextRefill);
    if (!nullToAbsent || medications != null) {
      final converter = $DispenseTable.$convertermedicationsn;
      map['medications'] = Variable<String>(converter.toSql(medications));
    }
    map['synced'] = Variable<bool>(synced);
    map['missed_doses'] = Variable<bool>(missedDoses);
    map['adverse_issues'] = Variable<bool>(adverseIssues);
    map['uuid'] = Variable<String>(uuid);
    return map;
  }

  DispenseCompanion toCompanion(bool nullToAbsent) {
    return DispenseCompanion(
      id: Value(id),
      date: Value(date),
      patientId: Value(patientId),
      dateNextRefill: Value(dateNextRefill),
      medications: medications == null && nullToAbsent
          ? const Value.absent()
          : Value(medications),
      synced: Value(synced),
      missedDoses: Value(missedDoses),
      adverseIssues: Value(adverseIssues),
      uuid: Value(uuid),
    );
  }

  factory DispenseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DispenseData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      patientId: serializer.fromJson<String>(json['patientId']),
      dateNextRefill: serializer.fromJson<DateTime>(json['dateNextRefill']),
      medications: serializer.fromJson<List<Medication>?>(json['medications']),
      synced: serializer.fromJson<bool>(json['synced']),
      missedDoses: serializer.fromJson<bool>(json['missedDoses']),
      adverseIssues: serializer.fromJson<bool>(json['adverseIssues']),
      uuid: serializer.fromJson<String>(json['uuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'patientId': serializer.toJson<String>(patientId),
      'dateNextRefill': serializer.toJson<DateTime>(dateNextRefill),
      'medications': serializer.toJson<List<Medication>?>(medications),
      'synced': serializer.toJson<bool>(synced),
      'missedDoses': serializer.toJson<bool>(missedDoses),
      'adverseIssues': serializer.toJson<bool>(adverseIssues),
      'uuid': serializer.toJson<String>(uuid),
    };
  }

  DispenseData copyWith(
          {int? id,
          DateTime? date,
          String? patientId,
          DateTime? dateNextRefill,
          Value<List<Medication>?> medications = const Value.absent(),
          bool? synced,
          bool? missedDoses,
          bool? adverseIssues,
          String? uuid}) =>
      DispenseData(
        id: id ?? this.id,
        date: date ?? this.date,
        patientId: patientId ?? this.patientId,
        dateNextRefill: dateNextRefill ?? this.dateNextRefill,
        medications: medications.present ? medications.value : this.medications,
        synced: synced ?? this.synced,
        missedDoses: missedDoses ?? this.missedDoses,
        adverseIssues: adverseIssues ?? this.adverseIssues,
        uuid: uuid ?? this.uuid,
      );
  @override
  String toString() {
    return (StringBuffer('DispenseData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('patientId: $patientId, ')
          ..write('dateNextRefill: $dateNextRefill, ')
          ..write('medications: $medications, ')
          ..write('synced: $synced, ')
          ..write('missedDoses: $missedDoses, ')
          ..write('adverseIssues: $adverseIssues, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, patientId, dateNextRefill,
      medications, synced, missedDoses, adverseIssues, uuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DispenseData &&
          other.id == this.id &&
          other.date == this.date &&
          other.patientId == this.patientId &&
          other.dateNextRefill == this.dateNextRefill &&
          other.medications == this.medications &&
          other.synced == this.synced &&
          other.missedDoses == this.missedDoses &&
          other.adverseIssues == this.adverseIssues &&
          other.uuid == this.uuid);
}

class DispenseCompanion extends UpdateCompanion<DispenseData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> patientId;
  final Value<DateTime> dateNextRefill;
  final Value<List<Medication>?> medications;
  final Value<bool> synced;
  final Value<bool> missedDoses;
  final Value<bool> adverseIssues;
  final Value<String> uuid;
  const DispenseCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.patientId = const Value.absent(),
    this.dateNextRefill = const Value.absent(),
    this.medications = const Value.absent(),
    this.synced = const Value.absent(),
    this.missedDoses = const Value.absent(),
    this.adverseIssues = const Value.absent(),
    this.uuid = const Value.absent(),
  });
  DispenseCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String patientId,
    required DateTime dateNextRefill,
    this.medications = const Value.absent(),
    this.synced = const Value.absent(),
    this.missedDoses = const Value.absent(),
    this.adverseIssues = const Value.absent(),
    required String uuid,
  })  : date = Value(date),
        patientId = Value(patientId),
        dateNextRefill = Value(dateNextRefill),
        uuid = Value(uuid);
  static Insertable<DispenseData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? patientId,
    Expression<DateTime>? dateNextRefill,
    Expression<String>? medications,
    Expression<bool>? synced,
    Expression<bool>? missedDoses,
    Expression<bool>? adverseIssues,
    Expression<String>? uuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (patientId != null) 'patientId': patientId,
      if (dateNextRefill != null) 'dateNextRefill': dateNextRefill,
      if (medications != null) 'medications': medications,
      if (synced != null) 'synced': synced,
      if (missedDoses != null) 'missed_doses': missedDoses,
      if (adverseIssues != null) 'adverse_issues': adverseIssues,
      if (uuid != null) 'uuid': uuid,
    });
  }

  DispenseCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? patientId,
      Value<DateTime>? dateNextRefill,
      Value<List<Medication>?>? medications,
      Value<bool>? synced,
      Value<bool>? missedDoses,
      Value<bool>? adverseIssues,
      Value<String>? uuid}) {
    return DispenseCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      patientId: patientId ?? this.patientId,
      dateNextRefill: dateNextRefill ?? this.dateNextRefill,
      medications: medications ?? this.medications,
      synced: synced ?? this.synced,
      missedDoses: missedDoses ?? this.missedDoses,
      adverseIssues: adverseIssues ?? this.adverseIssues,
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (patientId.present) {
      map['patientId'] = Variable<String>(patientId.value);
    }
    if (dateNextRefill.present) {
      map['dateNextRefill'] = Variable<DateTime>(dateNextRefill.value);
    }
    if (medications.present) {
      final converter = $DispenseTable.$convertermedicationsn;
      map['medications'] = Variable<String>(converter.toSql(medications.value));
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (missedDoses.present) {
      map['missed_doses'] = Variable<bool>(missedDoses.value);
    }
    if (adverseIssues.present) {
      map['adverse_issues'] = Variable<bool>(adverseIssues.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispenseCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('patientId: $patientId, ')
          ..write('dateNextRefill: $dateNextRefill, ')
          ..write('medications: $medications, ')
          ..write('synced: $synced, ')
          ..write('missedDoses: $missedDoses, ')
          ..write('adverseIssues: $adverseIssues, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }
}

class $FacilityTable extends Facility
    with TableInfo<$FacilityTable, FacilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FacilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, code];
  @override
  String get aliasedName => _alias ?? 'facility';
  @override
  String get actualTableName => 'facility';
  @override
  VerificationContext validateIntegrity(Insertable<FacilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FacilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FacilityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
    );
  }

  @override
  $FacilityTable createAlias(String alias) {
    return $FacilityTable(attachedDatabase, alias);
  }
}

class FacilityData extends DataClass implements Insertable<FacilityData> {
  final int id;
  final String name;
  final String code;
  const FacilityData(
      {required this.id, required this.name, required this.code});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    return map;
  }

  FacilityCompanion toCompanion(bool nullToAbsent) {
    return FacilityCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
    );
  }

  factory FacilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FacilityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
    };
  }

  FacilityData copyWith({int? id, String? name, String? code}) => FacilityData(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );
  @override
  String toString() {
    return (StringBuffer('FacilityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FacilityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code);
}

class FacilityCompanion extends UpdateCompanion<FacilityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  const FacilityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
  });
  FacilityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
  })  : name = Value(name),
        code = Value(code);
  static Insertable<FacilityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
    });
  }

  FacilityCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? code}) {
    return FacilityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FacilityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }
}

class $OutletTable extends Outlet with TableInfo<$OutletTable, OutletData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutletTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, code];
  @override
  String get aliasedName => _alias ?? 'outlet';
  @override
  String get actualTableName => 'outlet';
  @override
  VerificationContext validateIntegrity(Insertable<OutletData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutletData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutletData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
    );
  }

  @override
  $OutletTable createAlias(String alias) {
    return $OutletTable(attachedDatabase, alias);
  }
}

class OutletData extends DataClass implements Insertable<OutletData> {
  final int id;
  final String name;
  final String code;
  const OutletData({required this.id, required this.name, required this.code});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    return map;
  }

  OutletCompanion toCompanion(bool nullToAbsent) {
    return OutletCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
    );
  }

  factory OutletData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutletData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
    };
  }

  OutletData copyWith({int? id, String? name, String? code}) => OutletData(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );
  @override
  String toString() {
    return (StringBuffer('OutletData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutletData &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code);
}

class OutletCompanion extends UpdateCompanion<OutletData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  const OutletCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
  });
  OutletCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
  })  : name = Value(name),
        code = Value(code);
  static Insertable<OutletData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
    });
  }

  OutletCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? code}) {
    return OutletCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutletCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }
}

class $PatientTable extends Patient with TableInfo<$PatientTable, PatientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _givenNameMeta =
      const VerificationMeta('givenName');
  @override
  late final GeneratedColumn<String> givenName = GeneratedColumn<String>(
      'given_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _familyNameMeta =
      const VerificationMeta('familyName');
  @override
  late final GeneratedColumn<String> familyName = GeneratedColumn<String>(
      'family_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hospitalNoMeta =
      const VerificationMeta('hospitalNo');
  @override
  late final GeneratedColumn<String> hospitalNo = GeneratedColumn<String>(
      'hospitalNo', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _uniqueIdMeta =
      const VerificationMeta('uniqueId');
  @override
  late final GeneratedColumn<String> uniqueId = GeneratedColumn<String>(
      'unique_id', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'dateOfBirth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _facilityMeta =
      const VerificationMeta('facility');
  @override
  late final GeneratedColumn<String> facility = GeneratedColumn<String>(
      'facility', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _outletCodeMeta =
      const VerificationMeta('outletCode');
  @override
  late final GeneratedColumn<String> outletCode = GeneratedColumn<String>(
      'outletCode', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _facilityCodeMeta =
      const VerificationMeta('facilityCode');
  @override
  late final GeneratedColumn<String> facilityCode = GeneratedColumn<String>(
      'facilityCode', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _lastClinicVisitMeta =
      const VerificationMeta('lastClinicVisit');
  @override
  late final GeneratedColumn<DateTime> lastClinicVisit =
      GeneratedColumn<DateTime>('last_clinic_visit', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastRefillDateMeta =
      const VerificationMeta('lastRefillDate');
  @override
  late final GeneratedColumn<DateTime> lastRefillDate =
      GeneratedColumn<DateTime>('last_refill_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextAppointmentDateMeta =
      const VerificationMeta('nextAppointmentDate');
  @override
  late final GeneratedColumn<DateTime> nextAppointmentDate =
      GeneratedColumn<DateTime>('next_appointment_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextVisitDateMeta =
      const VerificationMeta('nextVisitDate');
  @override
  late final GeneratedColumn<DateTime> nextVisitDate =
      GeneratedColumn<DateTime>('next_visit_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dateStartedMeta =
      const VerificationMeta('dateStarted');
  @override
  late final GeneratedColumn<DateTime> dateStarted = GeneratedColumn<DateTime>(
      'date_started', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _viralLoadDateMeta =
      const VerificationMeta('viralLoadDate');
  @override
  late final GeneratedColumn<DateTime> viralLoadDate =
      GeneratedColumn<DateTime>('viral_load_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _lastClinicStageMeta =
      const VerificationMeta('lastClinicStage');
  @override
  late final GeneratedColumn<String> lastClinicStage = GeneratedColumn<String>(
      'last_clinic_stage', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _lastViralLoadMeta =
      const VerificationMeta('lastViralLoad');
  @override
  late final GeneratedColumn<String> lastViralLoad = GeneratedColumn<String>(
      'last_viral_load', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _targetGroupMeta =
      const VerificationMeta('targetGroup');
  @override
  late final GeneratedColumn<String> targetGroup = GeneratedColumn<String>(
      'target_group', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        givenName,
        familyName,
        hospitalNo,
        uniqueId,
        dateOfBirth,
        sex,
        phone,
        facility,
        outletCode,
        facilityCode,
        address,
        lastClinicVisit,
        lastRefillDate,
        nextAppointmentDate,
        nextVisitDate,
        dateStarted,
        uuid,
        viralLoadDate,
        synced,
        lastClinicStage,
        lastViralLoad,
        deleted,
        targetGroup
      ];
  @override
  String get aliasedName => _alias ?? 'patient';
  @override
  String get actualTableName => 'patient';
  @override
  VerificationContext validateIntegrity(Insertable<PatientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('given_name')) {
      context.handle(_givenNameMeta,
          givenName.isAcceptableOrUnknown(data['given_name']!, _givenNameMeta));
    } else if (isInserting) {
      context.missing(_givenNameMeta);
    }
    if (data.containsKey('family_name')) {
      context.handle(
          _familyNameMeta,
          familyName.isAcceptableOrUnknown(
              data['family_name']!, _familyNameMeta));
    } else if (isInserting) {
      context.missing(_familyNameMeta);
    }
    if (data.containsKey('hospitalNo')) {
      context.handle(
          _hospitalNoMeta,
          hospitalNo.isAcceptableOrUnknown(
              data['hospitalNo']!, _hospitalNoMeta));
    } else if (isInserting) {
      context.missing(_hospitalNoMeta);
    }
    if (data.containsKey('unique_id')) {
      context.handle(_uniqueIdMeta,
          uniqueId.isAcceptableOrUnknown(data['unique_id']!, _uniqueIdMeta));
    }
    if (data.containsKey('dateOfBirth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['dateOfBirth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('facility')) {
      context.handle(_facilityMeta,
          facility.isAcceptableOrUnknown(data['facility']!, _facilityMeta));
    } else if (isInserting) {
      context.missing(_facilityMeta);
    }
    if (data.containsKey('outletCode')) {
      context.handle(
          _outletCodeMeta,
          outletCode.isAcceptableOrUnknown(
              data['outletCode']!, _outletCodeMeta));
    }
    if (data.containsKey('facilityCode')) {
      context.handle(
          _facilityCodeMeta,
          facilityCode.isAcceptableOrUnknown(
              data['facilityCode']!, _facilityCodeMeta));
    } else if (isInserting) {
      context.missing(_facilityCodeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('last_clinic_visit')) {
      context.handle(
          _lastClinicVisitMeta,
          lastClinicVisit.isAcceptableOrUnknown(
              data['last_clinic_visit']!, _lastClinicVisitMeta));
    }
    if (data.containsKey('last_refill_date')) {
      context.handle(
          _lastRefillDateMeta,
          lastRefillDate.isAcceptableOrUnknown(
              data['last_refill_date']!, _lastRefillDateMeta));
    }
    if (data.containsKey('next_appointment_date')) {
      context.handle(
          _nextAppointmentDateMeta,
          nextAppointmentDate.isAcceptableOrUnknown(
              data['next_appointment_date']!, _nextAppointmentDateMeta));
    }
    if (data.containsKey('next_visit_date')) {
      context.handle(
          _nextVisitDateMeta,
          nextVisitDate.isAcceptableOrUnknown(
              data['next_visit_date']!, _nextVisitDateMeta));
    }
    if (data.containsKey('date_started')) {
      context.handle(
          _dateStartedMeta,
          dateStarted.isAcceptableOrUnknown(
              data['date_started']!, _dateStartedMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('viral_load_date')) {
      context.handle(
          _viralLoadDateMeta,
          viralLoadDate.isAcceptableOrUnknown(
              data['viral_load_date']!, _viralLoadDateMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('last_clinic_stage')) {
      context.handle(
          _lastClinicStageMeta,
          lastClinicStage.isAcceptableOrUnknown(
              data['last_clinic_stage']!, _lastClinicStageMeta));
    }
    if (data.containsKey('last_viral_load')) {
      context.handle(
          _lastViralLoadMeta,
          lastViralLoad.isAcceptableOrUnknown(
              data['last_viral_load']!, _lastViralLoadMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('target_group')) {
      context.handle(
          _targetGroupMeta,
          targetGroup.isAcceptableOrUnknown(
              data['target_group']!, _targetGroupMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      givenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}given_name'])!,
      familyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_name'])!,
      hospitalNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hospitalNo'])!,
      uniqueId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unique_id']),
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dateOfBirth'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      facility: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}facility'])!,
      outletCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}outletCode']),
      facilityCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}facilityCode'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      lastClinicVisit: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_clinic_visit']),
      lastRefillDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_refill_date']),
      nextAppointmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}next_appointment_date']),
      nextVisitDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_visit_date']),
      dateStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_started']),
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      viralLoadDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}viral_load_date']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      lastClinicStage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_clinic_stage']),
      lastViralLoad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_viral_load']),
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      targetGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_group']),
    );
  }

  @override
  $PatientTable createAlias(String alias) {
    return $PatientTable(attachedDatabase, alias);
  }
}

class PatientData extends DataClass implements Insertable<PatientData> {
  final int id;
  final String givenName;
  final String familyName;
  final String hospitalNo;
  final String? uniqueId;
  final DateTime dateOfBirth;
  final String sex;
  final String? phone;
  final String facility;
  final String? outletCode;
  final String facilityCode;
  final String? address;
  final DateTime? lastClinicVisit;
  final DateTime? lastRefillDate;
  final DateTime? nextAppointmentDate;
  final DateTime? nextVisitDate;
  final DateTime? dateStarted;
  final String uuid;
  final DateTime? viralLoadDate;
  final bool synced;
  final String? lastClinicStage;
  final String? lastViralLoad;
  final bool deleted;
  final String? targetGroup;
  const PatientData(
      {required this.id,
      required this.givenName,
      required this.familyName,
      required this.hospitalNo,
      this.uniqueId,
      required this.dateOfBirth,
      required this.sex,
      this.phone,
      required this.facility,
      this.outletCode,
      required this.facilityCode,
      this.address,
      this.lastClinicVisit,
      this.lastRefillDate,
      this.nextAppointmentDate,
      this.nextVisitDate,
      this.dateStarted,
      required this.uuid,
      this.viralLoadDate,
      required this.synced,
      this.lastClinicStage,
      this.lastViralLoad,
      required this.deleted,
      this.targetGroup});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['given_name'] = Variable<String>(givenName);
    map['family_name'] = Variable<String>(familyName);
    map['hospitalNo'] = Variable<String>(hospitalNo);
    if (!nullToAbsent || uniqueId != null) {
      map['unique_id'] = Variable<String>(uniqueId);
    }
    map['dateOfBirth'] = Variable<DateTime>(dateOfBirth);
    map['sex'] = Variable<String>(sex);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['facility'] = Variable<String>(facility);
    if (!nullToAbsent || outletCode != null) {
      map['outletCode'] = Variable<String>(outletCode);
    }
    map['facilityCode'] = Variable<String>(facilityCode);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || lastClinicVisit != null) {
      map['last_clinic_visit'] = Variable<DateTime>(lastClinicVisit);
    }
    if (!nullToAbsent || lastRefillDate != null) {
      map['last_refill_date'] = Variable<DateTime>(lastRefillDate);
    }
    if (!nullToAbsent || nextAppointmentDate != null) {
      map['next_appointment_date'] = Variable<DateTime>(nextAppointmentDate);
    }
    if (!nullToAbsent || nextVisitDate != null) {
      map['next_visit_date'] = Variable<DateTime>(nextVisitDate);
    }
    if (!nullToAbsent || dateStarted != null) {
      map['date_started'] = Variable<DateTime>(dateStarted);
    }
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || viralLoadDate != null) {
      map['viral_load_date'] = Variable<DateTime>(viralLoadDate);
    }
    map['synced'] = Variable<bool>(synced);
    if (!nullToAbsent || lastClinicStage != null) {
      map['last_clinic_stage'] = Variable<String>(lastClinicStage);
    }
    if (!nullToAbsent || lastViralLoad != null) {
      map['last_viral_load'] = Variable<String>(lastViralLoad);
    }
    map['deleted'] = Variable<bool>(deleted);
    if (!nullToAbsent || targetGroup != null) {
      map['target_group'] = Variable<String>(targetGroup);
    }
    return map;
  }

  PatientCompanion toCompanion(bool nullToAbsent) {
    return PatientCompanion(
      id: Value(id),
      givenName: Value(givenName),
      familyName: Value(familyName),
      hospitalNo: Value(hospitalNo),
      uniqueId: uniqueId == null && nullToAbsent
          ? const Value.absent()
          : Value(uniqueId),
      dateOfBirth: Value(dateOfBirth),
      sex: Value(sex),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      facility: Value(facility),
      outletCode: outletCode == null && nullToAbsent
          ? const Value.absent()
          : Value(outletCode),
      facilityCode: Value(facilityCode),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      lastClinicVisit: lastClinicVisit == null && nullToAbsent
          ? const Value.absent()
          : Value(lastClinicVisit),
      lastRefillDate: lastRefillDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRefillDate),
      nextAppointmentDate: nextAppointmentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAppointmentDate),
      nextVisitDate: nextVisitDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextVisitDate),
      dateStarted: dateStarted == null && nullToAbsent
          ? const Value.absent()
          : Value(dateStarted),
      uuid: Value(uuid),
      viralLoadDate: viralLoadDate == null && nullToAbsent
          ? const Value.absent()
          : Value(viralLoadDate),
      synced: Value(synced),
      lastClinicStage: lastClinicStage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastClinicStage),
      lastViralLoad: lastViralLoad == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViralLoad),
      deleted: Value(deleted),
      targetGroup: targetGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(targetGroup),
    );
  }

  factory PatientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientData(
      id: serializer.fromJson<int>(json['id']),
      givenName: serializer.fromJson<String>(json['givenName']),
      familyName: serializer.fromJson<String>(json['familyName']),
      hospitalNo: serializer.fromJson<String>(json['hospitalNo']),
      uniqueId: serializer.fromJson<String?>(json['uniqueId']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      sex: serializer.fromJson<String>(json['sex']),
      phone: serializer.fromJson<String?>(json['phone']),
      facility: serializer.fromJson<String>(json['facility']),
      outletCode: serializer.fromJson<String?>(json['outletCode']),
      facilityCode: serializer.fromJson<String>(json['facilityCode']),
      address: serializer.fromJson<String?>(json['address']),
      lastClinicVisit: serializer.fromJson<DateTime?>(json['lastClinicVisit']),
      lastRefillDate: serializer.fromJson<DateTime?>(json['lastRefillDate']),
      nextAppointmentDate:
          serializer.fromJson<DateTime?>(json['nextAppointmentDate']),
      nextVisitDate: serializer.fromJson<DateTime?>(json['nextVisitDate']),
      dateStarted: serializer.fromJson<DateTime?>(json['dateStarted']),
      uuid: serializer.fromJson<String>(json['uuid']),
      viralLoadDate: serializer.fromJson<DateTime?>(json['viralLoadDate']),
      synced: serializer.fromJson<bool>(json['synced']),
      lastClinicStage: serializer.fromJson<String?>(json['lastClinicStage']),
      lastViralLoad: serializer.fromJson<String?>(json['lastViralLoad']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      targetGroup: serializer.fromJson<String?>(json['targetGroup']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'givenName': serializer.toJson<String>(givenName),
      'familyName': serializer.toJson<String>(familyName),
      'hospitalNo': serializer.toJson<String>(hospitalNo),
      'uniqueId': serializer.toJson<String?>(uniqueId),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'sex': serializer.toJson<String>(sex),
      'phone': serializer.toJson<String?>(phone),
      'facility': serializer.toJson<String>(facility),
      'outletCode': serializer.toJson<String?>(outletCode),
      'facilityCode': serializer.toJson<String>(facilityCode),
      'address': serializer.toJson<String?>(address),
      'lastClinicVisit': serializer.toJson<DateTime?>(lastClinicVisit),
      'lastRefillDate': serializer.toJson<DateTime?>(lastRefillDate),
      'nextAppointmentDate': serializer.toJson<DateTime?>(nextAppointmentDate),
      'nextVisitDate': serializer.toJson<DateTime?>(nextVisitDate),
      'dateStarted': serializer.toJson<DateTime?>(dateStarted),
      'uuid': serializer.toJson<String>(uuid),
      'viralLoadDate': serializer.toJson<DateTime?>(viralLoadDate),
      'synced': serializer.toJson<bool>(synced),
      'lastClinicStage': serializer.toJson<String?>(lastClinicStage),
      'lastViralLoad': serializer.toJson<String?>(lastViralLoad),
      'deleted': serializer.toJson<bool>(deleted),
      'targetGroup': serializer.toJson<String?>(targetGroup),
    };
  }

  PatientData copyWith(
          {int? id,
          String? givenName,
          String? familyName,
          String? hospitalNo,
          Value<String?> uniqueId = const Value.absent(),
          DateTime? dateOfBirth,
          String? sex,
          Value<String?> phone = const Value.absent(),
          String? facility,
          Value<String?> outletCode = const Value.absent(),
          String? facilityCode,
          Value<String?> address = const Value.absent(),
          Value<DateTime?> lastClinicVisit = const Value.absent(),
          Value<DateTime?> lastRefillDate = const Value.absent(),
          Value<DateTime?> nextAppointmentDate = const Value.absent(),
          Value<DateTime?> nextVisitDate = const Value.absent(),
          Value<DateTime?> dateStarted = const Value.absent(),
          String? uuid,
          Value<DateTime?> viralLoadDate = const Value.absent(),
          bool? synced,
          Value<String?> lastClinicStage = const Value.absent(),
          Value<String?> lastViralLoad = const Value.absent(),
          bool? deleted,
          Value<String?> targetGroup = const Value.absent()}) =>
      PatientData(
        id: id ?? this.id,
        givenName: givenName ?? this.givenName,
        familyName: familyName ?? this.familyName,
        hospitalNo: hospitalNo ?? this.hospitalNo,
        uniqueId: uniqueId.present ? uniqueId.value : this.uniqueId,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        sex: sex ?? this.sex,
        phone: phone.present ? phone.value : this.phone,
        facility: facility ?? this.facility,
        outletCode: outletCode.present ? outletCode.value : this.outletCode,
        facilityCode: facilityCode ?? this.facilityCode,
        address: address.present ? address.value : this.address,
        lastClinicVisit: lastClinicVisit.present
            ? lastClinicVisit.value
            : this.lastClinicVisit,
        lastRefillDate:
            lastRefillDate.present ? lastRefillDate.value : this.lastRefillDate,
        nextAppointmentDate: nextAppointmentDate.present
            ? nextAppointmentDate.value
            : this.nextAppointmentDate,
        nextVisitDate:
            nextVisitDate.present ? nextVisitDate.value : this.nextVisitDate,
        dateStarted: dateStarted.present ? dateStarted.value : this.dateStarted,
        uuid: uuid ?? this.uuid,
        viralLoadDate:
            viralLoadDate.present ? viralLoadDate.value : this.viralLoadDate,
        synced: synced ?? this.synced,
        lastClinicStage: lastClinicStage.present
            ? lastClinicStage.value
            : this.lastClinicStage,
        lastViralLoad:
            lastViralLoad.present ? lastViralLoad.value : this.lastViralLoad,
        deleted: deleted ?? this.deleted,
        targetGroup: targetGroup.present ? targetGroup.value : this.targetGroup,
      );
  @override
  String toString() {
    return (StringBuffer('PatientData(')
          ..write('id: $id, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('hospitalNo: $hospitalNo, ')
          ..write('uniqueId: $uniqueId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('phone: $phone, ')
          ..write('facility: $facility, ')
          ..write('outletCode: $outletCode, ')
          ..write('facilityCode: $facilityCode, ')
          ..write('address: $address, ')
          ..write('lastClinicVisit: $lastClinicVisit, ')
          ..write('lastRefillDate: $lastRefillDate, ')
          ..write('nextAppointmentDate: $nextAppointmentDate, ')
          ..write('nextVisitDate: $nextVisitDate, ')
          ..write('dateStarted: $dateStarted, ')
          ..write('uuid: $uuid, ')
          ..write('viralLoadDate: $viralLoadDate, ')
          ..write('synced: $synced, ')
          ..write('lastClinicStage: $lastClinicStage, ')
          ..write('lastViralLoad: $lastViralLoad, ')
          ..write('deleted: $deleted, ')
          ..write('targetGroup: $targetGroup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        givenName,
        familyName,
        hospitalNo,
        uniqueId,
        dateOfBirth,
        sex,
        phone,
        facility,
        outletCode,
        facilityCode,
        address,
        lastClinicVisit,
        lastRefillDate,
        nextAppointmentDate,
        nextVisitDate,
        dateStarted,
        uuid,
        viralLoadDate,
        synced,
        lastClinicStage,
        lastViralLoad,
        deleted,
        targetGroup
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientData &&
          other.id == this.id &&
          other.givenName == this.givenName &&
          other.familyName == this.familyName &&
          other.hospitalNo == this.hospitalNo &&
          other.uniqueId == this.uniqueId &&
          other.dateOfBirth == this.dateOfBirth &&
          other.sex == this.sex &&
          other.phone == this.phone &&
          other.facility == this.facility &&
          other.outletCode == this.outletCode &&
          other.facilityCode == this.facilityCode &&
          other.address == this.address &&
          other.lastClinicVisit == this.lastClinicVisit &&
          other.lastRefillDate == this.lastRefillDate &&
          other.nextAppointmentDate == this.nextAppointmentDate &&
          other.nextVisitDate == this.nextVisitDate &&
          other.dateStarted == this.dateStarted &&
          other.uuid == this.uuid &&
          other.viralLoadDate == this.viralLoadDate &&
          other.synced == this.synced &&
          other.lastClinicStage == this.lastClinicStage &&
          other.lastViralLoad == this.lastViralLoad &&
          other.deleted == this.deleted &&
          other.targetGroup == this.targetGroup);
}

class PatientCompanion extends UpdateCompanion<PatientData> {
  final Value<int> id;
  final Value<String> givenName;
  final Value<String> familyName;
  final Value<String> hospitalNo;
  final Value<String?> uniqueId;
  final Value<DateTime> dateOfBirth;
  final Value<String> sex;
  final Value<String?> phone;
  final Value<String> facility;
  final Value<String?> outletCode;
  final Value<String> facilityCode;
  final Value<String?> address;
  final Value<DateTime?> lastClinicVisit;
  final Value<DateTime?> lastRefillDate;
  final Value<DateTime?> nextAppointmentDate;
  final Value<DateTime?> nextVisitDate;
  final Value<DateTime?> dateStarted;
  final Value<String> uuid;
  final Value<DateTime?> viralLoadDate;
  final Value<bool> synced;
  final Value<String?> lastClinicStage;
  final Value<String?> lastViralLoad;
  final Value<bool> deleted;
  final Value<String?> targetGroup;
  const PatientCompanion({
    this.id = const Value.absent(),
    this.givenName = const Value.absent(),
    this.familyName = const Value.absent(),
    this.hospitalNo = const Value.absent(),
    this.uniqueId = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.sex = const Value.absent(),
    this.phone = const Value.absent(),
    this.facility = const Value.absent(),
    this.outletCode = const Value.absent(),
    this.facilityCode = const Value.absent(),
    this.address = const Value.absent(),
    this.lastClinicVisit = const Value.absent(),
    this.lastRefillDate = const Value.absent(),
    this.nextAppointmentDate = const Value.absent(),
    this.nextVisitDate = const Value.absent(),
    this.dateStarted = const Value.absent(),
    this.uuid = const Value.absent(),
    this.viralLoadDate = const Value.absent(),
    this.synced = const Value.absent(),
    this.lastClinicStage = const Value.absent(),
    this.lastViralLoad = const Value.absent(),
    this.deleted = const Value.absent(),
    this.targetGroup = const Value.absent(),
  });
  PatientCompanion.insert({
    this.id = const Value.absent(),
    required String givenName,
    required String familyName,
    required String hospitalNo,
    this.uniqueId = const Value.absent(),
    required DateTime dateOfBirth,
    required String sex,
    this.phone = const Value.absent(),
    required String facility,
    this.outletCode = const Value.absent(),
    required String facilityCode,
    this.address = const Value.absent(),
    this.lastClinicVisit = const Value.absent(),
    this.lastRefillDate = const Value.absent(),
    this.nextAppointmentDate = const Value.absent(),
    this.nextVisitDate = const Value.absent(),
    this.dateStarted = const Value.absent(),
    required String uuid,
    this.viralLoadDate = const Value.absent(),
    this.synced = const Value.absent(),
    this.lastClinicStage = const Value.absent(),
    this.lastViralLoad = const Value.absent(),
    this.deleted = const Value.absent(),
    this.targetGroup = const Value.absent(),
  })  : givenName = Value(givenName),
        familyName = Value(familyName),
        hospitalNo = Value(hospitalNo),
        dateOfBirth = Value(dateOfBirth),
        sex = Value(sex),
        facility = Value(facility),
        facilityCode = Value(facilityCode),
        uuid = Value(uuid);
  static Insertable<PatientData> custom({
    Expression<int>? id,
    Expression<String>? givenName,
    Expression<String>? familyName,
    Expression<String>? hospitalNo,
    Expression<String>? uniqueId,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? sex,
    Expression<String>? phone,
    Expression<String>? facility,
    Expression<String>? outletCode,
    Expression<String>? facilityCode,
    Expression<String>? address,
    Expression<DateTime>? lastClinicVisit,
    Expression<DateTime>? lastRefillDate,
    Expression<DateTime>? nextAppointmentDate,
    Expression<DateTime>? nextVisitDate,
    Expression<DateTime>? dateStarted,
    Expression<String>? uuid,
    Expression<DateTime>? viralLoadDate,
    Expression<bool>? synced,
    Expression<String>? lastClinicStage,
    Expression<String>? lastViralLoad,
    Expression<bool>? deleted,
    Expression<String>? targetGroup,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (givenName != null) 'given_name': givenName,
      if (familyName != null) 'family_name': familyName,
      if (hospitalNo != null) 'hospitalNo': hospitalNo,
      if (uniqueId != null) 'unique_id': uniqueId,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      if (sex != null) 'sex': sex,
      if (phone != null) 'phone': phone,
      if (facility != null) 'facility': facility,
      if (outletCode != null) 'outletCode': outletCode,
      if (facilityCode != null) 'facilityCode': facilityCode,
      if (address != null) 'address': address,
      if (lastClinicVisit != null) 'last_clinic_visit': lastClinicVisit,
      if (lastRefillDate != null) 'last_refill_date': lastRefillDate,
      if (nextAppointmentDate != null)
        'next_appointment_date': nextAppointmentDate,
      if (nextVisitDate != null) 'next_visit_date': nextVisitDate,
      if (dateStarted != null) 'date_started': dateStarted,
      if (uuid != null) 'uuid': uuid,
      if (viralLoadDate != null) 'viral_load_date': viralLoadDate,
      if (synced != null) 'synced': synced,
      if (lastClinicStage != null) 'last_clinic_stage': lastClinicStage,
      if (lastViralLoad != null) 'last_viral_load': lastViralLoad,
      if (deleted != null) 'deleted': deleted,
      if (targetGroup != null) 'target_group': targetGroup,
    });
  }

  PatientCompanion copyWith(
      {Value<int>? id,
      Value<String>? givenName,
      Value<String>? familyName,
      Value<String>? hospitalNo,
      Value<String?>? uniqueId,
      Value<DateTime>? dateOfBirth,
      Value<String>? sex,
      Value<String?>? phone,
      Value<String>? facility,
      Value<String?>? outletCode,
      Value<String>? facilityCode,
      Value<String?>? address,
      Value<DateTime?>? lastClinicVisit,
      Value<DateTime?>? lastRefillDate,
      Value<DateTime?>? nextAppointmentDate,
      Value<DateTime?>? nextVisitDate,
      Value<DateTime?>? dateStarted,
      Value<String>? uuid,
      Value<DateTime?>? viralLoadDate,
      Value<bool>? synced,
      Value<String?>? lastClinicStage,
      Value<String?>? lastViralLoad,
      Value<bool>? deleted,
      Value<String?>? targetGroup}) {
    return PatientCompanion(
      id: id ?? this.id,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      hospitalNo: hospitalNo ?? this.hospitalNo,
      uniqueId: uniqueId ?? this.uniqueId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      sex: sex ?? this.sex,
      phone: phone ?? this.phone,
      facility: facility ?? this.facility,
      outletCode: outletCode ?? this.outletCode,
      facilityCode: facilityCode ?? this.facilityCode,
      address: address ?? this.address,
      lastClinicVisit: lastClinicVisit ?? this.lastClinicVisit,
      lastRefillDate: lastRefillDate ?? this.lastRefillDate,
      nextAppointmentDate: nextAppointmentDate ?? this.nextAppointmentDate,
      nextVisitDate: nextVisitDate ?? this.nextVisitDate,
      dateStarted: dateStarted ?? this.dateStarted,
      uuid: uuid ?? this.uuid,
      viralLoadDate: viralLoadDate ?? this.viralLoadDate,
      synced: synced ?? this.synced,
      lastClinicStage: lastClinicStage ?? this.lastClinicStage,
      lastViralLoad: lastViralLoad ?? this.lastViralLoad,
      deleted: deleted ?? this.deleted,
      targetGroup: targetGroup ?? this.targetGroup,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (givenName.present) {
      map['given_name'] = Variable<String>(givenName.value);
    }
    if (familyName.present) {
      map['family_name'] = Variable<String>(familyName.value);
    }
    if (hospitalNo.present) {
      map['hospitalNo'] = Variable<String>(hospitalNo.value);
    }
    if (uniqueId.present) {
      map['unique_id'] = Variable<String>(uniqueId.value);
    }
    if (dateOfBirth.present) {
      map['dateOfBirth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (facility.present) {
      map['facility'] = Variable<String>(facility.value);
    }
    if (outletCode.present) {
      map['outletCode'] = Variable<String>(outletCode.value);
    }
    if (facilityCode.present) {
      map['facilityCode'] = Variable<String>(facilityCode.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lastClinicVisit.present) {
      map['last_clinic_visit'] = Variable<DateTime>(lastClinicVisit.value);
    }
    if (lastRefillDate.present) {
      map['last_refill_date'] = Variable<DateTime>(lastRefillDate.value);
    }
    if (nextAppointmentDate.present) {
      map['next_appointment_date'] =
          Variable<DateTime>(nextAppointmentDate.value);
    }
    if (nextVisitDate.present) {
      map['next_visit_date'] = Variable<DateTime>(nextVisitDate.value);
    }
    if (dateStarted.present) {
      map['date_started'] = Variable<DateTime>(dateStarted.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (viralLoadDate.present) {
      map['viral_load_date'] = Variable<DateTime>(viralLoadDate.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (lastClinicStage.present) {
      map['last_clinic_stage'] = Variable<String>(lastClinicStage.value);
    }
    if (lastViralLoad.present) {
      map['last_viral_load'] = Variable<String>(lastViralLoad.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (targetGroup.present) {
      map['target_group'] = Variable<String>(targetGroup.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientCompanion(')
          ..write('id: $id, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('hospitalNo: $hospitalNo, ')
          ..write('uniqueId: $uniqueId, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('phone: $phone, ')
          ..write('facility: $facility, ')
          ..write('outletCode: $outletCode, ')
          ..write('facilityCode: $facilityCode, ')
          ..write('address: $address, ')
          ..write('lastClinicVisit: $lastClinicVisit, ')
          ..write('lastRefillDate: $lastRefillDate, ')
          ..write('nextAppointmentDate: $nextAppointmentDate, ')
          ..write('nextVisitDate: $nextVisitDate, ')
          ..write('dateStarted: $dateStarted, ')
          ..write('uuid: $uuid, ')
          ..write('viralLoadDate: $viralLoadDate, ')
          ..write('synced: $synced, ')
          ..write('lastClinicStage: $lastClinicStage, ')
          ..write('lastViralLoad: $lastViralLoad, ')
          ..write('deleted: $deleted, ')
          ..write('targetGroup: $targetGroup')
          ..write(')'))
        .toString();
  }
}

class $RegimenTable extends Regimen with TableInfo<$RegimenTable, RegimenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegimenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _regimenTypeMeta =
      const VerificationMeta('regimenType');
  @override
  late final GeneratedColumn<String> regimenType = GeneratedColumn<String>(
      'regimen_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _arvMeta = const VerificationMeta('arv');
  @override
  late final GeneratedColumn<bool> arv = GeneratedColumn<bool>(
      'arv', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("arv" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, name, regimenType, arv];
  @override
  String get aliasedName => _alias ?? 'regimen';
  @override
  String get actualTableName => 'regimen';
  @override
  VerificationContext validateIntegrity(Insertable<RegimenData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('regimen_type')) {
      context.handle(
          _regimenTypeMeta,
          regimenType.isAcceptableOrUnknown(
              data['regimen_type']!, _regimenTypeMeta));
    } else if (isInserting) {
      context.missing(_regimenTypeMeta);
    }
    if (data.containsKey('arv')) {
      context.handle(
          _arvMeta, arv.isAcceptableOrUnknown(data['arv']!, _arvMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegimenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegimenData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      regimenType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}regimen_type'])!,
      arv: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}arv'])!,
    );
  }

  @override
  $RegimenTable createAlias(String alias) {
    return $RegimenTable(attachedDatabase, alias);
  }
}

class RegimenData extends DataClass implements Insertable<RegimenData> {
  final int id;
  final String name;
  final String regimenType;
  final bool arv;
  const RegimenData(
      {required this.id,
      required this.name,
      required this.regimenType,
      required this.arv});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['regimen_type'] = Variable<String>(regimenType);
    map['arv'] = Variable<bool>(arv);
    return map;
  }

  RegimenCompanion toCompanion(bool nullToAbsent) {
    return RegimenCompanion(
      id: Value(id),
      name: Value(name),
      regimenType: Value(regimenType),
      arv: Value(arv),
    );
  }

  factory RegimenData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegimenData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      regimenType: serializer.fromJson<String>(json['regimenType']),
      arv: serializer.fromJson<bool>(json['arv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'regimenType': serializer.toJson<String>(regimenType),
      'arv': serializer.toJson<bool>(arv),
    };
  }

  RegimenData copyWith(
          {int? id, String? name, String? regimenType, bool? arv}) =>
      RegimenData(
        id: id ?? this.id,
        name: name ?? this.name,
        regimenType: regimenType ?? this.regimenType,
        arv: arv ?? this.arv,
      );
  @override
  String toString() {
    return (StringBuffer('RegimenData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('regimenType: $regimenType, ')
          ..write('arv: $arv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, regimenType, arv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegimenData &&
          other.id == this.id &&
          other.name == this.name &&
          other.regimenType == this.regimenType &&
          other.arv == this.arv);
}

class RegimenCompanion extends UpdateCompanion<RegimenData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> regimenType;
  final Value<bool> arv;
  const RegimenCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.regimenType = const Value.absent(),
    this.arv = const Value.absent(),
  });
  RegimenCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String regimenType,
    this.arv = const Value.absent(),
  })  : name = Value(name),
        regimenType = Value(regimenType);
  static Insertable<RegimenData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? regimenType,
    Expression<bool>? arv,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (regimenType != null) 'regimen_type': regimenType,
      if (arv != null) 'arv': arv,
    });
  }

  RegimenCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? regimenType,
      Value<bool>? arv}) {
    return RegimenCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      regimenType: regimenType ?? this.regimenType,
      arv: arv ?? this.arv,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (regimenType.present) {
      map['regimen_type'] = Variable<String>(regimenType.value);
    }
    if (arv.present) {
      map['arv'] = Variable<bool>(arv.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegimenCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('regimenType: $regimenType, ')
          ..write('arv: $arv')
          ..write(')'))
        .toString();
  }
}

class $ViralLoadTable extends ViralLoad
    with TableInfo<$ViralLoadTable, ViralLoadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViralLoadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nextAppointmentMeta =
      const VerificationMeta('nextAppointment');
  @override
  late final GeneratedColumn<DateTime> nextAppointment =
      GeneratedColumn<DateTime>('next_appointment', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 37),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, value, nextAppointment, patientId, uuid, type, synced];
  @override
  String get aliasedName => _alias ?? 'viral_load';
  @override
  String get actualTableName => 'viral_load';
  @override
  VerificationContext validateIntegrity(Insertable<ViralLoadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('next_appointment')) {
      context.handle(
          _nextAppointmentMeta,
          nextAppointment.isAcceptableOrUnknown(
              data['next_appointment']!, _nextAppointmentMeta));
    } else if (isInserting) {
      context.missing(_nextAppointmentMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ViralLoadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViralLoadData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      nextAppointment: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_appointment'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $ViralLoadTable createAlias(String alias) {
    return $ViralLoadTable(attachedDatabase, alias);
  }
}

class ViralLoadData extends DataClass implements Insertable<ViralLoadData> {
  final int id;
  final DateTime date;
  final String value;
  final DateTime nextAppointment;
  final String patientId;
  final String uuid;
  final String? type;
  final bool synced;
  const ViralLoadData(
      {required this.id,
      required this.date,
      required this.value,
      required this.nextAppointment,
      required this.patientId,
      required this.uuid,
      this.type,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['value'] = Variable<String>(value);
    map['next_appointment'] = Variable<DateTime>(nextAppointment);
    map['patient_id'] = Variable<String>(patientId);
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  ViralLoadCompanion toCompanion(bool nullToAbsent) {
    return ViralLoadCompanion(
      id: Value(id),
      date: Value(date),
      value: Value(value),
      nextAppointment: Value(nextAppointment),
      patientId: Value(patientId),
      uuid: Value(uuid),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      synced: Value(synced),
    );
  }

  factory ViralLoadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViralLoadData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      value: serializer.fromJson<String>(json['value']),
      nextAppointment: serializer.fromJson<DateTime>(json['nextAppointment']),
      patientId: serializer.fromJson<String>(json['patientId']),
      uuid: serializer.fromJson<String>(json['uuid']),
      type: serializer.fromJson<String?>(json['type']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'value': serializer.toJson<String>(value),
      'nextAppointment': serializer.toJson<DateTime>(nextAppointment),
      'patientId': serializer.toJson<String>(patientId),
      'uuid': serializer.toJson<String>(uuid),
      'type': serializer.toJson<String?>(type),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  ViralLoadData copyWith(
          {int? id,
          DateTime? date,
          String? value,
          DateTime? nextAppointment,
          String? patientId,
          String? uuid,
          Value<String?> type = const Value.absent(),
          bool? synced}) =>
      ViralLoadData(
        id: id ?? this.id,
        date: date ?? this.date,
        value: value ?? this.value,
        nextAppointment: nextAppointment ?? this.nextAppointment,
        patientId: patientId ?? this.patientId,
        uuid: uuid ?? this.uuid,
        type: type.present ? type.value : this.type,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('ViralLoadData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('value: $value, ')
          ..write('nextAppointment: $nextAppointment, ')
          ..write('patientId: $patientId, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, value, nextAppointment, patientId, uuid, type, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViralLoadData &&
          other.id == this.id &&
          other.date == this.date &&
          other.value == this.value &&
          other.nextAppointment == this.nextAppointment &&
          other.patientId == this.patientId &&
          other.uuid == this.uuid &&
          other.type == this.type &&
          other.synced == this.synced);
}

class ViralLoadCompanion extends UpdateCompanion<ViralLoadData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> value;
  final Value<DateTime> nextAppointment;
  final Value<String> patientId;
  final Value<String> uuid;
  final Value<String?> type;
  final Value<bool> synced;
  const ViralLoadCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.value = const Value.absent(),
    this.nextAppointment = const Value.absent(),
    this.patientId = const Value.absent(),
    this.uuid = const Value.absent(),
    this.type = const Value.absent(),
    this.synced = const Value.absent(),
  });
  ViralLoadCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String value,
    required DateTime nextAppointment,
    required String patientId,
    required String uuid,
    this.type = const Value.absent(),
    this.synced = const Value.absent(),
  })  : date = Value(date),
        value = Value(value),
        nextAppointment = Value(nextAppointment),
        patientId = Value(patientId),
        uuid = Value(uuid);
  static Insertable<ViralLoadData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? value,
    Expression<DateTime>? nextAppointment,
    Expression<String>? patientId,
    Expression<String>? uuid,
    Expression<String>? type,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (value != null) 'value': value,
      if (nextAppointment != null) 'next_appointment': nextAppointment,
      if (patientId != null) 'patient_id': patientId,
      if (uuid != null) 'uuid': uuid,
      if (type != null) 'type': type,
      if (synced != null) 'synced': synced,
    });
  }

  ViralLoadCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? value,
      Value<DateTime>? nextAppointment,
      Value<String>? patientId,
      Value<String>? uuid,
      Value<String?>? type,
      Value<bool>? synced}) {
    return ViralLoadCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      value: value ?? this.value,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      patientId: patientId ?? this.patientId,
      uuid: uuid ?? this.uuid,
      type: type ?? this.type,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (nextAppointment.present) {
      map['next_appointment'] = Variable<DateTime>(nextAppointment.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViralLoadCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('value: $value, ')
          ..write('nextAppointment: $nextAppointment, ')
          ..write('patientId: $patientId, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ClinicTable clinic = $ClinicTable(this);
  late final $DevolveTable devolve = $DevolveTable(this);
  late final $DispenseTable dispense = $DispenseTable(this);
  late final $FacilityTable facility = $FacilityTable(this);
  late final $OutletTable outlet = $OutletTable(this);
  late final $PatientTable patient = $PatientTable(this);
  late final $RegimenTable regimen = $RegimenTable(this);
  late final $ViralLoadTable viralLoad = $ViralLoadTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        clinic,
        devolve,
        dispense,
        facility,
        outlet,
        patient,
        regimen,
        viralLoad
      ];
}
