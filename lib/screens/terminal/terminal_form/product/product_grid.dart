import 'package:flutter/material.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:pos/theme.dart';
import 'package:intl/intl.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/category/category_query_repository.dart';
import 'package:pos/models/product/product_query_repository.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/product/product_model.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  double _getPrice(Product product) {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const query = r'''
      sku LIKE[c] $0 ||
      name LIKE[c] $0
    ''';

    Realm realm = ref.watch(productRepositoryProvider);
    String queryParameter = ref.watch(productQueryRepositoryProvider);
    queryParameter = '*';

    return StreamBuilder<RealmResultsChanges<Product>>(
      stream: realm.query<Product>(query, [queryParameter]).changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemCount: results.length,
          itemBuilder: (context, index) {
            Product product = results[index];
            double price = ProductUtils.getValidPrice(product);
            late IconData icon;

            return GestureDetector(
              onTap: () {},
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: tileBackground,
                  title: Text(
                    product.name,
                    maxLines: 2,
                    softWrap: true,
                  ),
                  subtitle: Text(NumberFormat.compact().format(price)),
                ),
                child: Image.network(
                  product.image ?? 'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        );
      },
    );
  }
}
