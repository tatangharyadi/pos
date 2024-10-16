import 'package:dio/dio.dart';
import 'package:pos/configs/env.dart';
import 'package:pos/models/redemption/redemption_api.dart';
import 'package:pos/models/redemption/redemption_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redemption_repository.g.dart';

@riverpod
class RedemptionRepository extends _$RedemptionRepository {

  @override
  List<Redemption> build() {
    return List<Redemption>.empty(growable: true);
  }

  Future<String> redeem(String voucherId, orderId, customeerId, double amount) async {
    final dio = Dio();
    final redemptionApi = RedemptionApi(dio, baseUrl: Env.apiUrl);
    final redeem = Redeem(
      redeemables: [Redeemable(object: 'voucher', id: voucherId)],
      order: Order(id: orderId, amount: amount, discount: 0),
      customer: Customer(id: customeerId),
    );
    final redemption = await redemptionApi.redeem(Env.apiKey, redeem);
    state = redemption;

    return redemption[0].status;
  }
}