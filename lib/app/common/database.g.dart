// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BaZiItemsTable extends BaZiItems
    with TableInfo<$BaZiItemsTable, BaZiItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaZiItemsTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      '备注', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _solarTimeMeta =
      const VerificationMeta('solarTime');
  @override
  late final GeneratedColumn<DateTime> solarTime = GeneratedColumn<DateTime>(
      'solar_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timeZoneMeta =
      const VerificationMeta('timeZone');
  @override
  late final GeneratedColumn<String> timeZone = GeneratedColumn<String>(
      'time_zone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
      'longitude', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
      'latitude', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, gender, notes, time, solarTime, timeZone, longitude, latitude];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ba_zi_items';
  @override
  VerificationContext validateIntegrity(Insertable<BaZiItem> instance,
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('备注')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['备注']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('solar_time')) {
      context.handle(_solarTimeMeta,
          solarTime.isAcceptableOrUnknown(data['solar_time']!, _solarTimeMeta));
    } else if (isInserting) {
      context.missing(_solarTimeMeta);
    }
    if (data.containsKey('time_zone')) {
      context.handle(_timeZoneMeta,
          timeZone.isAcceptableOrUnknown(data['time_zone']!, _timeZoneMeta));
    } else if (isInserting) {
      context.missing(_timeZoneMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BaZiItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BaZiItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}备注'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      solarTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}solar_time'])!,
      timeZone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_zone'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}longitude'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latitude'])!,
    );
  }

  @override
  $BaZiItemsTable createAlias(String alias) {
    return $BaZiItemsTable(attachedDatabase, alias);
  }
}

class BaZiItem extends DataClass implements Insertable<BaZiItem> {
  final int id;
  final String name;
  final int gender;
  final String notes;
  final DateTime time;
  final DateTime solarTime;
  final String timeZone;
  final String longitude;
  final String latitude;
  const BaZiItem(
      {required this.id,
      required this.name,
      required this.gender,
      required this.notes,
      required this.time,
      required this.solarTime,
      required this.timeZone,
      required this.longitude,
      required this.latitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<int>(gender);
    map['备注'] = Variable<String>(notes);
    map['time'] = Variable<DateTime>(time);
    map['solar_time'] = Variable<DateTime>(solarTime);
    map['time_zone'] = Variable<String>(timeZone);
    map['longitude'] = Variable<String>(longitude);
    map['latitude'] = Variable<String>(latitude);
    return map;
  }

  BaZiItemsCompanion toCompanion(bool nullToAbsent) {
    return BaZiItemsCompanion(
      id: Value(id),
      name: Value(name),
      gender: Value(gender),
      notes: Value(notes),
      time: Value(time),
      solarTime: Value(solarTime),
      timeZone: Value(timeZone),
      longitude: Value(longitude),
      latitude: Value(latitude),
    );
  }

  factory BaZiItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BaZiItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<int>(json['gender']),
      notes: serializer.fromJson<String>(json['notes']),
      time: serializer.fromJson<DateTime>(json['time']),
      solarTime: serializer.fromJson<DateTime>(json['solarTime']),
      timeZone: serializer.fromJson<String>(json['timeZone']),
      longitude: serializer.fromJson<String>(json['longitude']),
      latitude: serializer.fromJson<String>(json['latitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<int>(gender),
      'notes': serializer.toJson<String>(notes),
      'time': serializer.toJson<DateTime>(time),
      'solarTime': serializer.toJson<DateTime>(solarTime),
      'timeZone': serializer.toJson<String>(timeZone),
      'longitude': serializer.toJson<String>(longitude),
      'latitude': serializer.toJson<String>(latitude),
    };
  }

  BaZiItem copyWith(
          {int? id,
          String? name,
          int? gender,
          String? notes,
          DateTime? time,
          DateTime? solarTime,
          String? timeZone,
          String? longitude,
          String? latitude}) =>
      BaZiItem(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        notes: notes ?? this.notes,
        time: time ?? this.time,
        solarTime: solarTime ?? this.solarTime,
        timeZone: timeZone ?? this.timeZone,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );
  @override
  String toString() {
    return (StringBuffer('BaZiItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('notes: $notes, ')
          ..write('time: $time, ')
          ..write('solarTime: $solarTime, ')
          ..write('timeZone: $timeZone, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, gender, notes, time, solarTime, timeZone, longitude, latitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaZiItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.notes == this.notes &&
          other.time == this.time &&
          other.solarTime == this.solarTime &&
          other.timeZone == this.timeZone &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude);
}

class BaZiItemsCompanion extends UpdateCompanion<BaZiItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> gender;
  final Value<String> notes;
  final Value<DateTime> time;
  final Value<DateTime> solarTime;
  final Value<String> timeZone;
  final Value<String> longitude;
  final Value<String> latitude;
  const BaZiItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.notes = const Value.absent(),
    this.time = const Value.absent(),
    this.solarTime = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
  });
  BaZiItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int gender,
    required String notes,
    required DateTime time,
    required DateTime solarTime,
    required String timeZone,
    required String longitude,
    required String latitude,
  })  : name = Value(name),
        gender = Value(gender),
        notes = Value(notes),
        time = Value(time),
        solarTime = Value(solarTime),
        timeZone = Value(timeZone),
        longitude = Value(longitude),
        latitude = Value(latitude);
  static Insertable<BaZiItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? gender,
    Expression<String>? notes,
    Expression<DateTime>? time,
    Expression<DateTime>? solarTime,
    Expression<String>? timeZone,
    Expression<String>? longitude,
    Expression<String>? latitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (notes != null) '备注': notes,
      if (time != null) 'time': time,
      if (solarTime != null) 'solar_time': solarTime,
      if (timeZone != null) 'time_zone': timeZone,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
    });
  }

  BaZiItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? gender,
      Value<String>? notes,
      Value<DateTime>? time,
      Value<DateTime>? solarTime,
      Value<String>? timeZone,
      Value<String>? longitude,
      Value<String>? latitude}) {
    return BaZiItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      notes: notes ?? this.notes,
      time: time ?? this.time,
      solarTime: solarTime ?? this.solarTime,
      timeZone: timeZone ?? this.timeZone,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
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
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (notes.present) {
      map['备注'] = Variable<String>(notes.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (solarTime.present) {
      map['solar_time'] = Variable<DateTime>(solarTime.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaZiItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('notes: $notes, ')
          ..write('time: $time, ')
          ..write('solarTime: $solarTime, ')
          ..write('timeZone: $timeZone, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude')
          ..write(')'))
        .toString();
  }
}

class $ZiWeiItemsTable extends ZiWeiItems
    with TableInfo<$ZiWeiItemsTable, ZiWeiItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZiWeiItemsTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      '备注', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _solarTimeMeta =
      const VerificationMeta('solarTime');
  @override
  late final GeneratedColumn<DateTime> solarTime = GeneratedColumn<DateTime>(
      'solar_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timeZoneMeta =
      const VerificationMeta('timeZone');
  @override
  late final GeneratedColumn<String> timeZone = GeneratedColumn<String>(
      'time_zone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
      'longitude', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
      'latitude', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, gender, notes, time, solarTime, timeZone, longitude, latitude];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zi_wei_items';
  @override
  VerificationContext validateIntegrity(Insertable<ZiWeiItem> instance,
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('备注')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['备注']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('solar_time')) {
      context.handle(_solarTimeMeta,
          solarTime.isAcceptableOrUnknown(data['solar_time']!, _solarTimeMeta));
    } else if (isInserting) {
      context.missing(_solarTimeMeta);
    }
    if (data.containsKey('time_zone')) {
      context.handle(_timeZoneMeta,
          timeZone.isAcceptableOrUnknown(data['time_zone']!, _timeZoneMeta));
    } else if (isInserting) {
      context.missing(_timeZoneMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ZiWeiItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZiWeiItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}备注'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      solarTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}solar_time'])!,
      timeZone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_zone'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}longitude'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latitude'])!,
    );
  }

  @override
  $ZiWeiItemsTable createAlias(String alias) {
    return $ZiWeiItemsTable(attachedDatabase, alias);
  }
}

class ZiWeiItem extends DataClass implements Insertable<ZiWeiItem> {
  final int id;
  final String name;
  final int gender;
  final String notes;
  final DateTime time;
  final DateTime solarTime;
  final String timeZone;
  final String longitude;
  final String latitude;
  const ZiWeiItem(
      {required this.id,
      required this.name,
      required this.gender,
      required this.notes,
      required this.time,
      required this.solarTime,
      required this.timeZone,
      required this.longitude,
      required this.latitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<int>(gender);
    map['备注'] = Variable<String>(notes);
    map['time'] = Variable<DateTime>(time);
    map['solar_time'] = Variable<DateTime>(solarTime);
    map['time_zone'] = Variable<String>(timeZone);
    map['longitude'] = Variable<String>(longitude);
    map['latitude'] = Variable<String>(latitude);
    return map;
  }

  ZiWeiItemsCompanion toCompanion(bool nullToAbsent) {
    return ZiWeiItemsCompanion(
      id: Value(id),
      name: Value(name),
      gender: Value(gender),
      notes: Value(notes),
      time: Value(time),
      solarTime: Value(solarTime),
      timeZone: Value(timeZone),
      longitude: Value(longitude),
      latitude: Value(latitude),
    );
  }

  factory ZiWeiItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZiWeiItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<int>(json['gender']),
      notes: serializer.fromJson<String>(json['notes']),
      time: serializer.fromJson<DateTime>(json['time']),
      solarTime: serializer.fromJson<DateTime>(json['solarTime']),
      timeZone: serializer.fromJson<String>(json['timeZone']),
      longitude: serializer.fromJson<String>(json['longitude']),
      latitude: serializer.fromJson<String>(json['latitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<int>(gender),
      'notes': serializer.toJson<String>(notes),
      'time': serializer.toJson<DateTime>(time),
      'solarTime': serializer.toJson<DateTime>(solarTime),
      'timeZone': serializer.toJson<String>(timeZone),
      'longitude': serializer.toJson<String>(longitude),
      'latitude': serializer.toJson<String>(latitude),
    };
  }

  ZiWeiItem copyWith(
          {int? id,
          String? name,
          int? gender,
          String? notes,
          DateTime? time,
          DateTime? solarTime,
          String? timeZone,
          String? longitude,
          String? latitude}) =>
      ZiWeiItem(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        notes: notes ?? this.notes,
        time: time ?? this.time,
        solarTime: solarTime ?? this.solarTime,
        timeZone: timeZone ?? this.timeZone,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );
  @override
  String toString() {
    return (StringBuffer('ZiWeiItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('notes: $notes, ')
          ..write('time: $time, ')
          ..write('solarTime: $solarTime, ')
          ..write('timeZone: $timeZone, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, gender, notes, time, solarTime, timeZone, longitude, latitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZiWeiItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.notes == this.notes &&
          other.time == this.time &&
          other.solarTime == this.solarTime &&
          other.timeZone == this.timeZone &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude);
}

class ZiWeiItemsCompanion extends UpdateCompanion<ZiWeiItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> gender;
  final Value<String> notes;
  final Value<DateTime> time;
  final Value<DateTime> solarTime;
  final Value<String> timeZone;
  final Value<String> longitude;
  final Value<String> latitude;
  const ZiWeiItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.notes = const Value.absent(),
    this.time = const Value.absent(),
    this.solarTime = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
  });
  ZiWeiItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int gender,
    required String notes,
    required DateTime time,
    required DateTime solarTime,
    required String timeZone,
    required String longitude,
    required String latitude,
  })  : name = Value(name),
        gender = Value(gender),
        notes = Value(notes),
        time = Value(time),
        solarTime = Value(solarTime),
        timeZone = Value(timeZone),
        longitude = Value(longitude),
        latitude = Value(latitude);
  static Insertable<ZiWeiItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? gender,
    Expression<String>? notes,
    Expression<DateTime>? time,
    Expression<DateTime>? solarTime,
    Expression<String>? timeZone,
    Expression<String>? longitude,
    Expression<String>? latitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (notes != null) '备注': notes,
      if (time != null) 'time': time,
      if (solarTime != null) 'solar_time': solarTime,
      if (timeZone != null) 'time_zone': timeZone,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
    });
  }

  ZiWeiItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? gender,
      Value<String>? notes,
      Value<DateTime>? time,
      Value<DateTime>? solarTime,
      Value<String>? timeZone,
      Value<String>? longitude,
      Value<String>? latitude}) {
    return ZiWeiItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      notes: notes ?? this.notes,
      time: time ?? this.time,
      solarTime: solarTime ?? this.solarTime,
      timeZone: timeZone ?? this.timeZone,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
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
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (notes.present) {
      map['备注'] = Variable<String>(notes.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (solarTime.present) {
      map['solar_time'] = Variable<DateTime>(solarTime.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZiWeiItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('notes: $notes, ')
          ..write('time: $time, ')
          ..write('solarTime: $solarTime, ')
          ..write('timeZone: $timeZone, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $BaZiItemsTable baZiItems = $BaZiItemsTable(this);
  late final $ZiWeiItemsTable ziWeiItems = $ZiWeiItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [baZiItems, ziWeiItems];
}
