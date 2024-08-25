import 'package:flutter/material.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_grid.dart';

class PaymentPanel extends StatelessWidget {
  final String orderId;
  final String parentId;
  
  const PaymentPanel({super.key, required this.orderId, required this.parentId});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PaymentGrid(orderId: orderId, parentId: parentId),
        )
      ],
    );
  }
}
