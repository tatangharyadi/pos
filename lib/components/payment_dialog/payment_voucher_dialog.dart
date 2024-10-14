import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/states/total_due/total_due_provider.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();
  late double _amount;
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    _amount = ref.watch(totalDueProvider) >= 0 ? ref.watch(totalDueProvider) : 0;
    final voucher = widget.paymentName == 'Voucher' ? '' : widget.paymentName;
    
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
                child: FormBuilder(
                  key: _formKey,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
                        name: 'voucher',
                        decoration: const InputDecoration(
                          labelText: 'Voucher Code',
                          hintText: 'Enter voucher code',
                        ),
                        initialValue: voucher,
                        onChanged: (value) {
                          if (value == null) return;
                        },
                      ),
                    ],
                  ),
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
