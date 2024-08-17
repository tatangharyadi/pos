import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/theme.dart';

class PaymentCashDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String orderId;

  const PaymentCashDialog({super.key, required this.paymentName, required this.icon,
    required this.orderId});

  @override
  ConsumerState<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends ConsumerState<PaymentCashDialog> {
  
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
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ID: ${widget.orderId}',),
                    const Gap(5),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'amount',
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          prefixText: 'IDR',
                        ),
                        readOnly: true,
                        initialValue: '100000',)
                    ),
                  ],
                ),
              ),
            ),
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
