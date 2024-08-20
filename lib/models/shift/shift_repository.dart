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

  RealmResults<Shift> findShiftsById(ObjectId parentId) {
    const query = r'''
      parentId == $0
    ''';
    final queryParameter = parentId;
    return state.query<Shift>(query, [queryParameter]);
  }

  Shift? login(String secretPin) {
        const query = r'''
      (startTime <= $0 ||
      endTime => $0) &&
      secretPin == $1
    ''';

    final DateTime now = DateTime.now().toUtc();
    List<Object> queryParameter = [now, secretPin];
    final results = state.query<Shift>(query, [...queryParameter]);
    if (results.isEmpty) {
      return null;
    }

    Shift shift = results.first;
    if (shift.status != "OPEN") {
      state.write(() {
        shift.status = "OPEN";
        shift.openTime = now;
      });
    }
    
    return shift;
  }

  void logout(ObjectId id) {
    final shift = state.find<Shift>(id);
    if (shift == null) {
      return;
    }

    state.write(() {
      shift.status = "CLOSED";
      shift.closeTime = DateTime.now().toUtc();
    });
  }

  void _deleteShifts(ObjectId parentId) {
    const query = r'''
      parentId == $0 &&
      status == "SCHEDULED"
    ''';
    final queryParameter = parentId;
    final shifts = state.query<Shift>(query, [queryParameter]);

    state.write(() {
      state.deleteMany(shifts);
    });
  }

  void _generateShifts(ParentShift parentShift) {
    final startDate = parentShift.startDate.toLocal();
    final endDate = parentShift.endDate.toLocal();
    final daysToGenerate = endDate.difference(startDate).inDays + 1;
    final days = List.generate(daysToGenerate, (i) => startDate.add(Duration(days: i)));

    _deleteShifts(parentShift.id);
    state.write(() {
      for (var day in days) {
        final startTime = DateTime(day.year, day.month, day.day,
          parentShift.startTime.toLocal().hour, parentShift.startTime.toLocal().minute);
        final endShift = parentShift.startTime.toLocal().hour >= parentShift.endTime.toLocal().hour ?
          day.add(const Duration(days: 1)) : day;
        final endTime = DateTime(endShift.year, endShift.month, endShift.day,
          parentShift.endTime.toLocal().hour, parentShift.endTime.toLocal().minute);

        final shift = Shift(
          ObjectId(),
          parentShift.id,
          parentShift.name,
          startTime,
          endTime,
          "SCHEDULED",
          parentShift.secretPin,
        );

        const query = r'''
          parentId == $0 &&
          startTime == $1 &&
          endTime == $2 &&
          status != "SCHEDULED"
        ''';
        final queryParameter = [shift.parentId, shift.startTime, shift.endTime];
        final results = state.query<Shift>(query, [...queryParameter]);
        if (results.isEmpty) {
            state.add(shift, update: true);
        }
      }
    });
  }

  Future<void> create(ParentShift parentShift) async{
    state.write(() {
      state.add(parentShift, update: true);
    });
    _generateShifts(parentShift);
  }

  Future<void> delete(ParentShift parentShift) async{
    state.write(() {
      state.delete(parentShift);
    });
  }
}
