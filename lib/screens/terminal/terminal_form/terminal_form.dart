import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_panel.dart';
import 'package:pos/screens/terminal/terminal_form/product/product_panel.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_panel.dart';

class TerminalForm extends StatelessWidget {
  final String id;

  const TerminalForm({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: PageView(
              children: const [
                ProductPanel(),
                PaymentPanel()
              ]
            ),
          ),
          const Expanded( 
            child: CartPanel(),
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