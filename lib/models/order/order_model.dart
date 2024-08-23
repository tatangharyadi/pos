import 'package:realm/realm.dart';

part 'order_model.realm.dart';

@RealmModel()
@MapTo("orderLineModifiers")
class _OrderLineModifier {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String sku;
  late String name;
  late double price;
}

@RealmModel()
@MapTo("orderLines")
class _OrderLine {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String sku;
  late String name;
  late int quantity;
  late double unitPrice;

  late List<_OrderLineModifier> modifiers;
  late double total = 0;
}

@RealmModel()
@MapTo("orders")
class _Order {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String orderNumber;
  @Indexed()
  late ObjectId parentId;
  late DateTime orderDate;
  late String status;
  late String description;

  late List<_OrderLine> orderLines;
  late double total = 0;

  @Indexed()
  String? shift;
  DateTime? shiftDate;
  @Indexed()
  String? memberId;  
}

@RealmModel()
@MapTo("parentOrders")
class _ParentOrder {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late double? totalOrders = 0;
  late double? totalPayments = 0;
}

