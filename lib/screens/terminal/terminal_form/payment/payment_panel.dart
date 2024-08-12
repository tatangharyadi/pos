import 'package:flutter/material.dart';

class PaymentPanel extends StatelessWidget {
  const PaymentPanel({super.key});

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
