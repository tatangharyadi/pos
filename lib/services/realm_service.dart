import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/shift/shift_model.dart';

part 'realm_service.g.dart';

@Riverpod(keepAlive: true)
class RealmService extends _$RealmService {
  late Realm _realm;

  @override
  Realm build() {
    var config = Configuration.local([DayShift.schema, Shift.schema], schemaVersion: 1);
    _realm = Realm(config);

    var dayShifts = _realm.all<DayShift>();
    if (dayShifts.isEmpty) {
      DateTime now = DateTime.now();
      DateTime next = now.add(const Duration(days: 1));
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

      _realm.write<DayShift>(() {
        return _realm.add(seed);
      });
    }

    return _realm;
  }
}
