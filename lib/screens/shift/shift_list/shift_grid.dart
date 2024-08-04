import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/shift/shift_repository.dart';
import 'package:realm/realm.dart';
import 'package:pos/screens/shift/shift_list/shift_card.dart';
import 'package:pos/models/shift/shift_model.dart';

@override
class ShiftGrid extends ConsumerWidget {
  const ShiftGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Realm realm = ref.watch(realmServiceProvider);
      Realm realm = ref.watch(shiftRepositoryProvider);

    return StreamBuilder<RealmResultsChanges<DayShift>>(
      stream: realm.query<DayShift>("TRUEPREDICATE SORT(_id ASC)")
          .changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: results.realm.isClosed ? 0 :  results.length,
          itemBuilder: (context, index) {
            if (results[index].isValid) {
              DayShift dayShift = results[index];
              return GestureDetector(
                onTap: () {
                  context.go(context.namedLocation(
                      'shift_detail',
                      pathParameters: {
                        'id': dayShift.id.toString(),
                      }
                    )
                  );
                },
                child: ShiftCard(dayShift));
            } else {return Container();}
          },
        );
      },
    );
  }
}