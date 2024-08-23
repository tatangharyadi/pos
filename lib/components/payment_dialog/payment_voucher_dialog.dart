import 'package:flutter/material.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentVoucherDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String orderId;
  final String parentId;

  const PaymentVoucherDialog({super.key, required this.paymentName, required this.icon,
    required this.orderId, required this.parentId});

  @override
  ConsumerState<PaymentVoucherDialog> createState() => _PaymentVoucherDialogState();
}

class _PaymentVoucherDialogState extends ConsumerState<PaymentVoucherDialog> {
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogHeader(
            icon: widget.icon,
            title: widget.paymentName,
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
