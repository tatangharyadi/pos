import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pos/models/redemption/redemption_model.dart';

part 'redemption_api.g.dart';

@RestApi()
abstract class RedemptionApi {
  factory RedemptionApi(Dio dio, {String? baseUrl}) = _RedemptionApi;

  @POST('/voucherify/redeem')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<Redemption>> redeem(
    @Query('key') String key,
    @Body() Redeem body,
  );
}

