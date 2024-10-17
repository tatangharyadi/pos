// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qris_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrisPaymentMetadata _$QrisPaymentMetadataFromJson(Map<String, dynamic> json) =>
    QrisPaymentMetadata(
      token: json['token'] as String,
    );

Map<String, dynamic> _$QrisPaymentMetadataToJson(
        QrisPaymentMetadata instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

QrisPayment _$QrisPaymentFromJson(Map<String, dynamic> json) => QrisPayment(
      id: json['reference_id'] as String,
      currency: json['currency'] as String,
      amount: (json['amount'] as num).toDouble(),
      qrString: json['qr_string'] as String,
      status: json['status'] as String?,
      metadata: QrisPaymentMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QrisPaymentToJson(QrisPayment instance) =>
    <String, dynamic>{
      'reference_id': instance.id,
      'currency': instance.currency,
      'amount': instance.amount,
      'qr_string': instance.qrString,
      'status': instance.status,
      'metadata': instance.metadata,
    };
