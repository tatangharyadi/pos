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
    Product? product = state.find<Product>(id);
    return product;
  }

  Product? findByBarcode(String barcode) {
    const query = r'''
      barcode ==[c] $0
    ''';

    final result = state.query<Product>(query, [barcode]);
    if (result.isEmpty) {
      return null;
    }
    return result.first;
  }

  Modifier? findModifierById(ObjectId? id) {
    Modifier? modifier = state.find<Modifier>(id);
    return modifier;
  }

  void update(ObjectId id, bool isPin1, bool isPin2) {
    Product? product = state.find<Product>(id);

    if (product != null) {
      state.write(() {
        product.isPin1 = isPin1;
        product.isPin2 = isPin2; 
      });
    }
  }
}