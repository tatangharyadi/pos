import 'package:pos/models/order/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';

part 'order_repository.g.dart';

@riverpod
class OrderRepository extends _$OrderRepository {
  late Realm _realm;

  @override
  Realm build() {
    _realm = ref.watch(realmServiceProvider);
    return _realm;
  }

   Order? findById(ObjectId? id) {
    Order? order = state.find<Order>(id);
    return order;
  }

  RealmResults<Order> findByParentId(ObjectId parentId) {
    const query = r'''
      parentId == $0
    ''';
    final queryParameter = parentId;
    return state.query<Order>(query, [queryParameter]);
  }

  double sumByParentId(ObjectId parentId) {
    const query = r'''
      parentId == $0
    ''';
    final queryParameter = parentId;
    final orders = state.query<Order>(query, [queryParameter]);
    double sum = orders.fold(0, (previousValue, item) => previousValue + (item.total));
    return sum;
  }

  void createParentOrder(ParentOrder parentOrder) {
    state.write(() {
      state.add(parentOrder, update: true);
    });
  }

  void createOrder(Order order) {
    state.write(() {
      state.add(order, update: true);
    });
  }

  void _updateOrderStatus(ObjectId parentOrderId, String status) {
    String prevStatus;
    switch (status) {
      case 'PREPARING':
        prevStatus = 'NEW';
        break;
      case 'READY':
        prevStatus = 'PREPARING';
        break;
      default:
        prevStatus = 'NEW';
        break;
    }

    const query = r'''
      parentId == $0
    ''';

    final List<Object> queryParameters = [parentOrderId];
    final results = state.query<Order>(query, [queryParameters]);
    for (Order order in results) {
      final orderLineStatus = order.orderLines.where((element) => element.status == prevStatus).toList();
      if (orderLineStatus.isEmpty) {
        state.write(() {
          order.status = status;
        });
      }
    }
  }

  void updateOrderLineStatus(ObjectId orderLineId, String status) {
    OrderLine? orderLine = state.find<OrderLine>(orderLineId);

    if (orderLine != null) {
      state.write(() {
        orderLine.status = status;
      });
      _updateOrderStatus(orderLine.parentId, status);

    }
  }
}