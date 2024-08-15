import 'package:flutter/material.dart';

class PaymentPanel extends StatelessWidget {
  final String orderId;
  const PaymentPanel({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(8.0),
      child: Center(
          child:
           Text('Payment'),
        ),
    );
  }
}
