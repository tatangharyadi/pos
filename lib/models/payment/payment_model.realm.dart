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
    String type,
    DateTime paymentDate,
    String reference,
    ObjectId orderId, {
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
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'paymentDate', paymentDate);
    RealmObjectBase.set(this, 'reference', reference);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'orderId', orderId);
    RealmObjectBase.set(this, 'selected', selected);
  }

  Payment._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  DateTime get paymentDate =>
      RealmObjectBase.get<DateTime>(this, 'paymentDate') as DateTime;
  @override
  set paymentDate(DateTime value) =>
      RealmObjectBase.set(this, 'paymentDate', value);

  @override
  String get reference =>
      RealmObjectBase.get<String>(this, 'reference') as String;
  @override
  set reference(String value) => RealmObjectBase.set(this, 'reference', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  ObjectId get orderId =>
      RealmObjectBase.get<ObjectId>(this, 'orderId') as ObjectId;
  @override
  set orderId(ObjectId value) => RealmObjectBase.set(this, 'orderId', value);

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
      'type': type.toEJson(),
      'paymentDate': paymentDate.toEJson(),
      'reference': reference.toEJson(),
      'amount': amount.toEJson(),
      'orderId': orderId.toEJson(),
      'selected': selected.toEJson(),
    };
  }

  static EJsonValue _toEJson(Payment value) => value.toEJson();
  static Payment _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'type': EJsonValue type,
        'paymentDate': EJsonValue paymentDate,
        'reference': EJsonValue reference,
        'orderId': EJsonValue orderId,
      } =>
        Payment(
          fromEJson(id),
          fromEJson(type),
          fromEJson(paymentDate),
          fromEJson(reference),
          fromEJson(orderId),
          amount: fromEJson(ejson['amount'], defaultValue: 0.0),
          selected: fromEJson(ejson['selected'], defaultValue: false),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Payment._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Payment, 'payments', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('paymentDate', RealmPropertyType.timestamp),
      SchemaProperty('reference', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('orderId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('selected', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
