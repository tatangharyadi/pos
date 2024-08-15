import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/cart/cart_model.dart';

part 'cart_item_repository.g.dart';

@riverpod
class CartItemRepository extends _$CartItemRepository {
  late List<CartItem> cartItems;

  @override
  List<CartItem> build() {
    cartItems = [];
    return cartItems;
  }

  CartItem? findById(String orderLineId) {
    return state.firstWhere((item) => item.orderLineId == orderLineId);
  }

  void add(CartItem item) {
    state = [
      ...state, item
    ];
  }

  void remove(String orderLineId) {
    state = state.where((item) => item.orderLineId != orderLineId).toList();
  }

  double sum() {
    double sum = state.fold(0, (previousValue, item) => previousValue + (item.qty * item.unitPrice));
    return sum;
  }
}
