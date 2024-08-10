import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/models/product/product_model.dart';

abstract class ModifierCard {
  Widget build(BuildContext context);
}

class ModifierCollection implements ModifierCard {
  final String name;
  final int min;
  final int max;

  ModifierCollection(this.name, this.min, this.max);

  @override
  Widget build(BuildContext context) {
    return Text('$name [$min - $max]');
  }
}

class Modifier implements ModifierCard {
  final String name;
  final double price;

  Modifier(this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: Text(name)),
        const Gap(5),
        SizedBox(
          width: 100,
          child: Text(
            price.toString(),
            textAlign: TextAlign.right),
        ),
      ],
    );
  }
}

Padding productModifierView(Product product) {
  List<ModifierCard> modifierCards = [];
  for (var modifierCollection in product.modifierCollections) {
    modifierCards.add(ModifierCollection(modifierCollection.name, modifierCollection.min, modifierCollection.max));
    for (var modifier in modifierCollection.modifiers) {
      double price = 0;
      if (modifier.prices.isNotEmpty) {
        price = modifier.prices.first.price;
      }
      modifierCards.add(Modifier(modifier.name, price));
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
