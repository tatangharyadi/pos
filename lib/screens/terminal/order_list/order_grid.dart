import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/screens/terminal/order_list/order_line_list.dart';

@override
class OrderGrid extends StatelessWidget {
  final String parentId;

  const OrderGrid({super.key, required this.parentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parentId),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Icon(Icons.pending_outlined),
                    const Gap(5),
                    Expanded(
                      child: OrderLineList(parentId:  parentId, status: 'NEW')
                    ),
                  ],
                ),
              ),
            ),
            const Gap(5),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Icon(Icons.run_circle_outlined),
                    const Gap(5),
                    Expanded(
                      child: OrderLineList(parentId:  parentId, status: 'PREPARING')
                    ),
                  ],
                ),
              ),
            ),
            const Gap(5),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle_outline),
                    const Gap(5),
                    Expanded(
                      child: OrderLineList(parentId:  parentId, status: 'READY')
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {     
        },    
        child: const Icon(Icons.refresh),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}