import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/product/product_query_model.dart';

part 'product_query_repository.g.dart';

@riverpod
class ProductQueryRepository extends _$ProductQueryRepository {
  @override
  Query build() {
    final query = _initQuerty();
    return query;
  }

  Query _initQuerty() {
    final parameter = QueryParameter(
      key: 'BASEQUERY',
      value: '*',
    );

    const baseQuery = r'''
      sku LIKE[c] $0 ||
      name LIKE[c] $0
    ''';

    final query = Query(
      baseQuery: baseQuery,
      query: baseQuery,
      parameters: [parameter],
      values: _generateValues([parameter]),
    );  
    return query;
  }

  List<Object> _generateValues(List<QueryParameter> parameters) {
    List<Object> objects = [];
    for (var parameter in parameters) {
      objects.add(parameter.value);
    }

    return objects;
  }

  void filterByBase(String value) {
    state = _initQuerty();

    List<QueryParameter> parameters;
    parameters = [...state.parameters];
    int index = parameters.indexWhere((element) => element.key == 'BASEQUERY');
    if (index != -1) {
      parameters[index] = QueryParameter(
        key: 'BASEQUERY',
        value: '*$value*',
      );
    }

    Query query = Query(
      baseQuery: state.baseQuery,
      query: state.query,
      parameters: parameters,
      values: _generateValues(parameters)
    );

    state = query;
  }

  void filterByPin1() {
    const baseQuery = r'''
      isPin1 == true
    ''';


    final query = Query(
      baseQuery: state.baseQuery,
      query: baseQuery,
      parameters: [],
      values: []
    );

    state = query;
  }

  void filterByPin2() {
    const baseQuery = r'''
      isPin2 == true
    ''';


    final query = Query(
      baseQuery: state.baseQuery,
      query: baseQuery,
      parameters: [],
      values: []
    );

    state = query;
  }  
}