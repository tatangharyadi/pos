import 'package:flutter/material.dart';
import 'package:pos/components/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/models/payment/payment_model.dart';
import 'package:pos/screens/terminal/terminal_form/cart/cart_payment_cart.dart';
import 'package:realm/realm.dart';

class CartPaymentTab extends ConsumerWidget {
  final String orderId;

  const CartPaymentTab({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const query = r'''
      orderId == $0
    ''';
    
    Realm realm = ref.watch(paymentRepositoryProvider);
    final queryParameter = ObjectId.fromHexString(orderId);

    return StreamBuilder<RealmResultsChanges<Payment>>(
      stream: realm.query<Payment>(query, [queryParameter]).changes,
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
