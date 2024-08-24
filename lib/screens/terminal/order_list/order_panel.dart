import 'package:flutter/material.dart';
import 'package:pos/screens/terminal/order_list/order_parent_grid.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          Expanded(
            child: OrderParentGrid()
          )
        ],
    );
  }
}