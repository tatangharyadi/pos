import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class VoucherDiscount{
  String type;
  @JsonKey(name: 'percent_off')
  int percentOff;

  VoucherDiscount({
    required this.type,
    required this.percentOff,
  });

  factory VoucherDiscount.fromJson(Map<String, dynamic> json) => _$VoucherDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherDiscountToJson(this);
}

@JsonSerializable()
class Voucher {
  String code;
  String category;
  String type;
  VoucherDiscount? discount;
  bool active;

  Voucher({
    required this.code,
    required this.category,
    required this.type,
    required this.active,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}

@JsonSerializable()
class Credit {
  String cycle;
  double limit;
  double balance;
  @JsonKey(name: 'transaction_timestamp', includeIfNull: false)
  DateTime? transactionTimestamp;
  @JsonKey(name: 'available_balance')
  double availableBalance;

  Credit({
    required this.cycle,
    required this.limit,
    required this.balance,
    required this.availableBalance,
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
  List<Voucher> vouchers = [];

  Member({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.mealBenefit,
    required this.creditBenefit,
    required this.personalCredit,
    this.vouchers = const [],
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

