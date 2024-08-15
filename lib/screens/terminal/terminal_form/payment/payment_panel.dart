import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_grid.dart';

class PaymentPanel extends ConsumerStatefulWidget {
  final String orderId;
  
  const PaymentPanel({super.key, required this.orderId});
  
  @override
  ConsumerState<PaymentPanel> createState() => _PaymentPanelState();
}

class _PaymentPanelState extends ConsumerState<PaymentPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PaymentGrid(orderId: widget.orderId,)
        )
      ],
    );
  }
}
