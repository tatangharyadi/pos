import 'package:flutter/material.dart';
import 'package:pos/consts/payment_option.dart';
import 'package:pos/components/payment_dialog/payment_member_dialog.dart';
import 'package:pos/components/payment_dialog/payment_edc_dialog.dart';
import 'package:pos/components/payment_dialog/payment_qris_dialog.dart';
import 'package:pos/components/payment_dialog/payment_cash_dialog.dart';
import 'package:pos/components/payment_dialog/payment_voucher_dialog.dart';

class PaymentGrid extends StatelessWidget {
  final String orderId;
  final String parentId;

  const PaymentGrid({super.key, required this.orderId, required this.parentId});

  @override
  Widget build(BuildContext context) {
    List<PaymentOption> paymentOptions = PaymentOption.paymentOptions;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemCount: paymentOptions.length,
      itemBuilder: (context, index) {
        PaymentOption paymentOption = paymentOptions[index];

        return GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                switch (paymentOption.type) {
                  case PaymentType.member:
                    return PaymentMemberDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: orderId,
                      parentId: parentId,
                    );
                  case PaymentType.qris:
                    return PaymentQrisDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: orderId,
                      parentId: parentId,
                    );
                   case PaymentType.edc:
                    return PaymentEdcDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: orderId,
                      parentId: parentId,
                    );
                  case PaymentType.cash:
                    return PaymentCashDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: orderId,
                      parentId: parentId,
                    );
                  case PaymentType.voucher:
                    return PaymentVoucherDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: orderId,
                      parentId: parentId,
                    );
                  default:
                    return Container();
                }
              },
            );
          },
          child: GridTile(
            child: InkWell(
              child: Column(
                children: [
                  Icon(
                    paymentOption.icon,
                    size: 50,
                  ),
                  Text(paymentOption.name),
                ],),
            ),
          ),
        );
      }
    );
  }
}
