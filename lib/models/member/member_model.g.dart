// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBenefit _$CompanyBenefitFromJson(Map<String, dynamic> json) =>
    CompanyBenefit(
      cycle: json['cycle'] as String,
      limit: (json['limit'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
    )..transactionTimestamp = json['transaction_timestamp'] == null
        ? null
        : DateTime.parse(json['transaction_timestamp'] as String);

Map<String, dynamic> _$CompanyBenefitToJson(CompanyBenefit instance) {
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
  return val;
}

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as String,
      name: json['name'] as String,
      companyBenefit: CompanyBenefit.fromJson(
          json['company_benefit'] as Map<String, dynamic>),
    )
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?;

Map<String, dynamic> _$MemberToJson(Member instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['company_benefit'] = instance.companyBenefit;
  return val;
}
