import 'package:flutter/material.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:pos/theme.dart';
import 'package:pos/screens/terminal/terminal_form/cart/card_item_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/cart/cart_item_repository.dart';
import 'package:pos/models/cart/cart_model.dart';

class CartItemTab extends ConsumerWidget {
  const CartItemTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CartItem> cartItemList = ref.watch(cartItemRepositoryProvider);
        
    return ListView.builder(
        itemCount: cartItemList.length,
        itemBuilder: (context, index) {
          final CartItem cartItem = cartItemList[index];
              
          return Dismissible(
            key: Key(cartItem.orderLineId),
            onDismissed: (direction) {
              ref.read(cartItemRepositoryProvider.notifier).remove(cartItem.orderLineId);
              ref.read(totalDueProvider.notifier).decrement(cartItem.unitPrice * cartItem.qty);
            },
            background: Container(color: dismissibleBackground),
            child: CartItemCard(cartItem),
          );
        },
      );
  }
}
