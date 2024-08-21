import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:pos/models/shift/shift_model.dart';

class ShiftCard extends ConsumerWidget {
  final ParentShift object;

  const ShiftCard({super.key, required this.object});

  void _delete(ref, ParentShift object) {
    final shiftRepository = ref.watch(shiftRepositoryProvider.notifier);
    shiftRepository.delete(object);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startTime = DateFormat("HH:mm").format(object.startTime.toLocal());
    final endTime = DateFormat("HH:mm").format(object.endTime.toLocal());
    final startDate = DateFormat("yyyy-MM-dd").format(object.startDate.toLocal());
    final endDate = DateFormat("yyyy-MM-dd").format(object.endDate.toLocal());

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,              
                  children: [
                    Text(object.name),
                    Text('$startTime - $endTime'),
                    Row(
                      children: [
                        Text('$startDate - $endDate'),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,              
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete_rounded),                  
                          onPressed: (){_delete(ref, object);},
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}