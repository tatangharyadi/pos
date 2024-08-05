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

  DataTable _buildTable(List<dynamic> results) {
    final List<Map<String, dynamic>> header = [
      {"title": "Name", "numeric": false},
      {"title": "Start", "numeric": false},
      {"title": "End", "numeric": false},
      {"title": "Secret Pin", "numeric": false},
      {"title": "Status", "numeric": false},
      {"title": "Open", "numeric": false},
      {"title": "Close", "numeric": false},
      {"title": "Total Sales", "numeric": true},
    ];

    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      columns: header.map((item) {
          return DataColumn(
            label: Text(item['title']),
            numeric: item['numeric'],
          );
        }).toList(),

      rows: List<DataRow>.generate(
        results.length, (index) {
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
            key: ValueKey(shift.id),
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
    );  // Build the table
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    final objectId = (id != 'new') ? ObjectId.fromHexString(id) : ObjectId();
    final selected = shiftRepository.findById(objectId);
    final results = selected?.shifts ?? [];

    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Shift Hours'),
            pinned: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                _buildTable(results),
            ),
          ),
        ],
      ),
    );
  }
}

