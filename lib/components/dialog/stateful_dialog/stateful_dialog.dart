import 'package:flutter/material.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatefulDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String paymentType;
  final String orderId;

  const StatefulDialog({super.key, required this.paymentName, required this.icon,
    required this.paymentType, required this.orderId});

  @override
  ConsumerState<StatefulDialog> createState() => StatefulDialogState();
}

class StatefulDialogState extends ConsumerState<StatefulDialog> {
  
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
          const DialogHeader(
            icon: Icons.payment,
            title: 'Payment',
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
