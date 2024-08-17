import 'package:flutter/material.dart';
import 'package:pos/theme.dart';
import 'package:pos/consts/payment_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/components/payment_dialog/payment_member_dialog.dart';
import 'package:pos/components/payment_dialog/payment_edc_dialog.dart';
import 'package:pos/components/payment_dialog/payment_qris_dialog.dart';
import 'package:pos/components/payment_dialog/payment_cash_dialog.dart';
import 'package:pos/components/payment_dialog/payment_voucher_dialog.dart';

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
                switch (paymentType.type) {
                  case 'MEMBER':
                    return PaymentMemberDialog(
                      paymentName: paymentType.name,
                      icon: paymentType.icon,
                      orderId: widget.orderId,
                    );
                  case 'QRIS':
                    return PaymentQrisDialog(
                      paymentName: paymentType.name,
                      icon: paymentType.icon,
                      orderId: widget.orderId,
                    );
                   case 'EDC':
                    return PaymentEdcDialog(
                      paymentName: paymentType.name,
                      icon: paymentType.icon,
                      orderId: widget.orderId,
                    );
                  case 'CASH':
                    return PaymentCashDialog(
                      paymentName: paymentType.name,
                      icon: paymentType.icon,
                      orderId: widget.orderId,
                    );
                  case 'VOUCHER':
                    return PaymentVoucherDialog(
                      paymentName: paymentType.name,
                      icon: paymentType.icon,
                      orderId: widget.orderId,
                    );
                  default:
                    return Container();
                }
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
