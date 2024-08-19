import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';
import 'package:pos/models/shift/shift_model.dart';

part 'shift_repository.g.dart';

@riverpod
class ShiftRepository extends _$ShiftRepository {
  late Realm _realm;

  @override
  Realm build() {
    _realm = ref.watch(realmServiceProvider);
    return _realm;
  }

  ParentShift? findById(ObjectId? id) {
    ParentShift? parentShift = state.find<ParentShift>(id);
    return parentShift;
  }

  bool login(String secretPin) {
        const query = r'''
      (startTime <= $0 ||
      endTime => $0) &&
      secretPin == $1
    ''';

    final DateTime now = DateTime.now().toUtc();
    List<Object> queryParameter = [now, secretPin];
    final results = state.query<Shift>(query, [...queryParameter]);
    if (results.isEmpty) {
      return false;
    }
    state.write(() {
      Shift shift = results.first;
      shift.status = "OPEN";
      shift.openTime = now;
    });

    return true;
  }

  void _generateShifts(ParentShift parentShift) {
    final startDate = parentShift.startDate.toLocal();
    final endDate = parentShift.endDate.toLocal();
    final daysToGenerate = endDate.difference(startDate).inDays + 1;
    final days = List.generate(daysToGenerate, (i) => startDate.add(Duration(days: i)));
    for (var day in days) {
      final startTime = DateTime(day.year, day.month, day.day,
        parentShift.startTime.toLocal().hour, parentShift.startTime.toLocal().minute);
      final endTime = DateTime(day.year, day.month, day.day,
        parentShift.endTime.toLocal().hour, parentShift.endTime.toLocal().minute);

      final shift = Shift(
        ObjectId(),
        parentShift.name,
        startTime,
        endTime,
        "SCHEDULED",
        parentShift.secretPin,
      );
      parentShift.shifts.add(shift);
    }
  }

  Future<void> create(ParentShift parentShift) async{
    state.write(() {
      state.add(parentShift, update: true);

      if (parentShift.shifts.isEmpty) {
        _generateShifts(parentShift);
      }
    });
  }

  Future<void> delete(ParentShift parentShift) async{
    state.write(() {
      state.delete(parentShift);
    });
  }
}
