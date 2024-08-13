import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_model.dart';

class RadioModifierCard extends ConsumerStatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final ModifierCollection modifierCollection;

  const RadioModifierCard({super.key, required this.formKey, required this.modifierCollection});

  @override
  ConsumerState<RadioModifierCard> createState() => _RadioModifierCardState();
}

class _RadioModifierCardState extends ConsumerState<RadioModifierCard> {
  late List<Modifier> _modifiers;

  @override
  void initState() {
    super.initState();
    _modifiers = widget.modifierCollection.modifiers;
  }

  @override
  Widget build(BuildContext context) {
    List<FormBuilderChipOption> options = [];

    for (var modifier in _modifiers) {
      double price = 0;
      if (modifier.prices.isNotEmpty) {
        price = modifier.prices.first.price;
      }
      options.add(FormBuilderChipOption(
        value: modifier.name,
        child: Text('${modifier.name} (+${price.toStringAsFixed(0)})'),
      ));
    }

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: FormBuilderChoiceChip(
                name: widget.modifierCollection.name,
                decoration: InputDecoration(
                  labelText: widget.modifierCollection.name,
                ),
                options: options,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}