import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_model.dart';

class RadioModifierCard extends ConsumerStatefulWidget {
  final ModifierCollection modifierCollection;

  const RadioModifierCard({super.key, required this.modifierCollection});

  @override
  ConsumerState<RadioModifierCard> createState() => _RadioModifierCardState();
}

class _RadioModifierCardState extends ConsumerState<RadioModifierCard> {
  String _selectedModifier = '';

  @override
  Widget build(BuildContext context) {
    final modifiers = widget.modifierCollection.modifiers;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.modifierCollection.name),
            const Gap(5),
            SizedBox(
              height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: modifiers.length,
                itemBuilder: (context, index) {
                  final modifier = modifiers[index];
                  double price = 0;
                  if (modifier.prices.isNotEmpty) {
                    price = modifier.prices.first.price;
                  }
                  return RadioListTile(
                    title: Row(
                      children: [
                        Text(modifier.name),
                        const Gap(5),
                        Text(price.toString()),
                      ],
                    ),
                    value: modifier.name, 
                    groupValue: _selectedModifier, 
                    onChanged: (value) {
                      setState(() {
                        _selectedModifier = modifier.name;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}