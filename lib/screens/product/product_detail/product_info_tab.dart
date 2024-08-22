import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/models/product/product_model.dart';

class ProductInfoTab extends StatelessWidget {
  final Product product;
  const ProductInfoTab({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300,
              maxWidth: 300,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,  ),
            ),
          ),
          const Gap(8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.sku),
              const Gap(5),
              Text(
                product.barcode,
                style: const TextStyle(
                  fontFamily: 'LibreBarcode128Text',
                  fontSize: 35,
                )
              ),
              const Gap(5),
              Text(product.description ?? ''),
            ],
          ),
        ],
      ),
    );
  }
}