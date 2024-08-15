// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModifierImpl _$$CartItemModifierImplFromJson(
        Map<String, dynamic> json) =>
    _$CartItemModifierImpl(
      modifierId: json['modifierId'] as String,
      collectionId: json['collectionId'] as String,
      sku: json['sku'] as String?,
      name: json['name'] as String,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$CartItemModifierImplToJson(
        _$CartItemModifierImpl instance) =>
    <String, dynamic>{
      'modifierId': instance.modifierId,
      'collectionId': instance.collectionId,
      'sku': instance.sku,
      'name': instance.name,
      'unitPrice': instance.unitPrice,
      'isSelected': instance.isSelected,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      orderLineId: json['orderLineId'] as String,
      productId: json['productId'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      qty: (json['qty'] as num).toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => CartItemModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'orderLineId': instance.orderLineId,
      'productId': instance.productId,
      'sku': instance.sku,
      'name': instance.name,
      'unitPrice': instance.unitPrice,
      'qty': instance.qty,
      'modifiers': instance.modifiers,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      orderId: json['orderId'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'items': instance.items,
    };
