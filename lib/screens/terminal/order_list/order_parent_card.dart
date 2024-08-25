import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:pos/models/order/order_model.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/screens/terminal/order_list/order_list.dart';

@override
class OrderParentCard extends ConsumerWidget {
  final ParentOrder parentOrder;

  const OrderParentCard({super.key, required this.parentOrder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRepository = ref.watch(orderRepositoryProvider.notifier);
    final orders = orderRepository.findByParentId(parentOrder.id);
    final totalOrders = orderRepository.sumByParentId(parentOrder.id);

    final paymentRepository = ref.watch(paymentRepositoryProvider.notifier);
    final totalPayments = paymentRepository.sumByParentId(parentOrder.id);
    final totalDue = totalOrders - totalPayments;

    IconData icon;
    switch (parentOrder.type) {
      case 'TAKEAWAY':
        icon = Icons.shopping_bag_outlined;
        break;
      case 'DINING':
        icon = Icons.dining_outlined;
        break;
      default:
        icon = Icons.shopping_basket_outlined;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(icon),
                const Gap(5),
                Text(
                  '[${orders.length}] ${NumberFormat.decimalPattern().format(totalOrders)}',
                    textAlign: TextAlign.end,
                ),
              ]
            ),
            const Gap(5),
            OrderList(parentOrder: parentOrder),
            const Gap(5),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text(''),
                  onPressed: () {
                    context.go(context.namedLocation(
                      'terminal_form',
                      pathParameters: {
                        'orderType':parentOrder.type,
                        'parentId':parentOrder.id.hexString,
                        'id':'new',
                      }
                    ));
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.paid),
                  label: Text(NumberFormat.decimalPattern().format(totalDue)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}