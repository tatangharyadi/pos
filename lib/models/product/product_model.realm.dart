// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Price extends _Price with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Price(
    ObjectId id,
    String currencyCode, {
    double price = 0.0,
    DateTime? priceEffectiveTime,
    DateTime? priceExpireTime,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Price>({
        'price': 0.0,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'currencyCode', currencyCode);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'priceEffectiveTime', priceEffectiveTime);
    RealmObjectBase.set(this, 'priceExpireTime', priceExpireTime);
  }

  Price._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get currencyCode =>
      RealmObjectBase.get<String>(this, 'currencyCode') as String;
  @override
  set currencyCode(String value) =>
      RealmObjectBase.set(this, 'currencyCode', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  DateTime? get priceEffectiveTime =>
      RealmObjectBase.get<DateTime>(this, 'priceEffectiveTime') as DateTime?;
  @override
  set priceEffectiveTime(DateTime? value) =>
      RealmObjectBase.set(this, 'priceEffectiveTime', value);

  @override
  DateTime? get priceExpireTime =>
      RealmObjectBase.get<DateTime>(this, 'priceExpireTime') as DateTime?;
  @override
  set priceExpireTime(DateTime? value) =>
      RealmObjectBase.set(this, 'priceExpireTime', value);

  @override
  RealmResults<Product> get linkedProduct {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Product>(this, 'linkedProduct')
        as RealmResults<Product>;
  }

  @override
  set linkedProduct(covariant RealmResults<Product> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmResults<Modifier> get linkedModifier {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Modifier>(this, 'linkedModifier')
        as RealmResults<Modifier>;
  }

  @override
  set linkedModifier(covariant RealmResults<Modifier> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Price>> get changes =>
      RealmObjectBase.getChanges<Price>(this);

  @override
  Stream<RealmObjectChanges<Price>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Price>(this, keyPaths);

  @override
  Price freeze() => RealmObjectBase.freezeObject<Price>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'currencyCode': currencyCode.toEJson(),
      'price': price.toEJson(),
      'priceEffectiveTime': priceEffectiveTime.toEJson(),
      'priceExpireTime': priceExpireTime.toEJson(),
    };
  }

  static EJsonValue _toEJson(Price value) => value.toEJson();
  static Price _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'currencyCode': EJsonValue currencyCode,
        'price': EJsonValue price,
        'priceEffectiveTime': EJsonValue priceEffectiveTime,
        'priceExpireTime': EJsonValue priceExpireTime,
      } =>
        Price(
          fromEJson(id),
          fromEJson(currencyCode),
          price: fromEJson(price),
          priceEffectiveTime: fromEJson(priceEffectiveTime),
          priceExpireTime: fromEJson(priceExpireTime),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Price._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Price, 'prices', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('currencyCode', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('priceEffectiveTime', RealmPropertyType.timestamp,
          optional: true),
      SchemaProperty('priceExpireTime', RealmPropertyType.timestamp,
          optional: true),
      SchemaProperty('linkedProduct', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'prices',
          collectionType: RealmCollectionType.list,
          linkTarget: 'products'),
      SchemaProperty('linkedModifier', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'prices',
          collectionType: RealmCollectionType.list,
          linkTarget: 'modifiers'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Modifier extends _Modifier
    with RealmEntity, RealmObjectBase, RealmObject {
  Modifier(
    ObjectId id,
    String type,
    String name, {
    String? sku,
    String? description,
    Iterable<Price> prices = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<Price>>(
        this, 'prices', RealmList<Price>(prices));
  }

  Modifier._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get sku => RealmObjectBase.get<String>(this, 'sku') as String?;
  @override
  set sku(String? value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<Price> get prices =>
      RealmObjectBase.get<Price>(this, 'prices') as RealmList<Price>;
  @override
  set prices(covariant RealmList<Price> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Modifier>> get changes =>
      RealmObjectBase.getChanges<Modifier>(this);

  @override
  Stream<RealmObjectChanges<Modifier>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Modifier>(this, keyPaths);

  @override
  Modifier freeze() => RealmObjectBase.freezeObject<Modifier>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'sku': sku.toEJson(),
      'type': type.toEJson(),
      'name': name.toEJson(),
      'description': description.toEJson(),
      'prices': prices.toEJson(),
    };
  }

  static EJsonValue _toEJson(Modifier value) => value.toEJson();
  static Modifier _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'sku': EJsonValue sku,
        'type': EJsonValue type,
        'name': EJsonValue name,
        'description': EJsonValue description,
        'prices': EJsonValue prices,
      } =>
        Modifier(
          fromEJson(id),
          fromEJson(type),
          fromEJson(name),
          sku: fromEJson(sku),
          description: fromEJson(description),
          prices: fromEJson(prices),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Modifier._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Modifier, 'modifiers', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.regular),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('prices', RealmPropertyType.object,
          linkTarget: 'prices', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class ModifierCollection extends _ModifierCollection
    with RealmEntity, RealmObjectBase, RealmObject {
  ModifierCollection(
    ObjectId id,
    String name,
    int min,
    int max, {
    Iterable<Modifier> modifiers = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'min', min);
    RealmObjectBase.set(this, 'max', max);
    RealmObjectBase.set<RealmList<Modifier>>(
        this, 'modifiers', RealmList<Modifier>(modifiers));
  }

  ModifierCollection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get min => RealmObjectBase.get<int>(this, 'min') as int;
  @override
  set min(int value) => RealmObjectBase.set(this, 'min', value);

  @override
  int get max => RealmObjectBase.get<int>(this, 'max') as int;
  @override
  set max(int value) => RealmObjectBase.set(this, 'max', value);

  @override
  RealmList<Modifier> get modifiers =>
      RealmObjectBase.get<Modifier>(this, 'modifiers') as RealmList<Modifier>;
  @override
  set modifiers(covariant RealmList<Modifier> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ModifierCollection>> get changes =>
      RealmObjectBase.getChanges<ModifierCollection>(this);

  @override
  Stream<RealmObjectChanges<ModifierCollection>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ModifierCollection>(this, keyPaths);

  @override
  ModifierCollection freeze() =>
      RealmObjectBase.freezeObject<ModifierCollection>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'min': min.toEJson(),
      'max': max.toEJson(),
      'modifiers': modifiers.toEJson(),
    };
  }

  static EJsonValue _toEJson(ModifierCollection value) => value.toEJson();
  static ModifierCollection _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'min': EJsonValue min,
        'max': EJsonValue max,
        'modifiers': EJsonValue modifiers,
      } =>
        ModifierCollection(
          fromEJson(id),
          fromEJson(name),
          fromEJson(min),
          fromEJson(max),
          modifiers: fromEJson(modifiers),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ModifierCollection._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ModifierCollection, 'modifierCollections', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('min', RealmPropertyType.int),
      SchemaProperty('max', RealmPropertyType.int),
      SchemaProperty('modifiers', RealmPropertyType.object,
          linkTarget: 'modifiers', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Product(
    ObjectId id,
    String sku,
    String type,
    String name, {
    String? description,
    String? image,
    double? cost,
    Iterable<ModifierCollection> modifierCollections = const [],
    Iterable<Price> prices = const [],
    bool selected = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Product>({
        'selected': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'cost', cost);
    RealmObjectBase.set<RealmList<ModifierCollection>>(
        this,
        'modifierCollections',
        RealmList<ModifierCollection>(modifierCollections));
    RealmObjectBase.set<RealmList<Price>>(
        this, 'prices', RealmList<Price>(prices));
    RealmObjectBase.set(this, 'selected', selected);
  }

  Product._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  double? get cost => RealmObjectBase.get<double>(this, 'cost') as double?;
  @override
  set cost(double? value) => RealmObjectBase.set(this, 'cost', value);

  @override
  RealmList<ModifierCollection> get modifierCollections =>
      RealmObjectBase.get<ModifierCollection>(this, 'modifierCollections')
          as RealmList<ModifierCollection>;
  @override
  set modifierCollections(covariant RealmList<ModifierCollection> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Price> get prices =>
      RealmObjectBase.get<Price>(this, 'prices') as RealmList<Price>;
  @override
  set prices(covariant RealmList<Price> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get selected => RealmObjectBase.get<bool>(this, 'selected') as bool;
  @override
  set selected(bool value) => RealmObjectBase.set(this, 'selected', value);

  @override
  RealmResults<Brand> get linkedBrand {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Brand>(this, 'linkedBrand')
        as RealmResults<Brand>;
  }

  @override
  set linkedBrand(covariant RealmResults<Brand> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObjectBase.getChanges<Product>(this);

  @override
  Stream<RealmObjectChanges<Product>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Product>(this, keyPaths);

  @override
  Product freeze() => RealmObjectBase.freezeObject<Product>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'sku': sku.toEJson(),
      'type': type.toEJson(),
      'name': name.toEJson(),
      'description': description.toEJson(),
      'image': image.toEJson(),
      'cost': cost.toEJson(),
      'modifierCollections': modifierCollections.toEJson(),
      'prices': prices.toEJson(),
      'selected': selected.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'sku': EJsonValue sku,
        'type': EJsonValue type,
        'name': EJsonValue name,
        'description': EJsonValue description,
        'image': EJsonValue image,
        'cost': EJsonValue cost,
        'modifierCollections': EJsonValue modifierCollections,
        'prices': EJsonValue prices,
        'selected': EJsonValue selected,
      } =>
        Product(
          fromEJson(id),
          fromEJson(sku),
          fromEJson(type),
          fromEJson(name),
          description: fromEJson(description),
          image: fromEJson(image),
          cost: fromEJson(cost),
          modifierCollections: fromEJson(modifierCollections),
          prices: fromEJson(prices),
          selected: fromEJson(selected),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Product, 'products', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
      SchemaProperty('cost', RealmPropertyType.double, optional: true),
      SchemaProperty('modifierCollections', RealmPropertyType.object,
          linkTarget: 'modifierCollections',
          collectionType: RealmCollectionType.list),
      SchemaProperty('prices', RealmPropertyType.object,
          linkTarget: 'prices', collectionType: RealmCollectionType.list),
      SchemaProperty('selected', RealmPropertyType.bool),
      SchemaProperty('linkedBrand', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'products',
          collectionType: RealmCollectionType.list,
          linkTarget: 'brands'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Brand extends _Brand with RealmEntity, RealmObjectBase, RealmObject {
  Brand(
    ObjectId id,
    String name, {
    String? description,
    String? image,
    Iterable<Product> products = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set<RealmList<Product>>(
        this, 'products', RealmList<Product>(products));
  }

  Brand._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  RealmList<Product> get products =>
      RealmObjectBase.get<Product>(this, 'products') as RealmList<Product>;
  @override
  set products(covariant RealmList<Product> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Brand>> get changes =>
      RealmObjectBase.getChanges<Brand>(this);

  @override
  Stream<RealmObjectChanges<Brand>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Brand>(this, keyPaths);

  @override
  Brand freeze() => RealmObjectBase.freezeObject<Brand>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'description': description.toEJson(),
      'image': image.toEJson(),
      'products': products.toEJson(),
    };
  }

  static EJsonValue _toEJson(Brand value) => value.toEJson();
  static Brand _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'description': EJsonValue description,
        'image': EJsonValue image,
        'products': EJsonValue products,
      } =>
        Brand(
          fromEJson(id),
          fromEJson(name),
          description: fromEJson(description),
          image: fromEJson(image),
          products: fromEJson(products),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Brand._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Brand, 'brands', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
      SchemaProperty('products', RealmPropertyType.object,
          linkTarget: 'products', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String name,
    int sequence, {
    Iterable<Product> products = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'sequence', sequence);
    RealmObjectBase.set<RealmList<Product>>(
        this, 'products', RealmList<Product>(products));
  }

  Category._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get sequence => RealmObjectBase.get<int>(this, 'sequence') as int;
  @override
  set sequence(int value) => RealmObjectBase.set(this, 'sequence', value);

  @override
  RealmList<Product> get products =>
      RealmObjectBase.get<Product>(this, 'products') as RealmList<Product>;
  @override
  set products(covariant RealmList<Product> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Stream<RealmObjectChanges<Category>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Category>(this, keyPaths);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'sequence': sequence.toEJson(),
      'products': products.toEJson(),
    };
  }

  static EJsonValue _toEJson(Category value) => value.toEJson();
  static Category _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'sequence': EJsonValue sequence,
        'products': EJsonValue products,
      } =>
        Category(
          fromEJson(id),
          fromEJson(name),
          fromEJson(sequence),
          products: fromEJson(products),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Category._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Category, 'categories', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('sequence', RealmPropertyType.int),
      SchemaProperty('products', RealmPropertyType.object,
          linkTarget: 'products', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
