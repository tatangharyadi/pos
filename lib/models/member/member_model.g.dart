// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherDiscount _$VoucherDiscountFromJson(Map<String, dynamic> json) =>
    VoucherDiscount(
      type: json['type'] as String,
      percentOff: (json['percent_off'] as num).toInt(),
    );

Map<String, dynamic> _$VoucherDiscountToJson(VoucherDiscount instance) =>
    <String, dynamic>{
      'type': instance.type,
      'percent_off': instance.percentOff,
    };

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      code: json['code'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      active: json['active'] as bool,
    )..discount = json['discount'] == null
        ? null
        : VoucherDiscount.fromJson(json['discount'] as Map<String, dynamic>);

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'code': instance.code,
      'category': instance.category,
      'type': instance.type,
      'discount': instance.discount,
      'active': instance.active,
    };

Credit _$CreditFromJson(Map<String, dynamic> json) => Credit(
      cycle: json['cycle'] as String,
      limit: (json['limit'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      availableBalance: (json['available_balance'] as num).toDouble(),
    )..transactionTimestamp = json['transaction_timestamp'] == null
        ? null
        : DateTime.parse(json['transaction_timestamp'] as String);

Map<String, dynamic> _$CreditToJson(Credit instance) {
  final val = <String, dynamic>{
    'cycle': instance.cycle,
    'limit': instance.limit,
    'balance': instance.balance,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transaction_timestamp',
      instance.transactionTimestamp?.toIso8601String());
  val['available_balance'] = instance.availableBalance;
  return val;
}

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as String,
      employeeId: json['employee_id'] as String,
      name: json['name'] as String,
      mealBenefit:
          Credit.fromJson(json['meal_benefit'] as Map<String, dynamic>),
      creditBenefit:
          Credit.fromJson(json['credit_benefit'] as Map<String, dynamic>),
      personalCredit:
          Credit.fromJson(json['personal_credit'] as Map<String, dynamic>),
      vouchers: (json['vouchers'] as List<dynamic>?)
              ?.map((e) => Voucher.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?;

Map<String, dynamic> _$MemberToJson(Member instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'employee_id': instance.employeeId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['meal_benefit'] = instance.mealBenefit;
  val['credit_benefit'] = instance.creditBenefit;
  val['personal_credit'] = instance.personalCredit;
  val['vouchers'] = instance.vouchers;
  return val;
}
