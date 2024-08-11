import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

abstract class BaseModifierCard {
  Widget build(BuildContext context);
}

class ModifierCollectionCard implements BaseModifierCard {
  final String name;
  final int min;
  final int max;

  ModifierCollectionCard(this.name, this.min, this.max);

  @override
  Widget build(BuildContext context) {
    return Text('$name [$min - $max]');
  }
}

class ModifierCard implements BaseModifierCard {
  final String name;
  final double price;

  ModifierCard(this.name, this.price);

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
