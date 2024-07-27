import 'package:realm/realm.dart';

part 'shift_model.realm.dart';

@RealmModel()
class _Shift {
  @PrimaryKey()
  late final String shift;
  late final String dayShift;
  late final String status;

  late final String secretPin;
  late final double totalSales;
}

@RealmModel()
class _DayShift {
  @PrimaryKey()
  late final String dayShift;

  late final double totalSales;
}