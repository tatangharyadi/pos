import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_query_repository.g.dart';

@riverpod
class CategoryQueryRepository extends _$CategoryQueryRepository {
  late String query;

  @override
  String build() {
    query = '*';
    return query;
  }

  void setQuery(String value) {
    state = value;
  }
}