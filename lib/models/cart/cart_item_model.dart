import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModifier with _$CartItemModifier {
  factory CartItemModifier({
    required String objectId,
    String? sku,
    required String name,
    @Default(0.0) double unitPrice,
  }) = _CartItemModifier;

  factory CartItemModifier.fromJson(Map<String, Object?> json) => _$CartItemModifierFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CartItem with _$CartItem{
  factory CartItem({
    required String objectId,
    required String sku,
    required String name,
    @Default(0.0) double unitPrice,
    required int qty,
    @Default([]) List<CartItemModifier> modifiers,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) => _$CartItemFromJson(json);
}
