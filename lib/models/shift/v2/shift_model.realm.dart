// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
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
    return SchemaObject(ObjectType.realmObject, ParentShift, 'parentShifts', [
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
