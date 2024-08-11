import 'package:pos/models/product/product_model.dart';
import 'package:realm/realm.dart';

class ProductUtils {
  ProductUtils._();

  static double getValidPrice (Product product) {
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