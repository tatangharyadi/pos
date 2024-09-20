import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pos/models/member/member_model.dart';

part 'member_api.g.dart';

@RestApi(baseUrl: 'https://pos-31k66m0a.an.gateway.dev')
abstract class MemberApi {
  factory MemberApi(Dio dio, {String? baseUrl}) = _MemberApi;

  @GET('/voucherify/getcustomer/{id}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<Member> getMember(
    @Path('id') String id,
    @Query('key') String key,
  );
}

