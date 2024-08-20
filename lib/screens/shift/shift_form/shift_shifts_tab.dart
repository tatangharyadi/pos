import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_model.dart';
import 'package:pos/models/shift/shift_repository.dart';

class ShiftShiftsTab extends ConsumerStatefulWidget {
  final String id; 

  const ShiftShiftsTab({super.key, required this.id});

  @override
  ConsumerState<ShiftShiftsTab> createState() => _ShiftShiftsTabState();
}

class _ShiftShiftsTabState extends ConsumerState<ShiftShiftsTab> {
  late ObjectId _objectId;

  ObjectId _new() {
    return ObjectId();
  }

  void _delete(RealmList<Shift> rows, ObjectId objectId) {
    setState(() {
      rows.realm.write(() {
        rows.removeWhere((element) => element.id == objectId);
      });
    });
  }

  DataTable _buildTable(RealmList<Shift> shifts) {
    final List<Map<String, dynamic>> header = [
      {"title": "Start", "numeric": false},
      {"title": "End", "numeric": false},
      {"title": "Status", "numeric": false},
      {"title": "Total Sales", "numeric": true},
      {"title": "Actions", "numeric": false},
    ];

    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      showCheckboxColumn: true,
      columns: header.map((item) {
          return DataColumn(
            label: Text(item['title']),
            numeric: item['numeric'],
          );
        }).toList(),

      rows: List<DataRow>.generate(
        shifts.length, (index) {
          Shift shift = shifts[index];

          final startTime = shift.status == 'SCHEDULED' ?
            DateFormat("yyyy-MM-dd kk:mm").format(shift.startTime.toLocal()) :
            DateFormat("yyyy-MM-dd kk:mm").format(shift.openTime!.toLocal());
          final endTime = shift.status == 'SCHEDULED' || shift.status == 'OPEN' ?
            DateFormat("yyyy-MM-dd kk:mm").format(shift.endTime.toLocal()) :
            DateFormat("yyyy-MM-dd kk:mm").format(shift.closeTime!.toLocal());

          return DataRow(
            key: ValueKey(shift.id),
            cells: [
              DataCell(
                Text(
                  startTime,
                  style: TextStyle(
                    fontStyle: shift.status == 'SCHEDULED' ? FontStyle.italic : FontStyle.normal,
                    color: shift.status == 'SCHEDULED' ? inactiveText : activeText,
                  ),
                ),
              ),
              DataCell(
                Text(
                  endTime,
                  style: TextStyle(
                    fontStyle: shift.status == 'SCHEDULED' || shift.status == 'OPEN' ?
                      FontStyle.italic : FontStyle.normal,
                    color: shift.status == 'SCHEDULED' || shift.status == 'OPEN' ?
                      inactiveText : activeText,
                  ),
                ),
              ),
              DataCell(
                Text(
                  shift.status,
                ),
              ),              
              DataCell(
                Text(
                  shift.totalSales.toString(),
                ),
              ),
              DataCell(
                Visibility(
                  visible: shift.status == 'SCHEDULED',
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _delete(shifts, shift.id);
                    },
                  ),
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
    final parentShift = shiftRepository.findById(_objectId);
    final shifts = parentShift?.shifts ?? RealmList<Shift>([]);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Shifts'),
          _buildTable(shifts),
        ],
      );
  }
}

