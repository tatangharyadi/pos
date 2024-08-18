import 'package:flutter/material.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentEdcDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String orderId;

  const PaymentEdcDialog({super.key, required this.paymentName, required this.icon,
    required this.orderId});

  @override
  ConsumerState<PaymentEdcDialog> createState() => _PaymentEdcDialogState();
}

class _PaymentEdcDialogState extends ConsumerState<PaymentEdcDialog> {
  
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
