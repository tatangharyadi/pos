import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItem with _$CartItem{
  factory CartItem({
    required String objectId,
    required String sku,
    required String name,
    @Default(0) unitPrice,
    required int qty
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) => _$CartItemFromJson(json);
}
