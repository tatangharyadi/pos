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
    String name,
    DateTime startTime,
    DateTime endTime,
    String status,
    String secretPin, {
    DateTime? openTime,
    DateTime? closeTime,
    bool selected = false,
    double totalSales = 0.0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Shift>({
        'selected': false,
        'totalSales': 0.0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'startTime', startTime);
    RealmObjectBase.set(this, 'endTime', endTime);
    RealmObjectBase.set(this, 'openTime', openTime);
    RealmObjectBase.set(this, 'closeTime', closeTime);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'secretPin', secretPin);
    RealmObjectBase.set(this, 'selected', selected);
    RealmObjectBase.set(this, 'totalSales', totalSales);
  }

  Shift._();

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
  bool get selected => RealmObjectBase.get<bool>(this, 'selected') as bool;
  @override
  set selected(bool value) => RealmObjectBase.set(this, 'selected', value);

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
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'startTime': startTime.toEJson(),
      'endTime': endTime.toEJson(),
      'openTime': openTime.toEJson(),
      'closeTime': closeTime.toEJson(),
      'status': status.toEJson(),
      'secretPin': secretPin.toEJson(),
      'selected': selected.toEJson(),
      'totalSales': totalSales.toEJson(),
    };
  }

  static EJsonValue _toEJson(Shift value) => value.toEJson();
  static Shift _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'startTime': EJsonValue startTime,
        'endTime': EJsonValue endTime,
        'openTime': EJsonValue openTime,
        'closeTime': EJsonValue closeTime,
        'status': EJsonValue status,
        'secretPin': EJsonValue secretPin,
        'selected': EJsonValue selected,
        'totalSales': EJsonValue totalSales,
      } =>
        Shift(
          fromEJson(id),
          fromEJson(name),
          fromEJson(startTime),
          fromEJson(endTime),
          fromEJson(status),
          fromEJson(secretPin),
          openTime: fromEJson(openTime),
          closeTime: fromEJson(closeTime),
          selected: fromEJson(selected),
          totalSales: fromEJson(totalSales),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Shift._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Shift, 'shift', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('startTime', RealmPropertyType.timestamp),
      SchemaProperty('endTime', RealmPropertyType.timestamp),
      SchemaProperty('openTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('closeTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('secretPin', RealmPropertyType.string),
      SchemaProperty('selected', RealmPropertyType.bool),
      SchemaProperty('totalSales', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class DayShift extends _DayShift
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  DayShift(
    ObjectId id,
    String name,
    DateTime dateShift, {
    double totalSales = 0.0,
    Iterable<Shift> shifts = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<DayShift>({
        'totalSales': 0.0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'dateShift', dateShift);
    RealmObjectBase.set(this, 'totalSales', totalSales);
    RealmObjectBase.set<RealmList<Shift>>(
        this, 'shifts', RealmList<Shift>(shifts));
  }

  DayShift._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  DateTime get dateShift =>
      RealmObjectBase.get<DateTime>(this, 'dateShift') as DateTime;
  @override
  set dateShift(DateTime value) =>
      RealmObjectBase.set(this, 'dateShift', value);

  @override
  double get totalSales =>
      RealmObjectBase.get<double>(this, 'totalSales') as double;
  @override
  set totalSales(double value) =>
      RealmObjectBase.set(this, 'totalSales', value);

  @override
  RealmList<Shift> get shifts =>
      RealmObjectBase.get<Shift>(this, 'shifts') as RealmList<Shift>;
  @override
  set shifts(covariant RealmList<Shift> value) =>
      throw RealmUnsupportedSetError();

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
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'dateShift': dateShift.toEJson(),
      'totalSales': totalSales.toEJson(),
      'shifts': shifts.toEJson(),
    };
  }

  static EJsonValue _toEJson(DayShift value) => value.toEJson();
  static DayShift _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'dateShift': EJsonValue dateShift,
        'totalSales': EJsonValue totalSales,
        'shifts': EJsonValue shifts,
      } =>
        DayShift(
          fromEJson(id),
          fromEJson(name),
          fromEJson(dateShift),
          totalSales: fromEJson(totalSales),
          shifts: fromEJson(shifts),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(DayShift._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, DayShift, 'dayshift', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('dateShift', RealmPropertyType.timestamp),
      SchemaProperty('totalSales', RealmPropertyType.double),
      SchemaProperty('shifts', RealmPropertyType.object,
          linkTarget: 'shift', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
