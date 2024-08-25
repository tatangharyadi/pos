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
    ObjectId parentId,
    ObjectId orderId,
    String type,
    DateTime paymentDate,
    String reference, {
    double amount = 0.0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Payment>({
        'amount': 0.0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentId', parentId);
    RealmObjectBase.set(this, 'orderId', orderId);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'paymentDate', paymentDate);
    RealmObjectBase.set(this, 'reference', reference);
    RealmObjectBase.set(this, 'amount', amount);
  }

  Payment._();

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
  ObjectId get orderId =>
      RealmObjectBase.get<ObjectId>(this, 'orderId') as ObjectId;
  @override
  set orderId(ObjectId value) => RealmObjectBase.set(this, 'orderId', value);

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
      'parentId': parentId.toEJson(),
      'orderId': orderId.toEJson(),
      'type': type.toEJson(),
      'paymentDate': paymentDate.toEJson(),
      'reference': reference.toEJson(),
      'amount': amount.toEJson(),
    };
  }

  static EJsonValue _toEJson(Payment value) => value.toEJson();
  static Payment _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'parentId': EJsonValue parentId,
        'orderId': EJsonValue orderId,
        'type': EJsonValue type,
        'paymentDate': EJsonValue paymentDate,
        'reference': EJsonValue reference,
      } =>
        Payment(
          fromEJson(id),
          fromEJson(parentId),
          fromEJson(orderId),
          fromEJson(type),
          fromEJson(paymentDate),
          fromEJson(reference),
          amount: fromEJson(ejson['amount'], defaultValue: 0.0),
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
      SchemaProperty('parentId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('orderId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('type', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('paymentDate', RealmPropertyType.timestamp),
      SchemaProperty('reference', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
