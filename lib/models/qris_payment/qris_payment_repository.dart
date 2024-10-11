import 'package:dio/dio.dart';
import 'package:pos/configs/env.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pos/models/qris_payment/qris_payment_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/qris_payment/qris_payment_model.dart';

part 'qris_payment_repository.g.dart';

@riverpod
class QrisPaymentRepository extends _$QrisPaymentRepository {

  @override
  QrisPayment build() {
    return QrisPayment(
      id: 'id',
      currency: 'IDR',
      amount: 0,
      qrString: 'qr string',
      status: 'status',
      metadata: QrisPaymentMetadata(
        token: 'token',
      ),
    );
  }

  Future<QrisPayment> createQrPayment(amount) async {
    final dio = Dio();
    final qrisPaymentApi = QrisPaymentApi(dio, baseUrl: Env.apiUrl);

    final fcmToken = await FirebaseMessaging.instance.getToken();
    QrisPayment reqQrisPayment = QrisPayment(
      id: 'id',
      currency: 'IDR',
      amount: amount,
      qrString: 'qr string',
      status: 'status',
      metadata: QrisPaymentMetadata(
        token: fcmToken ?? 'token',
      ),
    );

    final qrisPayment = await qrisPaymentApi.createQrisPaymant(Env.apiKey, reqQrisPayment);
    state = qrisPayment;

    return qrisPayment;
  }
}