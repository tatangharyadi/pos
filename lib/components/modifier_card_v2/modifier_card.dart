import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/models/product/product_model.dart';

abstract class ModifierCard {
  Widget build(BuildContext context);
}

class RadioButtonModifierCard implements ModifierCard {
  final String name;
  final double price;

  RadioButtonModifierCard(this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Radio(value: null, groupValue: null, onChanged: null),
        Text(name),
        const Gap(5),
        Text(price.toString()),
      ],
    );
  }
}

class CheckBoxModifierCard implements ModifierCard {
  final String name;
  final double price;

  CheckBoxModifierCard(this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox(value: false, onChanged: null),
        Text(name),
        const Gap(5),
        Text(price.toString()),
      ],
    );
  }
}

class CollectionModifierCard implements ModifierCard {
  final String name;
  final int min;
  final int max;

  CollectionModifierCard(this.name, this.min, this.max);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$name [$min - $max]'),
      ],
    );
  }
}

class ModifierCollectionCard {
  final ModifierCollection modifierCollection;
  List<ModifierCard> modifierCards = [];

  ModifierCollectionCard(this.modifierCollection);

  Widget build(BuildContext context) {
    modifierCards.add(CollectionModifierCard(modifierCollection.name, modifierCollection.min, modifierCollection.max));
    for (var modifier in modifierCollection.modifiers) {
      double price = 0;
      if (modifier.prices.isNotEmpty) {
        price = modifier.prices.first.price;
      }
      modifierCards.add(RadioButtonModifierCard(modifier.name, price));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: modifierCards.length,
        itemBuilder: (context, index) {
          return modifierCards[index].build(context);
        }
      ),
    );
  }
}