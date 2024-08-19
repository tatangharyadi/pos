import 'package:realm/realm.dart';

part 'shift_model.realm.dart';

@RealmModel()
@MapTo("shifts")
class _Shift {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String name;
  late DateTime startTime;
  late DateTime endTime;
  late DateTime? openTime;
  late DateTime? closeTime;
  late String status;
  late String secretPin;

  late double totalSales = 0.0;

  late bool selected = false;
}

@RealmModel()
@MapTo("parentShifts")
class _ParentShift {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String name;
  late DateTime startTime;
  late DateTime endTime;
  late DateTime startDate;
  late DateTime endDate;
  late String secretPin;

  late List<_Shift> shifts;
} 