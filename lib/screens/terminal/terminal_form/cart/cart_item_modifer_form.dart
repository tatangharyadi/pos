import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pos/components/modifier_card/checkbox_modifier_card.dart';
import 'package:pos/components/modifier_card/radio_modifier_card.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/cart/cart_repository.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:realm/realm.dart';

class CartItemModiferForm extends ConsumerStatefulWidget {
  final String id;
  const CartItemModiferForm({super.key, required this.id});

    @override
  ConsumerState<CartItemModiferForm> createState() => _CartItemModiferFormState();
}

class _CartItemModiferFormState extends ConsumerState<CartItemModiferForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late ObjectId _objectId;

  @override
  void initState() {
    super.initState();
    _objectId = ObjectId.fromHexString(widget.id);
  }

  void onChanged() {
    List<String> selectedModifiers = [];

    for (var field in _formKey.currentState!.fields.entries) {
      String fieldType = field.value.toString();
      if (fieldType.contains('FormBuilderChoiceChip') && field.value.value != null) {
        selectedModifiers.add(field.value.value);
      }
      if (fieldType.contains('FormBuilderFilterChip')) {
        for (var value in field.value.value) {
          selectedModifiers.add(value);
        }
      }
    }

    final productRepository = ref.read(productRepositoryProvider.notifier);
    for (var selected in selectedModifiers) {
      final modifier = productRepository.findModifierById(ObjectId.fromHexString(selected));
      double price = 0;
      if (modifier!.prices.isNotEmpty) {
        price = modifier.prices.first.price;
      }
      print('selected: ${modifier.name} ${price}');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final productRepository = ref.watch(productRepositoryProvider.notifier);
    final product = productRepository.findById(_objectId);
    final price = ProductUtils.getValidPrice(product!);

    List<Widget> modifierCards = [];
    for (var modifierCollection in product.modifierCollections) {
      if (modifierCollection.max == 1) {
        modifierCards.add(RadioModifierCard(formKey: _formKey,
          onChanged: onChanged, modifierCollection: modifierCollection));
      } else {
      modifierCards.add(CheckboxModifierCard(formKey: _formKey,
        onChanged: onChanged, modifierCollection: modifierCollection));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          child: Row(
            children: [
              Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.image ?? 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,  ),
                    ),
                  ),
                  const Gap(5),
                  Text(product.sku),
                  const Gap(5),
                  Text(NumberFormat.decimalPattern().format(price)),
                ],
              ),
              const Gap(5),
              Expanded(
                child: Column(
                  children: [
                    for (var modifierCard in modifierCards) ...[
                      modifierCard,
                      const Gap(5),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          ref.read(cartRepositoryProvider.notifier).add(
            product.sku,
            product.name,
            price, 
            1);
          context.pop();
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    );
  }
}
