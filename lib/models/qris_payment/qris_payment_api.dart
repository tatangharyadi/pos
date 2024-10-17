import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pos/models/qris_payment/qris_payment_model.dart';

part 'qris_payment_api.g.dart';

@RestApi()
abstract class QrisPaymentApi {
  factory QrisPaymentApi(Dio dio, {String? baseUrl}) = _QrisPaymentApi;

  @POST('/xendit/createqrpayment')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<QrisPayment> createQrisPaymant(
    @Query('key') String key,
    @Body() QrisPayment body,
  );
}
