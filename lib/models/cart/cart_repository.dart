import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/cart/cart_item_model.dart';

part 'cart_repository.g.dart';

@riverpod
class CartRepository extends _$CartRepository {
  @override
  List<CartItem> build() {
    return [];
  }

  CartItem? findItemByOrderLineId(String orderLineId) {
    return state.firstWhere((item) => item.orderLineId == orderLineId);
  }

  void addItem(CartItem item) {
    state = [
      ...state, item
    ];
  }

  void removeItem(String orderLineId) {
    state = state.where((item) => item.orderLineId != orderLineId).toList();
  }

  double sumItems() {
    double sum = state.fold(0, (previousValue, item) => previousValue + (item.qty * item.unitPrice));
    return sum;
  }
}
