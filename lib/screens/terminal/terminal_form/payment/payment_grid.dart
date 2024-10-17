import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/consts/payment_option.dart';
import 'package:pos/components/payment_dialog/payment_member_dialog.dart';
import 'package:pos/components/payment_dialog/payment_edc_dialog.dart';
import 'package:pos/components/payment_dialog/payment_qris_dialog.dart';
import 'package:pos/components/payment_dialog/payment_cash_dialog.dart';
import 'package:pos/components/payment_dialog/payment_voucher_dialog.dart';
import 'package:pos/models/member/member_repository.dart';

class PaymentGrid extends ConsumerStatefulWidget {
  final String orderId;
  final String parentId;

  const PaymentGrid({super.key, required this.orderId, required this.parentId});

  @override
  ConsumerState<PaymentGrid> createState() => _PaymentGridState();
}

class _PaymentGridState extends ConsumerState<PaymentGrid> {
  late List<PaymentOption> _payments;

  @override
  void initState() {
    super.initState();

    _payments = List.from(PaymentOption.paymentOptions);
    final vouchers = ref.read(memberRepositoryProvider).vouchers;
    for (var voucher in vouchers) {
      _payments.add(PaymentOption(
        Icons.loyalty,
        voucher.code,
        PaymentType.voucher,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemCount: _payments.length,
      itemBuilder: (context, index) {
        PaymentOption paymentOption = _payments[index];

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
                      orderId: widget.orderId,
                      parentId: widget.parentId,
                    );
                  case PaymentType.qris:
                    return PaymentQrisDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: widget.orderId,
                      parentId: widget.parentId,
                    );
                   case PaymentType.edc:
                    return PaymentEdcDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: widget.orderId,
                      parentId: widget.parentId,
                    );
                  case PaymentType.cash:
                    return PaymentCashDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: widget.orderId,
                      parentId: widget.parentId,
                    );
                  case PaymentType.voucher:
                    return PaymentVoucherDialog(
                      paymentName: paymentOption.name,
                      icon: paymentOption.icon,
                      orderId: widget.orderId,
                      parentId: widget.parentId,
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
