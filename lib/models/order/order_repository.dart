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
}