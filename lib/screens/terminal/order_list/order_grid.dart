import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/components/widgets.dart';
import 'package:pos/screens/terminal/order_list/order_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:pos/models/order/order_repository.dart';
import 'package:pos/models/order/order_model.dart';

@override
class OrderGrid extends ConsumerWidget {
  const OrderGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(orderRepositoryProvider);

    return StreamBuilder<RealmResultsChanges<ParentOrder>>(
      stream: realm.query<ParentOrder>('TRUEPREDICATE SORT(_id ASC)')
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
              ParentOrder parentOrder = results[index];
              return GestureDetector(
                onTap: () {
                  // context.go(context.namedLocation(
                  //     'shift_detail',
                  //     pathParameters: {
                  //       'id': dayShift.id.toString(),
                  //     }
                  //   )
                  // );
                },
                child: OrderCard(parentOrder: parentOrder));
            } else {return Container();}
          },
        );
      },
    );
  }
}