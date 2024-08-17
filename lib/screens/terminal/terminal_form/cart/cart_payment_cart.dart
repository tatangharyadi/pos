import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/payment/payment_model.dart';

class CartPaymentCard extends StatelessWidget {
  final Payment cartPayment;

  const CartPaymentCard(this.cartPayment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartPayment.type,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Divider(),
            Text(NumberFormat.decimalPattern().format(cartPayment.amount)),
          ],
        ),
        const Gap(10),
      ],
    ); 
  }
}
