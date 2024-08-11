import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';
import 'package:pos/models/product/product_model.dart';

part 'product_repository.g.dart';

@riverpod
class ProductRepository extends _$ProductRepository {
  late Realm _realm;

  @override
  Realm build() {
    _realm = ref.watch(realmServiceProvider);
    return _realm;
  }

   Product? findById(ObjectId? id) {
    Product? product = _realm.find<Product>(id);
    return product;
  }

  double getValidPrice(Product product) {
    final now = DateTime.now().toUtc();

    const query = r'''
      priceEffectiveTime == nil && priceExpireTime == nil
      LIMIT(1)
    ''';
    const queryValid = r'''
      priceEffectiveTime <= $0 && priceExpireTime >= $0
      SORT(priceExpireTime ASC)
      LIMIT(1)
    ''';
    final basePrice = product.prices.query(query);
    final validPrices = product.prices.query(queryValid, [now]);
    double price = 0;
    if (!validPrices.isEmpty) {
      price = validPrices.first.price;
    } else if (!basePrice.isEmpty) {
      price = basePrice.first.price;
    }

    return price;
  }  
}