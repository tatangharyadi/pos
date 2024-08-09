import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_query_repository.g.dart';

@riverpod
class ProductQueryRepository extends _$ProductQueryRepository {
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