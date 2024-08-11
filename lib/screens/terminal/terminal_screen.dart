import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/screens/terminal/order_list/order_panel.dart';

class TerminalScreen extends StatelessWidget {
  const TerminalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: const Row(
        children: [
          Expanded(
            child: OrderPanel()
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
            context.go(context.namedLocation(
                'terminal_form',
                pathParameters: {
                  'id':'new',
                }
            )
          );      
        },
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,          
    );
  }
}
 