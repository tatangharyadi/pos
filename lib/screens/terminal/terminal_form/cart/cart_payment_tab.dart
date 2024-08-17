import 'package:flutter/material.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/models/payment/payment_model.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_payment_cart.dart';
import 'package:realm/realm.dart';

class CartPaymentTab extends ConsumerWidget {
  const CartPaymentTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Realm realm = ref.watch(paymentRepositoryProvider);

    return StreamBuilder<RealmResultsChanges<Payment>>(
      stream: realm.query<Payment>('TRUEPREDICATE SORT(_id ASC)')
          .changes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {return progressIndicator();}
        
        final results = snapshot.data?.results;
        if (results == null || results.isEmpty) {
          return Container();
        }
        
      return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final Payment payment = results[index];
                
            return CartPaymentCard(payment);
          },
        );
      },
    );
  }
}
