import 'package:flutter/material.dart';
import 'package:pos/components/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/order/order_model.dart';

@override
class OrderList extends ConsumerWidget {
  final ParentOrder parentOrder;

  const OrderList({super.key, required this.parentOrder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const query = r'''
      parentId == $0
    ''';

    final List<Object> queryParameters = [parentOrder.id];
    Realm realm = ref.watch(orderRepositoryProvider);

    return StreamBuilder<RealmResultsChanges<Order>>(
      stream: realm.query<Order>(query, [queryParameters]).changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return Expanded(
          child: ListView.builder(
            itemCount: results.realm.isClosed ? 0 :  results.length,
            itemBuilder: (context, index) {
              if (results[index].isValid) {
                Order order = results[index];

                IconData icon;
                switch (order.status) {
                  case 'NEW':
                    icon = Icons.pending_outlined;
                  case 'PREPARING':
                    icon = Icons.run_circle_outlined;
                  case 'READY':
                    icon = Icons.check_circle_outline;
                  default:
                    icon = Icons.pending_outlined;
                }

                return ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                  leading: Icon(icon),
                  title: Text(DateFormat('dd MMM - HH:mm').format(order.orderDate.toLocal())),
                );
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}