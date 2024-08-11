import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/cart/cart_item_model.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard(this.cartItem, {super.key});

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
                  Text(cartItem.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('x${cartItem.qty} @${NumberFormat.decimalPattern().format(cartItem.unitPrice)}'),
                ],
              ),
            ),
            const Divider(),
            Text(NumberFormat.decimalPattern().format(cartItem.unitPrice * cartItem.qty)),
          ],
        ),
        const Gap(10),
      ],
    ); 
  }
}
