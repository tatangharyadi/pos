import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftCard extends ConsumerWidget {
  final DayShift dayShift;

  const ShiftCard(this.dayShift, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(shiftRepositoryProvider);
    final selected = realm.find<DayShift>(dayShift.id);

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
                    Text(dayShift.name),
                    Row(
                      children: [
                        Text(DateFormat("yyyy-MM-dd").format(dayShift.dateShift.toLocal())),
                        const Gap(5),
                        const Icon(Icons.paid, size: 12),
                        Text(dayShift.totalSales.toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,              
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.request_quote_rounded),                  
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_rounded),                  
                          onPressed: (){
                            ref.read(shiftRepositoryProvider.notifier).deleteDayShift(dayShift);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child:
                ListView.builder(
                  itemCount: selected!.shifts.length,
                  itemBuilder: (context, index) {
                    Shift shift = selected.shifts[index];

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
                            shift.name,
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