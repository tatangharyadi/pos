import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';
import 'package:pos/models/payment/payment_model.dart';

part 'payment_repository.g.dart';

@riverpod
class PaymentRepository extends _$PaymentRepository {
  late Realm _realm;

  @override
  Realm build() {
    _realm = ref.watch(realmServiceProvider);
    return _realm;
  }

  Payment? findById(ObjectId? id) {
    Payment? payment = state.find<Payment>(id);
    return payment;
  }

  double sumByParentId(ObjectId parentId) {
    const query = r'''
      parentId == $0
    ''';
    final queryParameter = parentId;
    final orders = state.query<Payment>(query, [queryParameter]);
    double sum = orders.fold(0, (previousValue, item) => previousValue + (item.amount));
    return sum;
  }  

  Future<void> create(Payment payment) async{
    state.write(() {
      state.add(payment, update: true);
    });
  }

  Future<void> delete(Payment payment) async{
    state.write(() {
      state.delete(payment);
    });
  }


}
