import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/models/cart/cart_model.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_panel.dart';
import 'package:pos/screens/terminal/terminal_form/product/product_panel.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/cart/cart_item_repository.dart';

class TerminalForm extends ConsumerWidget {
  final String id;

  const TerminalForm({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CartItem> cartItemList = ref.watch(cartItemRepositoryProvider);
    double cartTotal = ref.watch(cartItemRepositoryProvider.notifier).sum();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      children: const [
                        ProductPanel(),
                        PaymentPanel(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: CartPanel()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // context.push(context.namedLocation('paymentform'));        
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      
    );
  }
}