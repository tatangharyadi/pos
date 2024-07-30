import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/screens/shift/shift_list/shift_panel.dart';

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Shift'),
      ),
      body: const Row(
        children: [
          Expanded(
            flex: 2,
            child: ShiftPanel()
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
              'shift_detail/new',
            )
          );      
        },
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,          
    );
  }
}