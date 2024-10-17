import 'package:json_annotation/json_annotation.dart';

part 'qris_payment_model.g.dart';

@JsonSerializable()
class QrisPaymentMetadata {
  String token;

  QrisPaymentMetadata({
    required this.token,
  });

  factory QrisPaymentMetadata.fromJson(Map<String, dynamic> json) => _$QrisPaymentMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$QrisPaymentMetadataToJson(this);
}

@JsonSerializable()
class QrisPayment {
  @JsonKey(name: 'reference_id')
  String id;
  String currency;
  double amount;
  @JsonKey(name: 'qr_string')
  String qrString;
  String? status;
  QrisPaymentMetadata metadata;

  QrisPayment({
    required this.id,
    required this.currency,
    required this.amount,
    required this.qrString,
    required this.status,
    required this.metadata,
  });

  factory QrisPayment.fromJson(Map<String, dynamic> json) => _$QrisPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$QrisPaymentToJson(this);
}