// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Shift extends _Shift with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Shift(
    ObjectId id,
    ObjectId parentId,
    String name,
    DateTime startTime,
    DateTime endTime,
    String status,
    String secretPin, {
    DateTime? openTime,
    DateTime? closeTime,
    double totalSales = 0.0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Shift>({
        'totalSales': 0.0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentId', parentId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'startTime', startTime);
    RealmObjectBase.set(this, 'endTime', endTime);
    RealmObjectBase.set(this, 'openTime', openTime);
    RealmObjectBase.set(this, 'closeTime', closeTime);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'secretPin', secretPin);
    RealmObjectBase.set(this, 'totalSales', totalSales);
  }

  Shift._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId get parentId =>
      RealmObjectBase.get<ObjectId>(this, 'parentId') as ObjectId;
  @override
  set parentId(ObjectId value) => RealmObjectBase.set(this, 'parentId', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  DateTime get startTime =>
      RealmObjectBase.get<DateTime>(this, 'startTime') as DateTime;
  @override
  set startTime(DateTime value) =>
      RealmObjectBase.set(this, 'startTime', value);

  @override
  DateTime get endTime =>
      RealmObjectBase.get<DateTime>(this, 'endTime') as DateTime;
  @override
  set endTime(DateTime value) => RealmObjectBase.set(this, 'endTime', value);

  @override
  DateTime? get openTime =>
      RealmObjectBase.get<DateTime>(this, 'openTime') as DateTime?;
  @override
  set openTime(DateTime? value) => RealmObjectBase.set(this, 'openTime', value);

  @override
  DateTime? get closeTime =>
      RealmObjectBase.get<DateTime>(this, 'closeTime') as DateTime?;
  @override
  set closeTime(DateTime? value) =>
      RealmObjectBase.set(this, 'closeTime', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get secretPin =>
      RealmObjectBase.get<String>(this, 'secretPin') as String;
  @override
  set secretPin(String value) => RealmObjectBase.set(this, 'secretPin', value);

  @override
  double get totalSales =>
      RealmObjectBase.get<double>(this, 'totalSales') as double;
  @override
  set totalSales(double value) =>
      RealmObjectBase.set(this, 'totalSales', value);

  @override
  Stream<RealmObjectChanges<Shift>> get changes =>
      RealmObjectBase.getChanges<Shift>(this);

  @override
  Stream<RealmObjectChanges<Shift>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Shift>(this, keyPaths);

  @override
  Shift freeze() => RealmObjectBase.freezeObject<Shift>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'parentId': parentId.toEJson(),
      'name': name.toEJson(),
      'startTime': startTime.toEJson(),
      'endTime': endTime.toEJson(),
      'openTime': openTime.toEJson(),
      'closeTime': closeTime.toEJson(),
      'status': status.toEJson(),
      'secretPin': secretPin.toEJson(),
      'totalSales': totalSales.toEJson(),
    };
  }

  static EJsonValue _toEJson(Shift value) => value.toEJson();
  static Shift _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'parentId': EJsonValue parentId,
        'name': EJsonValue name,
        'startTime': EJsonValue startTime,
        'endTime': EJsonValue endTime,
        'status': EJsonValue status,
        'secretPin': EJsonValue secretPin,
      } =>
        Shift(
          fromEJson(id),
          fromEJson(parentId),
          fromEJson(name),
          fromEJson(startTime),
          fromEJson(endTime),
          fromEJson(status),
          fromEJson(secretPin),
          openTime: fromEJson(ejson['openTime']),
          closeTime: fromEJson(ejson['closeTime']),
          totalSales: fromEJson(ejson['totalSales'], defaultValue: 0.0),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Shift._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Shift, 'shifts', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('parentId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('startTime', RealmPropertyType.timestamp),
      SchemaProperty('endTime', RealmPropertyType.timestamp),
      SchemaProperty('openTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('closeTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('secretPin', RealmPropertyType.string),
      SchemaProperty('totalSales', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ParentShift extends _ParentShift
    with RealmEntity, RealmObjectBase, RealmObject {
  ParentShift(
    ObjectId id,
    String name,
    DateTime startTime,
    DateTime endTime,
    DateTime startDate,
    DateTime endDate,
    String secretPin,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'startTime', startTime);
    RealmObjectBase.set(this, 'endTime', endTime);
    RealmObjectBase.set(this, 'startDate', startDate);
    RealmObjectBase.set(this, 'endDate', endDate);
    RealmObjectBase.set(this, 'secretPin', secretPin);
  }

  ParentShift._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  DateTime get startTime =>
      RealmObjectBase.get<DateTime>(this, 'startTime') as DateTime;
  @override
  set startTime(DateTime value) =>
      RealmObjectBase.set(this, 'startTime', value);

  @override
  DateTime get endTime =>
      RealmObjectBase.get<DateTime>(this, 'endTime') as DateTime;
  @override
  set endTime(DateTime value) => RealmObjectBase.set(this, 'endTime', value);

  @override
  DateTime get startDate =>
      RealmObjectBase.get<DateTime>(this, 'startDate') as DateTime;
  @override
  set startDate(DateTime value) =>
      RealmObjectBase.set(this, 'startDate', value);

  @override
  DateTime get endDate =>
      RealmObjectBase.get<DateTime>(this, 'endDate') as DateTime;
  @override
  set endDate(DateTime value) => RealmObjectBase.set(this, 'endDate', value);

  @override
  String get secretPin =>
      RealmObjectBase.get<String>(this, 'secretPin') as String;
  @override
  set secretPin(String value) => RealmObjectBase.set(this, 'secretPin', value);

  @override
  Stream<RealmObjectChanges<ParentShift>> get changes =>
      RealmObjectBase.getChanges<ParentShift>(this);

  @override
  Stream<RealmObjectChanges<ParentShift>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ParentShift>(this, keyPaths);

  @override
  ParentShift freeze() => RealmObjectBase.freezeObject<ParentShift>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'startTime': startTime.toEJson(),
      'endTime': endTime.toEJson(),
      'startDate': startDate.toEJson(),
      'endDate': endDate.toEJson(),
      'secretPin': secretPin.toEJson(),
    };
  }

  static EJsonValue _toEJson(ParentShift value) => value.toEJson();
  static ParentShift _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'startTime': EJsonValue startTime,
        'endTime': EJsonValue endTime,
        'startDate': EJsonValue startDate,
        'endDate': EJsonValue endDate,
        'secretPin': EJsonValue secretPin,
      } =>
        ParentShift(
          fromEJson(id),
          fromEJson(name),
          fromEJson(startTime),
          fromEJson(endTime),
          fromEJson(startDate),
          fromEJson(endDate),
          fromEJson(secretPin),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ParentShift._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ParentShift, 'parentShifts', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('startTime', RealmPropertyType.timestamp),
      SchemaProperty('endTime', RealmPropertyType.timestamp),
      SchemaProperty('startDate', RealmPropertyType.timestamp),
      SchemaProperty('endDate', RealmPropertyType.timestamp),
      SchemaProperty('secretPin', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
