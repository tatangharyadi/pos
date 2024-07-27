import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftCard extends ConsumerWidget {
  final DayShift dayShift;

  const ShiftCard(this.dayShift, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(shiftRepositoryProvider);
    RealmResults<Shift> shifts;

    shifts = realm.all<Shift>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dayShift.dayShift),
        Text(dayShift.totalSales.toString()),
        const Gap(5),
        Expanded(
          child:
            ListView.builder(
              itemCount: shifts.length,
              itemBuilder: (context, index) {
                Shift shift = shifts[index];
                return Row(
                  children: [
                    Text(shift.shift),
                  ]
                  );
              },
            ),
        ),
      ],
    );
  }
}