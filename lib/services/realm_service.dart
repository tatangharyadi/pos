import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/shift/shift_model.dart';

part 'realm_service.g.dart';

@Riverpod(keepAlive: true)
class RealmService extends _$RealmService {
  late Realm _realm;

  @override
  Realm build() {
    var config = Configuration.local([DayShift.schema, Shift.schema], schemaVersion: 5);
    _realm = Realm(config);

    var dayShifts = _realm.all<DayShift>();
    if (dayShifts.isEmpty) {
      List<Shift> shifts = [
        Shift(ObjectId(), 'SHIFT01', 'CLOSE', '123', totalSales: 1000),
        Shift(ObjectId(), 'SHIFT02', 'CLOSE', '456', totalSales: 2000),
        Shift(ObjectId(), 'SHIFT03', 'OPEN', '789', totalSales: 3000),
      ];

      DayShift seed = DayShift(ObjectId(), 'DAYSHIFTSEED', DateTime.now().toUtc(), totalSales: 6000, shifts: shifts);

      _realm.write<DayShift>(() {
        return _realm.add(seed);
      });
    }

    return _realm;
  }
}
