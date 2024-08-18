import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/payment/payment_model.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:realm/realm.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();
  late double _amount;
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    final payment = Payment(
      ObjectId(),
      'CASH',
      DateTime.now().toUtc(),
     'CASH',
     ObjectId.fromHexString(widget.orderId),
      amount: _amount,
    );

    final paymentRepository = ref.read(paymentRepositoryProvider.notifier);
    paymentRepository.create(payment);
    ref.read(totalDueProvider.notifier).decrement(_amount);

    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _amount = 0;
  }

  @override
  Widget build(BuildContext context) {
    _amount = ref.watch(totalDueProvider) >= 0 ? ref.watch(totalDueProvider) : 0;
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
                      Text('Order ID: ${widget.orderId}',),
                      const Gap(5),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'amount',
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            prefixText: 'IDR',
                          ),
                          initialValue: _amount.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value == null) return;
                            if (double.tryParse(value) == null) return;
                              setState(() {
                              _amount = double.parse(value);
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()])
                        )
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
