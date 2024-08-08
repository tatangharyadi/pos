import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/product/product_model.dart';

@override
class ProductDataTableSource extends DataTableSource {
  final RealmResults<Product> products;

  ProductDataTableSource(this.products);

  @override
  DataRow getRow(int index) {
    final product = products[index];
    return DataRow(
      cells: [
        DataCell(Text(product.sku)),
        DataCell(Text(product.type)),
        DataCell(Text(product.name)),
        DataCell(Text(product.prices.first.price.toString())),
      ],
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

  PaginatedDataTable _buildTable(RealmResults<Product> products) {
    final List<Map<String, dynamic>> header = [
      {"title": "SKU", "numeric": false},
      {"title": "Type", "numeric": false},
      {"title": "Name", "numeric": false},
      {"title": "Price", "numeric": true},
    ];

    return PaginatedDataTable(
      source: ProductDataTableSource(products),
      showCheckboxColumn: true,
      rowsPerPage: 6,
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

    return StreamBuilder<RealmResultsChanges<Product>>(
      stream: realm.query<Product>("TRUEPREDICATE SORT(_id ASC)")
          .changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return Expanded(
          child: _buildTable(results),
                );
      },
    );
  }
}