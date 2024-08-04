import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/shift/shift_model.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:realm/realm.dart';

class ShiftCalendar extends ConsumerWidget {
  final String id; 

  const ShiftCalendar(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    final objectId = (id != 'new') ? ObjectId.fromHexString(id) : ObjectId();
    final selected = shiftRepository.findById(objectId);
    final results = selected?.shifts ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Expanded(
        child: DataTable(
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headingRowColor: WidgetStateColor.resolveWith((states) => Colors.grey[800]!),
          columns: const<DataColumn> [
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Start'),
            ),
            DataColumn(
              label: Text('End'),
            ),
            DataColumn(
              label: Text('Secret Pin'),
            ),
            DataColumn(
              label: Text('Status'),
            ),
            DataColumn(
              label: Text('Open'),
            ),
            DataColumn(
              label: Text('Close'),
            ),
            DataColumn(
              label: Text('Total Sales'),
            ),
          ],
          rows: List<DataRow>.generate(
            results.length,
            (index) {
              Shift shift = results[index];
      
              late IconData icon;
              switch (shift.status) {
                case 'CLOSE' || 'REOPENED':
                  icon = Icons.event_busy_rounded;
                break;
                case 'OPEN':
                  icon = Icons.event_rounded;
                break;
                default:
                  icon = Icons.calendar_today_rounded;
              }
      
              return DataRow(
                cells: [
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          icon,
                        ),
                        const Gap(5),
                        Text(
                          shift.name,
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      DateFormat("yyyy-MM-dd kk:mm").format(shift.startTime.toLocal()),
                    ),
                  ),
                  DataCell(
                    Text(
                      DateFormat("yyyy-MM-dd kk:mm").format(shift.endTime.toLocal()),
                    ),
                  ),
                  DataCell(
                    Text(
                      shift.secretPin,
                    ),
                  ),
                  DataCell(
                    Text(
                      shift.status,
                    ),
                  ),
                  DataCell(
                    Text(
                      shift.openTime == null ?
                      '' :
                      DateFormat("yyyy-MM-dd kk:mm").format(shift.openTime!.toLocal()),
                    ),
                  ),
                  DataCell(
                    Text(
                      shift.closeTime == null ?
                      '' :
                      DateFormat("yyyy-MM-dd kk:mm").format(shift.closeTime!.toLocal()),
                    ),
                  ),                
                  DataCell(
                    Text(
                      shift.totalSales.toString(),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ),
    );
  }
}

