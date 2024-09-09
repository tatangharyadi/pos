import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PaymentQrisDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String orderId;
  final String parentId;

  const PaymentQrisDialog({super.key, required this.paymentName, required this.icon,
    required this.orderId, required this.parentId});

  @override
  ConsumerState<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends ConsumerState<PaymentQrisDialog> {
  String _message = '';

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message = message.notification?.body ?? 'No message body';
      });
    });
  }

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
          Container(
            child: Material(
              child: Text("Test FCM: $_message")
            )
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
