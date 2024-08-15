import 'package:flutter/material.dart';
import 'package:pos/screens/terminal/terminal_form/payment/payment_type_form.dart';
import 'package:pos/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/consts/payment_type.dart';

class PaymentGrid extends ConsumerStatefulWidget {
  final String orderId;

  const PaymentGrid({super.key, required this.orderId});

  @override
  ConsumerState<PaymentGrid> createState() => _PaymentGridState();
}

class _PaymentGridState extends ConsumerState<PaymentGrid> {
  @override
  Widget build(BuildContext context) {
    List<PaymentType> paymentTypes = PaymentType.paymentTypes;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemCount: paymentTypes.length,
      itemBuilder: (context, index) {
        PaymentType paymentType = paymentTypes[index];

        return GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return PaymentTypeForm(paymentName: paymentType.name, icon: paymentType.icon,
                  paymentType: paymentType.type, orderId: widget.orderId);
              },
            );
          },
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: tileBackground,
              leading: Icon(paymentType.icon, size: 15),
              title: Text(
                paymentType.name,
                maxLines: 2,
                softWrap: true,
              ),
            ),
            child: const InkWell(),
          ),
        );
      }
    );
  }
}
