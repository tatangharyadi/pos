import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_item_tab.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_payment_tab.dart';

class CartPanel extends ConsumerWidget {
  const CartPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {        
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: const DefaultTabController(
              length: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.edit_note)),
                        Tab(icon: Icon(Icons.monetization_on)),
                      ]),
                    Gap(5),
                    Expanded(
                      flex: 2,
                      child: TabBarView(
                        children: [
                          CartItemTab(),
                          CartPaymentTab(),    
                        ]),
                    ),
                    Divider(),
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }
}
