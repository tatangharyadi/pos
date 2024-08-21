class QueryParameter {
  final String key;
  final String value;

  QueryParameter({
    required this.key,
    required this.value
  });
}

class Query {
  final String baseQuery;
  final String query;
  List<QueryParameter> parameters = [];
  List<Object> values = [];

  Query({
    required this.baseQuery,
    required this.query,
    this.parameters = const [],
    this.values = const []
  });
}