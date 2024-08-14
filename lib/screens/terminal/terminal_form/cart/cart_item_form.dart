import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pos/components/modifier_card/checkbox_modifier_card.dart';
import 'package:pos/components/modifier_card/radio_modifier_card.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/cart/cart_repository.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/product/product_model.dart';
import 'package:pos/models/cart/cart_item_model.dart';

class CartItemForm extends ConsumerStatefulWidget {
  final String orderLineId;
  final String productId;
  const CartItemForm({super.key, required this.orderLineId, required this.productId});

    @override
  ConsumerState<CartItemForm> createState() => _CartItemModiferState();
}

class _CartItemModiferState extends ConsumerState<CartItemForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late CartItem _cartItem;
  late Product _product;
  late int _quantity;
  late double _unitPrice, _totalModifierPrice;

  CartItem _new() {
    final cartItem = CartItem(
      orderLineId: ObjectId().hexString,
      productId: widget.productId,
      sku: 'sku',
      name: 'name',
      unitPrice: 0.0,
      qty: 1,
      modifiers: List<CartItemModifier>.empty(growable: true));

      return cartItem;
  }

  CartItem _edit() {
    final cartRepository = ref.read(cartRepositoryProvider.notifier);
    final cartItem = cartRepository.findByOrderLineId(widget.orderLineId)!;

    return cartItem;
  }

  @override
  void initState() {
    super.initState();
    _cartItem = (widget.orderLineId != 'new') ? _edit() : _new();

    final productRepository = ref.read(productRepositoryProvider.notifier);
    _product = productRepository.findById(ObjectId.fromHexString(_cartItem.productId))!;
    _unitPrice = ProductUtils.getValidPriceByProduct(_product);
    _quantity = _cartItem.qty;
    _totalModifierPrice = 0;
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

    setState(() {
      _cartItem.modifiers.clear();
      _totalModifierPrice = 0;

      for (var modifierCollection in _product.modifierCollections) {
        for (var modifier in modifierCollection.modifiers) {
          final modifierPrice = ProductUtils.getValidPriceByModifier(modifier);

          bool isSelected = false;
          int index = selectedModifiers.indexWhere((element) => element == modifier.id.hexString);
          if (index != -1) {
            isSelected = true;
            _cartItem.modifiers.add(CartItemModifier(
              objectId: modifier.id.hexString,
              collectionId: modifierCollection.id.hexString,
              sku: modifier.sku,
              name: modifier.name,
              unitPrice: modifierPrice,
              isSelected: isSelected));
            _totalModifierPrice += modifierPrice;
          }
        }
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> modifierCards = [];
    for (var modifierCollection in _product.modifierCollections) {
      if (modifierCollection.max == 1) {
        String initialValue = '';
        if (_cartItem.modifiers.isNotEmpty) {
          initialValue = _cartItem.modifiers.firstWhere(
            (element) => element.collectionId == modifierCollection.id.hexString).objectId;
        }
        modifierCards.add(RadioModifierCard(formKey: _formKey,
          onChanged: onChanged, modifierCollection: modifierCollection, initialValue: initialValue,));
      } else {
      List<String> initialValue = [];
      if (_cartItem.modifiers.isNotEmpty) {
        initialValue = _cartItem.modifiers.where(
          (element) => element.collectionId == modifierCollection.id.hexString).map((e) => e.objectId).toList();
      }
      modifierCards.add(CheckboxModifierCard(formKey: _formKey,
        onChanged: onChanged, modifierCollection: modifierCollection, initialValue: initialValue,));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        _product.image ?? 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,  ),
                    ),
                  ),
                  const Gap(5),
                  Text(_product.sku),
                  const Gap(5),
                  Text(NumberFormat.decimalPattern().format(_unitPrice)),
                  const Gap(5),
                  Text('+${NumberFormat.decimalPattern().format(_totalModifierPrice)}'),
                ],
              ),
              const Gap(5),
              Column(
                children: [
                  for (var modifierCard in modifierCards) ...[
                    modifierCard,
                    const Gap(5),
                  ],
                ],
              ),
              const Gap(5),
              Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 250,
                    child: FormBuilderTextField(
                      name: 'quantity',
                      autofocus: false,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      initialValue: _quantity.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value == null) return;
                        if (int.tryParse(value.toString()) == null) return;
                        setState(() {
                          _quantity = int.parse(value.toString());
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(3),
                      ]),
                    ),
                  ),
                  Text(_cartItem.name),
                  Text(_cartItem.qty.toString()),
                  for (var modifier in _cartItem.modifiers) ...[
                    Text('${modifier.name} ${modifier.isSelected}'),
                  ],
                ],
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
          final cartItem = _cartItem.copyWith(
            sku: _product.sku,
            name: _product.name,
            unitPrice: _unitPrice + _totalModifierPrice,
            qty: _quantity);
          ref.read(cartRepositoryProvider.notifier).remove(cartItem.orderLineId);
          ref.read(cartRepositoryProvider.notifier).add(cartItem);
          context.pop();
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    );
  }
}
