import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_query_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/product/product_model.dart';

@override
class ProductDataTableSource extends DataTableSource {
  final BuildContext context;
  final WidgetRef ref;
  final RealmResults<Product> products;

  ProductDataTableSource(this.context, this.ref, this.products);

  void _onChanged(ObjectId productId, isPin1, isPin2) { 
    final productRepository = ref.read(productRepositoryProvider.notifier);
    productRepository.update(productId, isPin1, isPin2);
  }

  @override
  DataRow getRow(int index) {
    final product = products[index];
    final price = ProductUtils.getValidPriceByProduct(product);

    return DataRow(
      key: ValueKey(product.id),
      cells: [
        DataCell(Text(product.sku)),
        DataCell(Text(product.type)),
        DataCell(Text(product.name)),
        DataCell(Text(price.toString())),
        DataCell(Text(product.isTaxable ? 'Yes' : 'No')),
        DataCell(Text(product.isMto ? 'Yes' : 'No')),
        DataCell(Checkbox(
          value: product.isPin1, 
          onChanged: (value) {
            _onChanged(product.id, value!, product.isPin2);
          })),
        DataCell(Checkbox( 
          value: product.isPin2,
          onChanged: (value) {
            _onChanged(product.id, product.isPin1, value!);
          })),
      ],
      onLongPress: () {
        context.push(context.namedLocation(
            'product_detail',
            pathParameters: {
              'id': product.id.toString(),
            }
        ));
      },
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  PaginatedDataTable _buildTable(BuildContext context, WidgetRef ref,
    RealmResults<Product> products) {
    final List<Map<String, dynamic>> header = [
      {"title": "SKU", "numeric": false},
      {"title": "Type", "numeric": false},
      {"title": "Name", "numeric": false},
      {"title": "Price", "numeric": true},
      {"title": "Taxable", "numeric": false},
      {"title": "MTO", "numeric": false},
      {"title": "Pin1", "numeric": false},
      {"title": "Pin2", "numeric": false},
    ];

    return PaginatedDataTable(
      source: ProductDataTableSource(context, ref, products),
      showCheckboxColumn: true,
      showFirstLastButtons: true,
      showEmptyRows: false,
      rowsPerPage: 5,
      columns: header.map((item) {
          return DataColumn(
            label: Text(item['title']),
            numeric: item['numeric'],
          );
        }).toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(productRepositoryProvider);
    final query = ref.watch(productQueryRepositoryProvider);

    return StreamBuilder<RealmResultsChanges<Product>>(
      stream: realm.query<Product>(query.query, [query.values]).changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return Expanded(
          child: _buildTable(context, ref, results),
                );
      },
    );
  }
}