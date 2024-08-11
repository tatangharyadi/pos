import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/cart/cart_item_model.dart';
import 'package:realm/realm.dart';

part 'cart_repository.g.dart';

@riverpod
class CartRepository extends _$CartRepository {
  @override
  List<CartItem> build() {
    return [];
  }

  void add(String sku, String name, double unitPrice, int qty) {
    state = [
      ...state,
      CartItem(
        objectId: ObjectId().hexString,
        sku: sku,
        name: name,
        unitPrice: unitPrice,
        qty: qty,
      )
    ];
  }

  void remove(String objectId) {
    state = state.where((item) => item.objectId != objectId).toList();
  }

  double sum() {
    double sum = state.fold(0, (previousValue, item) => previousValue + (item.qty * item.unitPrice));
    return sum;
  }
}
