import 'package:pos/models/shift/shift_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:realm/realm.dart';
import 'package:pos/services/realm_service.dart';
import 'package:pos/models/shift/v2/shift_model.dart';

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

  Future<void> create(ParentShift parentShift) async{
    state.write(() {
      state.add(parentShift, update: true);

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
        state.add(shift, update: true);
      }  
    });
  }

  Future<void> delete(ParentShift parentShift) async{
    state.write(() {
      state.delete(parentShift);
    });
  }
}
