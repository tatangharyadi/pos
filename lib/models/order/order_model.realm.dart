// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class OrderLineModifier extends _OrderLineModifier
    with RealmEntity, RealmObjectBase, RealmObject {
  OrderLineModifier(
    ObjectId id,
    String sku,
    String name,
    double price,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
  }

  OrderLineModifier._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  Stream<RealmObjectChanges<OrderLineModifier>> get changes =>
      RealmObjectBase.getChanges<OrderLineModifier>(this);

  @override
  Stream<RealmObjectChanges<OrderLineModifier>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<OrderLineModifier>(this, keyPaths);

  @override
  OrderLineModifier freeze() =>
      RealmObjectBase.freezeObject<OrderLineModifier>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'sku': sku.toEJson(),
      'name': name.toEJson(),
      'price': price.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderLineModifier value) => value.toEJson();
  static OrderLineModifier _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'sku': EJsonValue sku,
        'name': EJsonValue name,
        'price': EJsonValue price,
      } =>
        OrderLineModifier(
          fromEJson(id),
          fromEJson(sku),
          fromEJson(name),
          fromEJson(price),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderLineModifier._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, OrderLineModifier, 'orderLineModifiers', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class OrderLine extends _OrderLine
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  OrderLine(
    ObjectId id,
    ObjectId parentId,
    String status,
    String sku,
    String name,
    int quantity,
    double unitPrice, {
    Iterable<OrderLineModifier> modifiers = const [],
    double total = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<OrderLine>({
        'total': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentId', parentId);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'unitPrice', unitPrice);
    RealmObjectBase.set<RealmList<OrderLineModifier>>(
        this, 'modifiers', RealmList<OrderLineModifier>(modifiers));
    RealmObjectBase.set(this, 'total', total);
  }

  OrderLine._();

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
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  double get unitPrice =>
      RealmObjectBase.get<double>(this, 'unitPrice') as double;
  @override
  set unitPrice(double value) => RealmObjectBase.set(this, 'unitPrice', value);

  @override
  RealmList<OrderLineModifier> get modifiers =>
      RealmObjectBase.get<OrderLineModifier>(this, 'modifiers')
          as RealmList<OrderLineModifier>;
  @override
  set modifiers(covariant RealmList<OrderLineModifier> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get total => RealmObjectBase.get<double>(this, 'total') as double;
  @override
  set total(double value) => RealmObjectBase.set(this, 'total', value);

  @override
  Stream<RealmObjectChanges<OrderLine>> get changes =>
      RealmObjectBase.getChanges<OrderLine>(this);

  @override
  Stream<RealmObjectChanges<OrderLine>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<OrderLine>(this, keyPaths);

  @override
  OrderLine freeze() => RealmObjectBase.freezeObject<OrderLine>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'parentId': parentId.toEJson(),
      'status': status.toEJson(),
      'sku': sku.toEJson(),
      'name': name.toEJson(),
      'quantity': quantity.toEJson(),
      'unitPrice': unitPrice.toEJson(),
      'modifiers': modifiers.toEJson(),
      'total': total.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderLine value) => value.toEJson();
  static OrderLine _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'parentId': EJsonValue parentId,
        'status': EJsonValue status,
        'sku': EJsonValue sku,
        'name': EJsonValue name,
        'quantity': EJsonValue quantity,
        'unitPrice': EJsonValue unitPrice,
      } =>
        OrderLine(
          fromEJson(id),
          fromEJson(parentId),
          fromEJson(status),
          fromEJson(sku),
          fromEJson(name),
          fromEJson(quantity),
          fromEJson(unitPrice),
          modifiers: fromEJson(ejson['modifiers']),
          total: fromEJson(ejson['total'], defaultValue: 0),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderLine._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, OrderLine, 'orderLines', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('parentId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('status', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('sku', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('quantity', RealmPropertyType.int),
      SchemaProperty('unitPrice', RealmPropertyType.double),
      SchemaProperty('modifiers', RealmPropertyType.object,
          linkTarget: 'orderLineModifiers',
          collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Order extends _Order with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Order(
    ObjectId id,
    ObjectId parentId,
    String type,
    String status,
    String orderNumber,
    DateTime orderDate,
    String description, {
    Iterable<OrderLine> orderLines = const [],
    double total = 0,
    String? shift,
    DateTime? shiftDate,
    String? memberId,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Order>({
        'total': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentId', parentId);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'orderNumber', orderNumber);
    RealmObjectBase.set(this, 'orderDate', orderDate);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<OrderLine>>(
        this, 'orderLines', RealmList<OrderLine>(orderLines));
    RealmObjectBase.set(this, 'total', total);
    RealmObjectBase.set(this, 'shift', shift);
    RealmObjectBase.set(this, 'shiftDate', shiftDate);
    RealmObjectBase.set(this, 'memberId', memberId);
  }

  Order._();

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
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get orderNumber =>
      RealmObjectBase.get<String>(this, 'orderNumber') as String;
  @override
  set orderNumber(String value) =>
      RealmObjectBase.set(this, 'orderNumber', value);

  @override
  DateTime get orderDate =>
      RealmObjectBase.get<DateTime>(this, 'orderDate') as DateTime;
  @override
  set orderDate(DateTime value) =>
      RealmObjectBase.set(this, 'orderDate', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<OrderLine> get orderLines =>
      RealmObjectBase.get<OrderLine>(this, 'orderLines')
          as RealmList<OrderLine>;
  @override
  set orderLines(covariant RealmList<OrderLine> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get total => RealmObjectBase.get<double>(this, 'total') as double;
  @override
  set total(double value) => RealmObjectBase.set(this, 'total', value);

  @override
  String? get shift => RealmObjectBase.get<String>(this, 'shift') as String?;
  @override
  set shift(String? value) => RealmObjectBase.set(this, 'shift', value);

  @override
  DateTime? get shiftDate =>
      RealmObjectBase.get<DateTime>(this, 'shiftDate') as DateTime?;
  @override
  set shiftDate(DateTime? value) =>
      RealmObjectBase.set(this, 'shiftDate', value);

  @override
  String? get memberId =>
      RealmObjectBase.get<String>(this, 'memberId') as String?;
  @override
  set memberId(String? value) => RealmObjectBase.set(this, 'memberId', value);

  @override
  Stream<RealmObjectChanges<Order>> get changes =>
      RealmObjectBase.getChanges<Order>(this);

  @override
  Stream<RealmObjectChanges<Order>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Order>(this, keyPaths);

  @override
  Order freeze() => RealmObjectBase.freezeObject<Order>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'parentId': parentId.toEJson(),
      'type': type.toEJson(),
      'status': status.toEJson(),
      'orderNumber': orderNumber.toEJson(),
      'orderDate': orderDate.toEJson(),
      'description': description.toEJson(),
      'orderLines': orderLines.toEJson(),
      'total': total.toEJson(),
      'shift': shift.toEJson(),
      'shiftDate': shiftDate.toEJson(),
      'memberId': memberId.toEJson(),
    };
  }

  static EJsonValue _toEJson(Order value) => value.toEJson();
  static Order _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'parentId': EJsonValue parentId,
        'type': EJsonValue type,
        'status': EJsonValue status,
        'orderNumber': EJsonValue orderNumber,
        'orderDate': EJsonValue orderDate,
        'description': EJsonValue description,
      } =>
        Order(
          fromEJson(id),
          fromEJson(parentId),
          fromEJson(type),
          fromEJson(status),
          fromEJson(orderNumber),
          fromEJson(orderDate),
          fromEJson(description),
          orderLines: fromEJson(ejson['orderLines']),
          total: fromEJson(ejson['total'], defaultValue: 0),
          shift: fromEJson(ejson['shift']),
          shiftDate: fromEJson(ejson['shiftDate']),
          memberId: fromEJson(ejson['memberId']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Order._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Order, 'orders', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('parentId', RealmPropertyType.objectid,
          indexType: RealmIndexType.regular),
      SchemaProperty('type', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('status', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('orderNumber', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('orderDate', RealmPropertyType.timestamp),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('orderLines', RealmPropertyType.object,
          linkTarget: 'orderLines', collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.double),
      SchemaProperty('shift', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.regular),
      SchemaProperty('shiftDate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('memberId', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.regular),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ParentOrder extends _ParentOrder
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ParentOrder(
    ObjectId id,
    String type, {
    double? totalOrders = 0,
    double? totalPayments = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ParentOrder>({
        'totalOrders': 0,
        'totalPayments': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'totalOrders', totalOrders);
    RealmObjectBase.set(this, 'totalPayments', totalPayments);
  }

  ParentOrder._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  double? get totalOrders =>
      RealmObjectBase.get<double>(this, 'totalOrders') as double?;
  @override
  set totalOrders(double? value) =>
      RealmObjectBase.set(this, 'totalOrders', value);

  @override
  double? get totalPayments =>
      RealmObjectBase.get<double>(this, 'totalPayments') as double?;
  @override
  set totalPayments(double? value) =>
      RealmObjectBase.set(this, 'totalPayments', value);

  @override
  Stream<RealmObjectChanges<ParentOrder>> get changes =>
      RealmObjectBase.getChanges<ParentOrder>(this);

  @override
  Stream<RealmObjectChanges<ParentOrder>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ParentOrder>(this, keyPaths);

  @override
  ParentOrder freeze() => RealmObjectBase.freezeObject<ParentOrder>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'type': type.toEJson(),
      'totalOrders': totalOrders.toEJson(),
      'totalPayments': totalPayments.toEJson(),
    };
  }

  static EJsonValue _toEJson(ParentOrder value) => value.toEJson();
  static ParentOrder _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'type': EJsonValue type,
      } =>
        ParentOrder(
          fromEJson(id),
          fromEJson(type),
          totalOrders: fromEJson(ejson['totalOrders'], defaultValue: 0),
          totalPayments: fromEJson(ejson['totalPayments'], defaultValue: 0),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ParentOrder._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ParentOrder, 'parentOrders', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('totalOrders', RealmPropertyType.double, optional: true),
      SchemaProperty('totalPayments', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
