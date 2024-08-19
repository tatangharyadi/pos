import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  void _selectedRow(bool value, Shift row) {
    setState(() {
      row.realm.write(() {
        row.selected = value;
      });
    });
  }

  void _deleteSelected(RealmList<Shift> rows) {
    setState(() {
      rows.realm.write(() {
        rows.removeWhere((element) => element.selected);
      });
    });
  }

  DataTable _buildTable(List<dynamic> shifts) {
    final List<Map<String, dynamic>> header = [
      {"title": "Start", "numeric": false},
      {"title": "End", "numeric": false},
      {"title": "Status", "numeric": false},
      {"title": "Open", "numeric": false},
      {"title": "Close", "numeric": false},
      {"title": "Total Sales", "numeric": true},
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

          return DataRow(
            key: ValueKey(shift.id),
            cells: [
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
            selected: shift.selected,
            onSelectChanged: (value) => _selectedRow(value!, shift),
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
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('Shifts'),
                pinned: true,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteSelected(shifts),
                  )
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
        ),
      ],
    );
  }
}

