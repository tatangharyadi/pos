import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/screens/terminal/terminal_form/sku/sku_panel.dart';
import 'package:pos/screens/terminal/terminal_form/product/product_panel.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_panel.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/cart/cart_item_repository.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/cart/cart_model.dart';

class TerminalForm extends ConsumerStatefulWidget {
  final String id;

  const TerminalForm({super.key, required this.id});

  @override
  ConsumerState<TerminalForm> createState() => _TerminalFormState();
}

class _TerminalFormState extends ConsumerState<TerminalForm> {
  late ObjectId _objectId;

  ObjectId _new() {
    return ObjectId();
  }

  void _submit() {
  
  }

  @override
  void initState() {
    super.initState();
    _objectId = (widget.id != 'new') ? ObjectId.fromHexString(widget.id) : _new();
  }

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItemList = ref.watch(cartItemRepositoryProvider);
    double cartTotal = ref.watch(cartItemRepositoryProvider.notifier).sum();
    final totalDue = ref.watch(totalDueProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
      body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      children: [
                        const SkuPanel(),
                        const ProductPanel(),
                        PaymentPanel(orderId: _objectId.hexString),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CartPanel(orderId: _objectId.hexString)
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                      const Icon(Icons.paid),
                      const Gap(5),
                      const Text('Due'),
                      const Gap(5),
                      Expanded(
                        flex: 2,
                        child: Text(
                          NumberFormat.decimalPattern().format(totalDue),
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
          _submit();
          context.go(context.namedLocation('terminal'));        
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      
    );
  }
}