import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class Credit {
  String cycle;
  double limit;
  double balance;
  @JsonKey(name: 'transaction_timestamp', includeIfNull: false)
  DateTime? transactionTimestamp;

  Credit({
    required this.cycle,
    required this.limit,
    required this.balance,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
  Map<String, dynamic> toJson() => _$CreditToJson(this);
}

@JsonSerializable()
class Member {
  String id;
  @JsonKey(name: 'employee_id')
  String employeeId;
  String name;
  @JsonKey(includeIfNull: false)
  String? email;
  @JsonKey(includeIfNull: false)
  String? phone;
  @JsonKey(name: 'meal_benefit')
  Credit mealBenefit;
  @JsonKey(name: 'credit_benefit')
  Credit creditBenefit;
  @JsonKey(name: 'personal_credit')
  Credit personalCredit;

  Member({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.mealBenefit,
    required this.creditBenefit,
    required this.personalCredit,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

