import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:pos/models/order/order_model.dart';
import 'package:pos/models/payment/payment_repository.dart';

@override
class OrderCard extends ConsumerWidget {
  final ParentOrder parentOrder;

  const OrderCard({super.key, required this.parentOrder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRepository = ref.watch(orderRepositoryProvider.notifier);
    final orders = orderRepository.findByParentId(parentOrder.id);
    final totalOrders = orderRepository.sumByParentId(parentOrder.id);

    final paymentRepository = ref.watch(paymentRepositoryProvider.notifier);
    final totalPayments = paymentRepository.sumByParentId(parentOrder.id);
    final totalDue = totalOrders - totalPayments;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(parentOrder.id.hexString),
            const Gap(5),
            Expanded(
              child: ListView(
                children: orders.map((item) {
                  return ListTile(
                    title: Text(DateFormat('dd, MMM - HH:mm').format(item.orderDate.toLocal())),
                    subtitle: Text(item.status),
                  );
                }).toList(),
              ),
            ),
            const Gap(5),
            Row(
              children: [
              const Icon(Icons.shopping_cart),
              const Gap(5),
              Expanded(
                flex: 2,
                child: Text(
                  NumberFormat.decimalPattern().format(totalOrders),
                    textAlign: TextAlign.end,
                  ),
                ),
              ]
            ),
            const Gap(5),
            Row(
              children: [
              const Icon(Icons.paid),
              const Gap(5),
              Expanded(
                flex: 2,
                child: Text(
                  NumberFormat.decimalPattern().format(totalDue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ]
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                  },
                  child: const Icon(Icons.shopping_cart),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: const Icon(Icons.paid),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}