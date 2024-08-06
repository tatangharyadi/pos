import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/models/shift/shift_model.dart';
import 'package:realm/realm.dart';

class ShiftChildForm extends ConsumerStatefulWidget {
  final String id;

  const ShiftChildForm({super.key, required this.id, required String subId});

  @override
  ConsumerState<ShiftChildForm> createState() => _ShiftChildFormState();
}

class _ShiftChildFormState extends ConsumerState<ShiftChildForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late ObjectId _objectId;  

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    DateTime now = DateTime.now();
    Shift shift = Shift(
      ObjectId(),
      'SHIFT06',
      DateTime(now.year, now.month, now.day, 10, 00).toUtc(),
      DateTime(now.year, now.month, now.day, 15, 00).toUtc(),
      "SCHEDULE",
      '369');

    context.pop(shift); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Hours: ${widget.id}'),
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
          _submit(); 
        },
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    );
  }
}
