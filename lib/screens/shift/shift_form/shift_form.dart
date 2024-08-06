import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/screens/shift/shift_form/shift_calendar.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftForm extends ConsumerStatefulWidget {
  final String id;

  const ShiftForm({super.key, required this.id});

  @override
  ConsumerState<ShiftForm> createState() => _ShiftFormState();
}

class _ShiftFormState extends ConsumerState<ShiftForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late ObjectId _objectId;  

  @override
  void initState() {
    super.initState();
    _objectId = (widget.id != 'new') ? ObjectId.fromHexString(widget.id) : _new();
  }

  ObjectId _new() {
    DayShift dayShift = DayShift(
      ObjectId(),
      'new',
      DateTime.now(),
      totalSales: 0.0,
    );

    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    shiftRepository.create(dayShift);

    return dayShift.id;
  }

  void _submit() {
    DayShift dayShift = DayShift(
      _objectId,
      _formKey.currentState!.fields['shiftName']!.value.toString(),
      DateTime.now(),
      totalSales: 0.0,
    );

    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    shiftRepository.create(dayShift);
  }

  @override
  Widget build(BuildContext context) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    final selected = shiftRepository.findById(_objectId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shift: ${widget.id}'),
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
                  initialValue: selected?.name ?? '',
                ),
                const Gap(5),
                FormBuilderDateTimePicker(
                  name: 'dateShift',
                  decoration: const InputDecoration(
                    labelText: 'Shift Date',
                  ),
                  inputType: InputType.date,
                  format: DateFormat('yyyy-MM-dd'),
                  initialValue: selected?.dateShift ?? DateTime.now(),
                ),
                const Gap(5),
                ShiftCalendar(id: _objectId.toString()),
            ],
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
          _submit();
          context.go(context.namedLocation('shift'));  
        },
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,       
    );
  }
}