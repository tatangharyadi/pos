import 'package:realm/realm.dart';

part 'product_model.realm.dart';

@RealmModel()
@MapTo("prices")
class _Price {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String currencyCode;
  late double price;
  late DateTime? priceEffectiveTime;
  late DateTime? priceExpireTime;
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
  late List<_Product> productRelations;
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
  late String description;
  late String image;
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




