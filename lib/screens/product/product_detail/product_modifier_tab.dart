import 'package:flutter/material.dart';
import 'package:pos/components/modifier_card/modifier_card.dart';
import 'package:pos/models/product/product_model.dart';
import 'package:pos/models/product/product_utils.dart';

class ProductModifierTab extends StatelessWidget {
  final Product product;
  const ProductModifierTab({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<BaseModifierCard> modifierCards = [];
    for (var modifierCollection in product.modifierCollections) {
      modifierCards.add(ModifierCollectionCard(modifierCollection.name, modifierCollection.min, modifierCollection.max));
      for (var modifier in modifierCollection.modifiers) {
        final price = ProductUtils.getValidPriceByModifier(modifier);
        modifierCards.add(ModifierCard(modifier.name, price));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: modifierCards.length,
              itemBuilder: (context, index) {
                return modifierCards[index].build(context);
              }),
          )
        ],
      ),
    );
  }
}