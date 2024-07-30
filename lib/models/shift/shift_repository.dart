import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/models/shift/shift_model.dart';

part 'shift_repository.g.dart';

@riverpod
class ShiftRepository extends _$ShiftRepository {
  late Realm _realm;

  @override
  Realm build() {
    var config = Configuration.local([DayShift.schema, Shift.schema], schemaVersion: 3);
    _realm = Realm(config);

    // _realm.write(() {
    //   _realm.deleteAll<Shift>();
    //   _realm.deleteAll<DayShift>();
    // });

    var dayShifts = _realm.all<DayShift>();
    if (dayShifts.isEmpty) {
      _realm.write(() {
        _realm.addAll([
          DayShift('DAYSHIFT01', 6000),
        ]);
      });
    }

    var shifts = _realm.all<Shift>();
    if (shifts.isEmpty) {
      _realm.write(() {
        _realm.addAll([
          Shift('SHIFT01', 'DAYSHIFT01', 'CLOSE', '123', 1000),
          Shift('SHIFT02', 'DAYSHIFT01', 'CLOSE', '456', 2000),
          Shift('SHIFT03', 'DAYSHIFT01', 'OPEN', '789', 3000),
        ]);
      });
    }

    return _realm;
  }

  Future<void> addDayShift(DayShift dayShift) async{
    state.write(() {
      state.add(dayShift);
    });
    ref.invalidateSelf();
  }
}
