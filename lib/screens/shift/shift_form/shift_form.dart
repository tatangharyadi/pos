import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/screens/shift/shift_form/shift_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftForm extends ConsumerStatefulWidget {
  final String id;

  const ShiftForm({super.key, required this.id});

  @override
  ConsumerState<ShiftForm> createState() => _ShiftFormState();
}

class _ShiftFormState extends ConsumerState<ShiftForm>
  with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  final _formKey = GlobalKey<FormBuilderState>();
  late ObjectId _objectId;
  late ParentShift _initialValue;

  ObjectId _new() {
    ObjectId objectId = ObjectId();
    
    final now = DateTime.now();
    _initialValue = ParentShift(
      objectId,
      'new',
      DateTime(0, 0, 0, 9, 0),
      DateTime(0, 0, 0, 17, 0),
      DateTime(now.year, now.month, now.day, 0, 0),
      DateTime(now.year, now.month, now.day, 0, 0),
      '123',
    );

    return objectId;
  }

  void _submit() {
    final ParentShift parentShift = ParentShift(
      _objectId,
      _formKey.currentState!.fields['shiftName']!.value.toString(),
      _formKey.currentState!.fields['startTime']!.value as DateTime,
      _formKey.currentState!.fields['endTime']!.value as DateTime,
      _formKey.currentState!.fields['startDate']!.value as DateTime,
      _formKey.currentState!.fields['endDate']!.value as DateTime,
      _formKey.currentState!.fields['secretPin']!.value.toString(),
    );

    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    shiftRepository.create(parentShift);
  }

  @override
  void initState() {
    super.initState();
    _objectId = (widget.id != 'new') ? ObjectId.fromHexString(widget.id) : _new();
  }

  @override
  Widget build(BuildContext context) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    var parentShift = shiftRepository.findById(_objectId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shift: ${widget.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                        initialValue: parentShift?.name ?? _initialValue.name,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderDateTimePicker(
                              name: 'startTime',
                              decoration: const InputDecoration(
                                labelText: 'Start Time',
                              ),
                              inputType: InputType.time,
                              format: DateFormat('HH:mm'),
                              initialValue: parentShift?.startTime.toLocal() ??
                                _initialValue.startTime,
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
                              initialValue: parentShift?.endTime.toLocal() ??
                                _initialValue.endTime,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderDateTimePicker(
                              name: 'startDate',
                              decoration: const InputDecoration(
                                labelText: 'Start Date',
                              ),
                              inputType: InputType.date,
                              format: DateFormat('yyyy-MM-dd'),
                              initialValue: parentShift?.startDate.toLocal() ??
                                _initialValue.startDate,
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            child: FormBuilderDateTimePicker(
                              name: 'endDate',
                              decoration: const InputDecoration(
                                labelText: 'End Date',
                              ),
                              inputType: InputType.date,
                              format: DateFormat('yyyy-MM-dd'),
                              initialValue: parentShift?.endDate.toLocal() ??
                                _initialValue.endDate,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      FormBuilderTextField(
                        name: 'secretPin',
                        decoration: const InputDecoration(
                          labelText: 'Secret Pin',
                        ),
                        initialValue: parentShift?.secretPin ?? _initialValue.secretPin,
                      ),
                      const Gap(30),
                      ShiftGrid(id: _objectId.toString())
                    ],
                  ),
                ),
              ),
            ),
          ],
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