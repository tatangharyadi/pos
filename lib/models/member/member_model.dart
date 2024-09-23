import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class CompanyBenefit {
  String cycle;
  double limit;
  double balance;
  @JsonKey(name: 'transaction_timestamp', includeIfNull: false)
  DateTime? transactionTimestamp;

  CompanyBenefit({
    required this.cycle,
    required this.limit,
    required this.balance,
  });

  factory CompanyBenefit.fromJson(Map<String, dynamic> json) => _$CompanyBenefitFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyBenefitToJson(this);
}

@JsonSerializable()
class Member {
  String id;
  String name;
  @JsonKey(includeIfNull: false)
  String? email;
  @JsonKey(includeIfNull: false)
  String? phone;
  @JsonKey(name: 'company_benefit')
  CompanyBenefit companyBenefit;

  Member({
    required this.id,
    required this.name,
    required this.companyBenefit,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

