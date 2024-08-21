import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';
import 'package:pos/models/product/product_model.dart';

part 'product_repository.g.dart';

@riverpod
class ProductRepository extends _$ProductRepository {
  late Realm _realm;

  @override
  Realm build() {
    _realm = ref.watch(realmServiceProvider);
    return _realm;
  }

  Product? findById(ObjectId? id) {
    Product? product = _realm.find<Product>(id);
    return product;
  }

  Modifier? findModifierById(ObjectId? id) {
    Modifier? modifier = _realm.find<Modifier>(id);
    return modifier;
  }

  void update(ObjectId id, bool isPin1, bool isPin2) {
    Product? product = _realm.find<Product>(id);

    if (product != null) {
      state.write(() {
        product.isPin1 = isPin1;
        product.isPin2 = isPin2; 
      });
    }
  }
}