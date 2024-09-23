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
      name: 'non member',
      companyBenefit: CompanyBenefit(
        cycle: 'cycle',
        limit: 0,
        balance: 0,
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