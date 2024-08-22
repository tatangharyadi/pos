import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/cart/cart_item_repository.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:pos/models/product/product_utils.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:pos/models/cart/cart_model.dart';
import 'package:realm/realm.dart';


class BarcodeDialog extends ConsumerStatefulWidget {
  const BarcodeDialog({super.key});

  @override
  ConsumerState<BarcodeDialog> createState() => _BarcodeDialogState();
}

class _BarcodeDialogState extends ConsumerState<BarcodeDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  
  void onClickCancel() {
    context.pop();
  }

  void _onSubmit() {
    final barcode = _formKey.currentState!.fields['barcode']!.value as String;
    final productRepository = ref.read(productRepositoryProvider.notifier);
    final product = productRepository.findByBarcode(barcode);
    if (product == null) {
      return;
    }

    final price = ProductUtils.getValidPriceByProduct(product);
    final cartItem = CartItem(
        orderLineId: ObjectId().hexString,
        productId: product.id.hexString,
        sku: product.sku,
        name: product.name,
        unitPrice: price,
        qty: 1,
        modifiers: List<CartItemModifier>.empty(growable: true)
      );
      ref.read(cartItemRepositoryProvider.notifier).add(cartItem);
      ref.read(totalDueProvider.notifier).increment(cartItem.unitPrice * cartItem.qty);
  }

  void onClickOk() {
    context.pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DialogHeader(
            icon: Icons.barcode_reader,
            title: "Barcode Reader",
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'barcode',
                          decoration: const InputDecoration(
                            hintText: 'Type or scan barcode',
                          ),
                          initialValue: '',
                          onSubmitted: (value) {
                            _onSubmit();
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
