import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_model.dart';

class CheckboxModifierCard extends ConsumerStatefulWidget {
  final ModifierCollection modifierCollection; 

  const CheckboxModifierCard({super.key, required this.modifierCollection});

  @override
  ConsumerState<CheckboxModifierCard> createState() => _CheckboxModifierCardState();
}

class _CheckboxModifierCardState extends ConsumerState<CheckboxModifierCard> {
  late List<Modifier> _modifiers;
  late List<bool> selectedModifiers;

  @override
  void initState() {
    super.initState();
    _modifiers = widget.modifierCollection.modifiers;
    selectedModifiers = List.generate(_modifiers.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {  
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.modifierCollection.name),
            const Gap(5),
            SizedBox(
              height: 300,
              width: 500,
              child: ListView.builder(
                itemCount: _modifiers.length,
                itemBuilder: (context, index) {
                  final modifier = _modifiers[index];
                  double price = 0;
                  if (modifier.prices.isNotEmpty) {
                    price = modifier.prices.first.price;
                  }
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Row(
                      children: [
                        Text(modifier.name),
                        const Gap(5),
                        Text(price.toString()),
                      ],
                    ),
                    value: selectedModifiers[index], 
                    onChanged: (value) {
                      setState(() {
                        selectedModifiers[index] = value!;
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