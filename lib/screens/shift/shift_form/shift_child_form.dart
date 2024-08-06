import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftChildForm extends ConsumerStatefulWidget {
  final String id;
  final String subId;

  const ShiftChildForm({super.key, required this.id, required this.subId});

  @override
  ConsumerState<ShiftChildForm> createState() => _ShiftChildFormState();
}

class _ShiftChildFormState extends ConsumerState<ShiftChildForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late ObjectId _parentId;  

  Shift _submit() {
    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    final dayShift = shiftRepository.findById(_parentId);
    final startTime = _formKey.currentState!.fields['startTime']!.value as DateTime;
    final endTime = _formKey.currentState!.fields['endTime']!.value as DateTime;

    final startDate = DateTime(
      dayShift!.dateShift.year, 
      dayShift.dateShift.month, 
      dayShift.dateShift.day, 
      startTime.hour, startTime.minute);

    DateTime endDate = DateTime(
      dayShift.dateShift.year, 
      dayShift.dateShift.month, 
      dayShift.dateShift.day, 
      endTime.hour, endTime.minute);

    if (endDate.isBefore(startDate)) {
      endDate = endDate.add(const Duration(days: 1));
    }

    Shift shift = Shift(
      ObjectId(),
      _formKey.currentState!.fields['shiftName']!.value.toString(),
      startDate,
      endDate,
      "SCHEDULE",
      _formKey.currentState!.fields['secretPin']!.value.toString());

      return shift;
  }

  @override
  void initState() {
    super.initState();
    _parentId = ObjectId.fromHexString(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    final dayShift = shiftRepository.findById(_parentId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Hours: ${widget.subId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                FormBuilderTextField(
                  name: 'shiftName',
                  decoration: const InputDecoration(
                    labelText: 'Shift Name',
                  ),
                ),
                const Gap(5),
                FormBuilderTextField( 
                  name: 'secretPin',
                  decoration: const InputDecoration(
                    labelText: 'Secret Pin',
                  ),
                ),
                const Gap(5),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'startTime',
                        decoration: InputDecoration(
                          labelText: '${DateFormat('yyyy-MM-dd').format(dayShift!.dateShift)} Start Time',
                        ),
                        inputType: InputType.time,
                        format: DateFormat('HH:mm'),
                      ),
                    ),
                    const Gap(5),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        name: 'endTime',
                        decoration: const InputDecoration(
                          labelText: 'End Time',
                        ),
                        inputType: InputType.time,
                        format: DateFormat('HH:mm'),
                      ),
                    ),
                  ],
                ),
            ]
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          context.pop(_submit()); 
        },
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    );
  }
}
