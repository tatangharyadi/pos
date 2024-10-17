import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_item_tab.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_payment_tab.dart';
import 'package:pos/screens/terminal/terminal_form/cart/card_member_tab.dart';

class CartPanel extends StatelessWidget {
  final String orderId;
  final String parentId;

  const CartPanel({super.key, required this.orderId, required this.parentId});

  @override
  Widget build(BuildContext context) {        
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: DefaultTabController(
              length: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.edit_note)),
                        Tab(icon: Icon(Icons.monetization_on)),
                        Tab(icon: Icon(Icons.card_membership),)
                      ]),
                    const Gap(5),
                    Expanded(
                      flex: 2,
                      child: TabBarView(
                        children: [
                          const CartItemTab(),
                          CartPaymentTab(orderId: orderId,),
                          const CartMemberTab(),    
                        ]),
                    ),
                    const Divider(),
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }
}
