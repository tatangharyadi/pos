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
    String name,
    double price,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
  }

  OrderLineModifier._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

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
      'name': name.toEJson(),
      'price': price.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderLineModifier value) => value.toEJson();
  static OrderLineModifier _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'price': EJsonValue price,
      } =>
        OrderLineModifier(
          fromEJson(id),
          fromEJson(name),
          fromEJson(price),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderLineModifier._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, OrderLineModifier, 'orderLineModifiers', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
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
    String sku,
    String name,
    int quantity,
    double unitPrice, {
    Iterable<OrderLineModifier> modifiers = const [],
    double? total = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<OrderLine>({
        'total': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
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
  double? get total => RealmObjectBase.get<double>(this, 'total') as double?;
  @override
  set total(double? value) => RealmObjectBase.set(this, 'total', value);

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
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'sku': EJsonValue sku,
        'name': EJsonValue name,
        'quantity': EJsonValue quantity,
        'unitPrice': EJsonValue unitPrice,
        'modifiers': EJsonValue modifiers,
        'total': EJsonValue total,
      } =>
        OrderLine(
          fromEJson(id),
          fromEJson(sku),
          fromEJson(name),
          fromEJson(quantity),
          fromEJson(unitPrice),
          modifiers: fromEJson(modifiers),
          total: fromEJson(total),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderLine._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, OrderLine, 'orderLines', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('quantity', RealmPropertyType.int),
      SchemaProperty('unitPrice', RealmPropertyType.double),
      SchemaProperty('modifiers', RealmPropertyType.object,
          linkTarget: 'orderLineModifiers',
          collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Order extends _Order with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Order(
    ObjectId id,
    String shift,
    DateTime orderDate,
    String orderNumber,
    String status,
    String description, {
    Iterable<OrderLine> orderLines = const [],
    double? total = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Order>({
        'total': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'shift', shift);
    RealmObjectBase.set(this, 'orderDate', orderDate);
    RealmObjectBase.set(this, 'orderNumber', orderNumber);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<OrderLine>>(
        this, 'orderLines', RealmList<OrderLine>(orderLines));
    RealmObjectBase.set(this, 'total', total);
  }

  Order._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get shift => RealmObjectBase.get<String>(this, 'shift') as String;
  @override
  set shift(String value) => RealmObjectBase.set(this, 'shift', value);

  @override
  DateTime get orderDate =>
      RealmObjectBase.get<DateTime>(this, 'orderDate') as DateTime;
  @override
  set orderDate(DateTime value) =>
      RealmObjectBase.set(this, 'orderDate', value);

  @override
  String get orderNumber =>
      RealmObjectBase.get<String>(this, 'orderNumber') as String;
  @override
  set orderNumber(String value) =>
      RealmObjectBase.set(this, 'orderNumber', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

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
  double? get total => RealmObjectBase.get<double>(this, 'total') as double?;
  @override
  set total(double? value) => RealmObjectBase.set(this, 'total', value);

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
      'shift': shift.toEJson(),
      'orderDate': orderDate.toEJson(),
      'orderNumber': orderNumber.toEJson(),
      'status': status.toEJson(),
      'description': description.toEJson(),
      'orderLines': orderLines.toEJson(),
      'total': total.toEJson(),
    };
  }

  static EJsonValue _toEJson(Order value) => value.toEJson();
  static Order _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'shift': EJsonValue shift,
        'orderDate': EJsonValue orderDate,
        'orderNumber': EJsonValue orderNumber,
        'status': EJsonValue status,
        'description': EJsonValue description,
        'orderLines': EJsonValue orderLines,
        'total': EJsonValue total,
      } =>
        Order(
          fromEJson(id),
          fromEJson(shift),
          fromEJson(orderDate),
          fromEJson(orderNumber),
          fromEJson(status),
          fromEJson(description),
          orderLines: fromEJson(orderLines),
          total: fromEJson(total),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Order._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Order, 'orders', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('shift', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('orderDate', RealmPropertyType.timestamp),
      SchemaProperty('orderNumber', RealmPropertyType.string),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('orderLines', RealmPropertyType.object,
          linkTarget: 'orderLines', collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ParentOrder extends _ParentOrder
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ParentOrder(
    ObjectId id, {
    Iterable<Order> orders = const [],
    double? total = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ParentOrder>({
        'total': 0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set<RealmList<Order>>(
        this, 'orders', RealmList<Order>(orders));
    RealmObjectBase.set(this, 'total', total);
  }

  ParentOrder._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<Order> get orders =>
      RealmObjectBase.get<Order>(this, 'orders') as RealmList<Order>;
  @override
  set orders(covariant RealmList<Order> value) =>
      throw RealmUnsupportedSetError();

  @override
  double? get total => RealmObjectBase.get<double>(this, 'total') as double?;
  @override
  set total(double? value) => RealmObjectBase.set(this, 'total', value);

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
      'orders': orders.toEJson(),
      'total': total.toEJson(),
    };
  }

  static EJsonValue _toEJson(ParentOrder value) => value.toEJson();
  static ParentOrder _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'orders': EJsonValue orders,
        'total': EJsonValue total,
      } =>
        ParentOrder(
          fromEJson(id),
          orders: fromEJson(orders),
          total: fromEJson(total),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ParentOrder._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ParentOrder, 'parentOrders', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('orders', RealmPropertyType.object,
          linkTarget: 'orders', collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
