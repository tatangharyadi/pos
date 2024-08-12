import 'package:flutter/material.dart';
import 'package:pos/theme.dart';
import 'package:intl/intl.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_query_repository.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/cart/cart_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:pos/models/product/product_model.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_item_modifer_form.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

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
            String id = product.id.toString();
            double price = ProductUtils.getValidPrice(product);

            return GestureDetector(
              onTap: () {
                ref.read(cartRepositoryProvider.notifier).add(
                  product.sku,
                  product.name,
                  price, 
                  1);
              },
              onLongPress: () {
                showGeneralDialog(
                  context: context, 
                  pageBuilder: (_, __, ___) {
                    return CartItemModiferForm(id: id);
                  }
                );
              },
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
