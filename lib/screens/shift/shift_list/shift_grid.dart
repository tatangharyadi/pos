import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/screens/shift/shift_list/shift_card.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/models/shift/shift_model.dart';

@override
class ShiftGrid extends ConsumerWidget {
  const ShiftGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(shiftRepositoryProvider);
    RealmResults<DayShift> dayShifts;

    dayShifts = realm.all<DayShift>();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemCount: dayShifts.length,
      itemBuilder: (context, index) {
        DayShift dayShift = dayShifts[index];
        return ShiftCard(dayShift);
      },
    );
  }
}