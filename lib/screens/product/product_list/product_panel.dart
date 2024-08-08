import 'package:flutter/material.dart';
import 'package:pos/screens/product/product_list/product_grid.dart';

class ProductPanel extends StatelessWidget {
  const ProductPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          Expanded(
            child: ProductGrid()
          )
        ],
    );
  }
}