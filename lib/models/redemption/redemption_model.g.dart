// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Redeemable _$RedeemableFromJson(Map<String, dynamic> json) => Redeemable(
      object: json['object'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$RedeemableToJson(Redeemable instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'discount': instance.discount,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
    };

Redeem _$RedeemFromJson(Map<String, dynamic> json) => Redeem(
      redeemables: (json['redeemables'] as List<dynamic>?)
              ?.map((e) => Redeemable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedeemToJson(Redeem instance) => <String, dynamic>{
      'redeemables': instance.redeemables,
      'order': instance.order,
      'customer': instance.customer,
    };

Redemption _$RedemptionFromJson(Map<String, dynamic> json) => Redemption(
      voucher: Voucher.fromJson(json['voucher'] as Map<String, dynamic>),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$RedemptionToJson(Redemption instance) =>
    <String, dynamic>{
      'voucher': instance.voucher,
      'order': instance.order,
      'status': instance.status,
    };
