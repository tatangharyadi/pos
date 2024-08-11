import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/cart/cart_item_model.dart';
import 'package:pos/models/cart/cart_repository.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_item_tab.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_payment_tab.dart';

class CartPanel extends ConsumerWidget {
  const CartPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CartItem> cartItemList = ref.watch(cartRepositoryProvider);
    double cartTotal = ref.watch(cartRepositoryProvider.notifier).sum();
        
    return Container(
      padding: const EdgeInsets.all(10),
      child: DefaultTabController(
        length: 2,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.edit_note)),
                  Tab(icon: Icon(Icons.monetization_on)),
                ]),
              const Gap(5),
              const Expanded(
                flex: 2,
                child: TabBarView(
                  children: [
                    CartItemTab(),
                    CartPaymentTab(),    
                  ]),
              ),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.shopping_cart),
                  const Gap(5),
                  Text('${cartItemList.length} items'),
                  const Gap(5),
                  Expanded(
                    flex: 2,
                    child: Text(
                      NumberFormat.decimalPattern().format(cartTotal),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ]
              ),
            ],
          ),
      ),
    );
  }
}
