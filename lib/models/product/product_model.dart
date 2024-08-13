import 'package:realm/realm.dart';

part 'product_model.realm.dart';

@RealmModel()
@MapTo("prices")
class _Price {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late String currencyCode;
  late double price = 0.0;
  late DateTime? priceEffectiveTime;
  late DateTime? priceExpireTime;

  @Backlink(#prices)
  late Iterable<_Product> linkedProduct;
  @Backlink(#prices)
  late Iterable<_Modifier> linkedModifier;
}

@RealmModel()
@MapTo("modifiers")
class _Modifier {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String? sku;
  late String type;
  @Indexed()
  late String name;
  late String? description;
  late List<_Price> prices;
}

@RealmModel()
@MapTo("modifierCollections")
class _ModifierCollection {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String name;
  late int min;
  late int max;
  late List<_Modifier> modifiers;
}

@RealmModel()
@MapTo("products")
class _Product {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String sku;
  late String type;
  @Indexed()
  late String name;
  late String? description;
  late String? image;
  late double? cost;
  @Backlink(#products)
  late Iterable<_Brand> linkedBrand;
  late List<_ModifierCollection> modifierCollections;
  late List<_Price> prices;

  late bool selected = false;
}

@RealmModel()
@MapTo("brands")
class _Brand {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String name;
  late String? description;
  late String? image;
  late List<_Product> products;
}

@RealmModel()
@MapTo("categories")
class _Category {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String name;
  late int sequence;
  late List<_Product> products;
}




