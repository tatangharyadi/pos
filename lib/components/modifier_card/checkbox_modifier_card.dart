import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_model.dart';
import 'package:pos/models/product/product_utils.dart';

class CheckboxModifierCard extends ConsumerStatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Function onChanged;
  final ModifierCollection modifierCollection; 
  final List<String> initialValue;

  const CheckboxModifierCard({super.key, required this.formKey,
    required this.onChanged, required this.modifierCollection, required this.initialValue});

  @override
  ConsumerState<CheckboxModifierCard> createState() => _CheckboxModifierCardState();
}

class _CheckboxModifierCardState extends ConsumerState<CheckboxModifierCard> {
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
      final price = ProductUtils.getValidPriceByModifier(modifier);
      options.add(FormBuilderChipOption(
        value: modifier.id.hexString,
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
              child: FormBuilderFilterChip(
                name: widget.modifierCollection.id.hexString,
                decoration: InputDecoration(
                  labelText: widget.modifierCollection.name,
                ),
                options: options,
                initialValue: widget.initialValue,
                onChanged: (value) {
                  widget.onChanged();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}