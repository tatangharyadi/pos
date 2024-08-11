// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      objectId: json['objectId'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      unitPrice: json['unitPrice'] ?? 0,
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'sku': instance.sku,
      'name': instance.name,
      'unitPrice': instance.unitPrice,
      'qty': instance.qty,
    };
