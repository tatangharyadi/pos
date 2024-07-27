import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: const Center(
        child: Text(
          'Product Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}