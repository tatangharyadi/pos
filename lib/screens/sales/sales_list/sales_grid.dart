import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/order/order_model.dart';

@override
class SalesDataTableSource extends DataTableSource {
  final BuildContext context;
  final WidgetRef ref;
  final RealmResults<Order> orders;

  SalesDataTableSource(this.context, this.ref, this.orders);

  @override
  DataRow getRow(int index) {
    final order = orders[index];
    final localDate = order.orderDate.toLocal();
    final orderDate = 
      '${localDate.year}-${localDate.month.toString().padLeft(2, '0')}-${localDate.day.toString().padLeft(2, '0')}';

    return DataRow(
      key: ValueKey(order.id),
      cells: [
        DataCell(Text(order.orderNumber)),
        DataCell(Text(orderDate)),
        DataCell(Text(order.total.toString())),
        DataCell(Text(order.status)),      
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}

class SalesGrid extends ConsumerWidget {
  const SalesGrid({super.key});

  PaginatedDataTable _buildTable(BuildContext context, WidgetRef ref,
    RealmResults<Order> orders) {
    final List<Map<String, dynamic>> header = [
      {"title": "Order", "numeric": false},
      {"title": "Date", "numeric": false},
      {"title": "Total", "numeric": true},
      {"title": "Status", "numeric": false},
    ];

    return PaginatedDataTable(
      source: SalesDataTableSource(context, ref, orders),
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
    Realm realm = ref.watch(orderRepositoryProvider);
    const query = 'status == "DONE"';

    return StreamBuilder<RealmResultsChanges<Order>>(
      stream: realm.query<Order>(query).changes,
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