// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Payment extends _Payment with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Payment(
    ObjectId id,
    ObjectId orderId,
    String paymentType,
    DateTime paymentDate, {
    double amount = 0.0,
    bool selected = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Payment>({
        'amount': 0.0,
        'selected': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'orderId', orderId);
    RealmObjectBase.set(this, 'paymentType', paymentType);
    RealmObjectBase.set(this, 'paymentDate', paymentDate);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'selected', selected);
  }

  Payment._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId get orderId =>
      RealmObjectBase.get<ObjectId>(this, 'orderId') as ObjectId;
  @override
  set orderId(ObjectId value) => RealmObjectBase.set(this, 'orderId', value);

  @override
  String get paymentType =>
      RealmObjectBase.get<String>(this, 'paymentType') as String;
  @override
  set paymentType(String value) =>
      RealmObjectBase.set(this, 'paymentType', value);

  @override
  DateTime get paymentDate =>
      RealmObjectBase.get<DateTime>(this, 'paymentDate') as DateTime;
  @override
  set paymentDate(DateTime value) =>
      RealmObjectBase.set(this, 'paymentDate', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  bool get selected => RealmObjectBase.get<bool>(this, 'selected') as bool;
  @override
  set selected(bool value) => RealmObjectBase.set(this, 'selected', value);

  @override
  Stream<RealmObjectChanges<Payment>> get changes =>
      RealmObjectBase.getChanges<Payment>(this);

  @override
  Stream<RealmObjectChanges<Payment>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Payment>(this, keyPaths);

  @override
  Payment freeze() => RealmObjectBase.freezeObject<Payment>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'orderId': orderId.toEJson(),
      'paymentType': paymentType.toEJson(),
      'paymentDate': paymentDate.toEJson(),
      'amount': amount.toEJson(),
      'selected': selected.toEJson(),
    };
  }

  static EJsonValue _toEJson(Payment value) => value.toEJson();
  static Payment _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'orderId': EJsonValue orderId,
        'paymentType': EJsonValue paymentType,
        'paymentDate': EJsonValue paymentDate,
        'amount': EJsonValue amount,
        'selected': EJsonValue selected,
      } =>
        Payment(
          fromEJson(id),
          fromEJson(orderId),
          fromEJson(paymentType),
          fromEJson(paymentDate),
          amount: fromEJson(amount),
          selected: fromEJson(selected),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Payment._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Payment, 'payments', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('orderId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('paymentType', RealmPropertyType.string),
      SchemaProperty('paymentDate', RealmPropertyType.timestamp),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('selected', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
