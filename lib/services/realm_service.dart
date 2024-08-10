import 'package:flutter/foundation.dart' as foundation;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_model.dart';
import 'package:pos/models/product/product_model.dart';

part 'realm_service.g.dart';

@Riverpod(keepAlive: true)
class RealmService extends _$RealmService {
  late Realm _realm;

  @override
  Realm build() {
    var config = Configuration.local([
      Price.schema, Modifier.schema, ModifierCollection.schema,
      Product.schema, Brand.schema, Category.schema,
      DayShift.schema, Shift.schema], schemaVersion: 1);
    _realm = Realm(config);
    
    if(foundation.kDebugMode) {
      final storagePath = Configuration.defaultStoragePath;
      print('DEBUG: $storagePath');
    }

    DateTime now = DateTime.now();
    DateTime previous = now.subtract(const Duration(days: 1));
    DateTime next = now.add(const Duration(days: 1));
    DateTime next2 = now.add(const Duration(days: 2));

    var products = _realm.all<Product>();
    if (products.isEmpty) {
      
      List<Price> pricesHOUS00077162 = [
        Price(ObjectId(), 'IDR', 54000),
        Price(ObjectId(), 'IDR', 55000,
        priceEffectiveTime: DateTime(now.year, now.month, now.day, 00, 00).toUtc(),
        priceExpireTime: DateTime(next.year, next.month, next.day, 23, 59).toUtc()),
        Price(ObjectId(), 'IDR', 56000,
        priceEffectiveTime: DateTime(previous.year, previous.month, previous.day, 00, 00).toUtc(),
        priceExpireTime: DateTime(next2.year, next2.month, next2.day, 23, 59).toUtc())
      ];
      List<Price> pricesHOUS00077118 = [
        Price(ObjectId(), 'IDR', 53000),
      ];
      List<Price> pricesHHOUS00069085 = [
        Price(ObjectId(), 'IDR', 18000),
      ];
      List<Price> pricesMGMULI002 = [
        Price(ObjectId(), 'IDR', 28000),
      ];
      List<Price> pricesHOUS00076950 = [
        Price(ObjectId(), 'IDR', 10000),
      ];

      List<ModifierCollection> modifierCollectionMGMULI002 = [
        ModifierCollection(ObjectId(), 'Add-On', 0, 3,
          modifiers: [
            Modifier(ObjectId(), 'MODIFIER', 'Hazelnut Syrup',
              prices: [
                Price(ObjectId(), 'IDR', 6000),
              ]),
            Modifier(ObjectId(), 'MODIFIER', 'Vanilla Syrup',
              prices: [
                Price(ObjectId(), 'IDR', 6000),
              ]),
            Modifier(ObjectId(), 'MODIFIER', 'Oat Milk',
              prices: [
                Price(ObjectId(), 'IDR', 12000),
              ]),
            Modifier(ObjectId(), 'MODIFIER', 'Expresso',
              prices: [
                Price(ObjectId(), 'IDR', 5000),
              ]),
            Modifier(ObjectId(), 'MODIFIER', 'Double Expresso',
              prices: [
                Price(ObjectId(), 'IDR', 10000),
              ]),
          ]),
      ];

      List<ModifierCollection> modifierCollectionHOUS00076950 = [
        ModifierCollection(ObjectId(), 'Temp', 1, 1,
          modifiers: [
            Modifier(ObjectId(), 'MODIFIER', 'Hot'),
            Modifier(ObjectId(), 'MODIFIER', 'Iced'),
          ]),
      ];

      _realm.write(() {
        _realm.addAll([
          Product(ObjectId(), 'HOUS00077162', 'PRODUCT', 'Spaghetti Aglio Olio',
            image: 'https://ik.imagekit.io/yummycorp/yummykitchen/HOUS00077162.png',
            prices: pricesHOUS00077162),
          Product(ObjectId(), 'HOUS00077118', 'PRODUCT', 'Chicken Steak Burger',
            image:  'https://ik.imagekit.io/yummycorp/yummykitchen/HOUS00077118.png',
            prices: pricesHOUS00077118),
          Product(ObjectId(), 'HOUS00069085', 'PRODUCT', 'Butter Croissant',
            image: 'https://ik.imagekit.io/yummycorp/yummykitchen/HOUS00069085.png',
            prices: pricesHHOUS00069085),
          Product(ObjectId(), 'MGM-ULI-002', 'PRODUCT', 'Hot Cappuccino',
            image:  'https://ik.imagekit.io/yummycorp/yummykitchen/MGM-ULI-002.png',
            modifierCollections: modifierCollectionMGMULI002, prices: pricesMGMULI002),
          Product(ObjectId(), 'HOUS00076950', 'PRODUCT', 'Black Tea',
            image: 'https://ik.imagekit.io/yummycorp/yummykitchen/HOUS00076950.png',
            modifierCollections: modifierCollectionHOUS00076950, prices: pricesHOUS00076950),
        ]);
      });
    }

    var dayShifts = _realm.all<DayShift>();
    if (dayShifts.isEmpty) {
      List<Shift> shifts = [
        Shift(ObjectId(), 'SHIFT01',
          DateTime(now.year, now.month, now.day, 10, 00).toUtc(), DateTime(now.year, now.month, now.day, 15, 00).toUtc(),
          'CLOSE', '123', openTime: DateTime(now.year, now.month, now.day, 10, 10).toUtc(),
          closeTime: DateTime(now.year, now.month, now.day, 15, 00).toUtc(),
          totalSales: 1000),
        Shift(ObjectId(), 'SHIFT02',
          DateTime(now.year, now.month, now.day, 15, 00).toUtc(), DateTime(now.year, now.month, now.day, 21, 00).toUtc(),        
          'REOPENED', '456', openTime: DateTime(now.year, now.month, now.day, 15, 20).toUtc(),
          closeTime: DateTime(now.year, now.month, now.day, 23, 00).toUtc(),
          totalSales: 2000),
        Shift(ObjectId(), 'SHIFT03', 
          DateTime(now.year, now.month, now.day, 22, 00).toUtc(),  DateTime(next.year, next.month, next.day, 03, 00).toUtc(),
          'OPEN', '789', totalSales: 0),
      ];

      DayShift seed = DayShift(ObjectId(), 'DAYSHIFTSEED', DateTime.now().toUtc(), totalSales: 6000, shifts: shifts);

      _realm.write(() {
        _realm.add(seed);
      });
    }

    return _realm;
  }
}
