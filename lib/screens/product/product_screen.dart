import 'package:flutter/material.dart';
import 'package:pos/screens/product/product_list/product_panel.dart';
import 'package:pos/screens/product/product_navbar.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ProductNavBar(),
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: const ProductPanel(),
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