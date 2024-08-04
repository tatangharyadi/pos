import 'package:pos/services/realm_service.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  DayShift? findById(ObjectId? id) {
    DayShift? dayShift = _realm.find<DayShift>(id);
    return dayShift;
  }

  Future<void> create(DayShift dayShift) async{
    state.write(() {
      state.add(dayShift, update: true);
    });
  }

  Future<void> delete(DayShift dayShift) async{
    state.write(() {
      state.delete(dayShift);
    });
  }
}
