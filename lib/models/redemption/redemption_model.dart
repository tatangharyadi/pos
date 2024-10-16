import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/member/member_model.dart';

part 'redemption_model.g.dart';

@JsonSerializable()
class Redeemable {
  String object;
  String id;

  Redeemable({
    required this.object,
    required this.id,
  });

  factory Redeemable.fromJson(Map<String, dynamic> json) => _$RedeemableFromJson(json);
  Map<String, dynamic> toJson() => _$RedeemableToJson(this);
}

@JsonSerializable()
class Order {
  String id;
  double amount;
  double discount;

  Order({
    required this.id,
    required this.amount,
    required this.discount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Customer {
  String id;

  Customer({
    required this.id,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Redeem {
  List<Redeemable> redeemables = [];
  Order order;
  Customer customer;

  Redeem({
    this.redeemables = const [],
    required this.order,
    required this.customer,
  });

  factory Redeem.fromJson(Map<String, dynamic> json) => _$RedeemFromJson(json);
  Map<String, dynamic> toJson() => _$RedeemToJson(this);
}

@JsonSerializable()
class Redemption {
  Voucher voucher;
  Order order;
  String status;

  Redemption({
    required this.voucher,
    required this.order,
    required this.status,
  });

  factory Redemption.fromJson(Map<String, dynamic> json) => _$RedemptionFromJson(json);
  Map<String, dynamic> toJson() => _$RedemptionToJson(this);
}
