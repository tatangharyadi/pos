import 'package:flutter/material.dart';
import 'package:pos/theme.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/order/order_model.dart';

@override
class OrderLineList extends ConsumerWidget {
  final String parentId;
  final String status;

  const OrderLineList({super.key, required this.parentId, required this.status});

  void _updateOrderLineStatus(WidgetRef ref, OrderLine orderLine, String status) {
    String nextStatus;
    switch (status) {
      case 'NEW':
        nextStatus = 'PREPARING';
        break;
      case 'PREPARING':
        nextStatus = 'READY';
        break;
      default:
        nextStatus = 'NEW';
        break;
    }

    final orderRepository = ref.read(orderRepositoryProvider.notifier);
    orderRepository.updateOrderLineStatus(orderLine.id, nextStatus);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const query = r'''
      parentId == $0 &&
      status ==[c] $1
    ''';

    final realm = ref.watch(orderRepositoryProvider);
    final List<Object> queryParameters = [ObjectId.fromHexString(parentId), status];

    return StreamBuilder<RealmResultsChanges<OrderLine>>(
      stream: realm.query<OrderLine>(query, [...queryParameters]).changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            OrderLine orderLine = results[index];
            final modifiers = orderLine.modifiers.fold("", (previousValue, element) =>
              '$previousValue ${element.name},');
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    _updateOrderLineStatus(ref, orderLine, status);
                  },
                  child:
                    ListTile(
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: listTileBackground,
                      title: Text(orderLine.name),
                      subtitle: Text(modifiers),
                    ),
                ),
                 const Gap(5),
              ],
            );
          },
        );
      }
    );
  }
}