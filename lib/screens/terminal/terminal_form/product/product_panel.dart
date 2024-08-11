import 'package:flutter/material.dart';
import 'package:pos/screens/terminal/terminal_form/product/category_bar.dart';
import 'package:pos/screens/terminal/terminal_form/product/product_grid.dart';

class ProductPanel extends StatelessWidget {
  const ProductPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryBar(),
        Expanded(
          child: ProductGrid(),
        ),
      ],
    );
  }
}