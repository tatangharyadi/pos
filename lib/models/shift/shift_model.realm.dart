// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Shift extends _Shift with RealmEntity, RealmObjectBase, RealmObject {
  Shift(
    String shift,
    String dayShift,
    String status,
    String secretPin,
    double totalSales,
  ) {
    RealmObjectBase.set(this, 'shift', shift);
    RealmObjectBase.set(this, 'dayShift', dayShift);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'secretPin', secretPin);
    RealmObjectBase.set(this, 'totalSales', totalSales);
  }

  Shift._();

  @override
  String get shift => RealmObjectBase.get<String>(this, 'shift') as String;
  @override
  set shift(String value) => throw RealmUnsupportedSetError();

  @override
  String get dayShift =>
      RealmObjectBase.get<String>(this, 'dayShift') as String;
  @override
  set dayShift(String value) => throw RealmUnsupportedSetError();

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => throw RealmUnsupportedSetError();

  @override
  String get secretPin =>
      RealmObjectBase.get<String>(this, 'secretPin') as String;
  @override
  set secretPin(String value) => throw RealmUnsupportedSetError();

  @override
  double get totalSales =>
      RealmObjectBase.get<double>(this, 'totalSales') as double;
  @override
  set totalSales(double value) => throw RealmUnsupportedSetError();

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
      'shift': shift.toEJson(),
      'dayShift': dayShift.toEJson(),
      'status': status.toEJson(),
      'secretPin': secretPin.toEJson(),
      'totalSales': totalSales.toEJson(),
    };
  }

  static EJsonValue _toEJson(Shift value) => value.toEJson();
  static Shift _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'shift': EJsonValue shift,
        'dayShift': EJsonValue dayShift,
        'status': EJsonValue status,
        'secretPin': EJsonValue secretPin,
        'totalSales': EJsonValue totalSales,
      } =>
        Shift(
          fromEJson(shift),
          fromEJson(dayShift),
          fromEJson(status),
          fromEJson(secretPin),
          fromEJson(totalSales),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Shift._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Shift, 'Shift', [
      SchemaProperty('shift', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('dayShift', RealmPropertyType.string),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('secretPin', RealmPropertyType.string),
      SchemaProperty('totalSales', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class DayShift extends _DayShift
    with RealmEntity, RealmObjectBase, RealmObject {
  DayShift(
    String dayShift,
    double totalSales,
  ) {
    RealmObjectBase.set(this, 'dayShift', dayShift);
    RealmObjectBase.set(this, 'totalSales', totalSales);
  }

  DayShift._();

  @override
  String get dayShift =>
      RealmObjectBase.get<String>(this, 'dayShift') as String;
  @override
  set dayShift(String value) => throw RealmUnsupportedSetError();

  @override
  double get totalSales =>
      RealmObjectBase.get<double>(this, 'totalSales') as double;
  @override
  set totalSales(double value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<DayShift>> get changes =>
      RealmObjectBase.getChanges<DayShift>(this);

  @override
  Stream<RealmObjectChanges<DayShift>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<DayShift>(this, keyPaths);

  @override
  DayShift freeze() => RealmObjectBase.freezeObject<DayShift>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'dayShift': dayShift.toEJson(),
      'totalSales': totalSales.toEJson(),
    };
  }

  static EJsonValue _toEJson(DayShift value) => value.toEJson();
  static DayShift _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'dayShift': EJsonValue dayShift,
        'totalSales': EJsonValue totalSales,
      } =>
        DayShift(
          fromEJson(dayShift),
          fromEJson(totalSales),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(DayShift._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, DayShift, 'DayShift', [
      SchemaProperty('dayShift', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('totalSales', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
