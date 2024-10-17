import 'package:dio/dio.dart';
import 'package:pos/configs/env.dart';
import 'package:pos/models/member/member_api.dart';
import 'package:pos/models/member/member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_repository.g.dart';

@riverpod
class MemberRepository extends _$MemberRepository {

  @override
  Member build() {
    return Member(
      id: 'id',
      employeeId: 'employee id',
      name: 'non member',
      mealBenefit: Credit(
        cycle: 'cycle',
        limit: 0,
        balance: 0,
        availableBalance: 0,
      ),
      creditBenefit: Credit(
        cycle: 'cycle',
        limit: 0,
        balance: 0,
        availableBalance: 0,
      ),
      personalCredit: Credit(
        cycle: 'cycle',
        limit: 0,
        balance: 0,
        availableBalance: 0,
      ),
    );
  }

  Future<void> getById(String id) async {
    final dio = Dio();
    final memberApi = MemberApi(dio, baseUrl: Env.apiUrl);
    final member = await memberApi.getMember(id, Env.apiKey);
    state = member;
  }
}