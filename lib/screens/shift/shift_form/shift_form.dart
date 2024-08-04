import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/services/realm_service.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    DayShift dayShift = DayShift(
      ObjectId(),
      _formKey.currentState!.fields['shiftName']!.value.toString(),
      DateTime.now(),
      totalSales: 0.0,
    );

    Realm realm = ref.watch(realmServiceProvider);
    realm.write(() {
      realm.add(dayShift);
    });
  }

  @override
  Widget build(BuildContext context) {
    Realm realm = ref.watch(realmServiceProvider);
    final objectId = (widget.id != 'new') ? ObjectId.fromHexString(widget.id) : null;
    final selected = realm.find<DayShift>(objectId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shift: ${widget.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
                FormBuilderTextField(
                  name: 'shiftName',
                  decoration: const InputDecoration(
                    labelText: 'Shift Name',
                  ),
                  initialValue: selected?.name ?? '',
                ),
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