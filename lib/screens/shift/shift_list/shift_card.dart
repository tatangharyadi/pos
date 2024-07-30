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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,              
                  children: [
                    Text(dayShift.dayShift),
                    Row(
                      children: [
                        const Icon(Icons.paid, size: 12),
                        Text(dayShift.totalSales.toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,              
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.request_quote_rounded),                  
                      onPressed: (){},
                      label: const Text('')),
                  ],
                ),
              ],
            ),
            Expanded(
              child:
                ListView.builder(
                  itemCount: shifts.length,
                  itemBuilder: (context, index) {
                    Shift shift = shifts[index];

                    late IconData icon;
                    switch (shift.status) {
                      case 'CLOSE':
                        icon = Icons.event_busy_rounded;
                      break;
                      case 'OPEN':
                        icon = Icons.event_rounded;
                      break;
                      default:
                        icon = Icons.calendar_today_rounded;
                    }

                    return ListTile(
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      leading: Icon(icon),
                      title: Row(
                        children: [
                          Text(
                            shift.shift,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            shift.totalSales.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}