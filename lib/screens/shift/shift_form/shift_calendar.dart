import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/models/shift/shift_model.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:realm/realm.dart';

class ShiftCalendar extends ConsumerStatefulWidget {
  final String id; 

  const ShiftCalendar({super.key, required this.id});

    @override
  ConsumerState<ShiftCalendar> createState() => _ShiftCalendarState();
}

class _ShiftCalendarState extends ConsumerState<ShiftCalendar> {
  late ObjectId _objectId;

  ObjectId _new() {
    return ObjectId();
  }

  DataTable _buildTable(List<dynamic> shifts) {
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
        shifts.length, (index) {
          Shift shift = shifts[index];

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
  void initState() {
    super.initState();
    _objectId = (widget.id != 'new') ? ObjectId.fromHexString(widget.id) : _new();
  }  

  @override
  Widget build(BuildContext context) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    final dayShift = shiftRepository.findById(_objectId);
    final shifts = dayShift?.shifts ?? RealmList<Shift>([]);

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
                onPressed: () async {
                  final result = await context.push(context.namedLocation(
                      'shift_subdetail',
                      pathParameters: {
                        'id': widget.id.toString(),
                        'subId': 'new',
                      }
                    )
                  ) as Shift;
                  setState(() {
                    shifts.realm.write(() {
                      shifts.add(result);
                    });
                  });
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                _buildTable(shifts),
            ),
          ),
        ],
      ),
    );
  }
}

