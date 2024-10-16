import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/member/member_repository.dart';
import 'package:pos/models/payment/payment_model.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/models/redemption/redemption_repository.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:realm/realm.dart';

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
  late String _voucher, _message;
  late Future<String> _redeem;
  
  Future<String> redeemVoucher() async {
    final member = ref.read(memberRepositoryProvider);
    final redemption  = ref.read(redemptionRepositoryProvider.notifier);
    return await redemption.redeem(
      _voucher,
      widget.orderId,
      member.id,
      _amount
      );
  }

  @override
  void initState() {
    super.initState();

    _amount = ref.read(totalDueProvider) >= 0 ? ref.read(totalDueProvider) : 0;

    if (widget.paymentName == 'Voucher') {
      return;
    } 
    
    _voucher = widget.paymentName;
    _redeem = redeemVoucher();
  }

  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    if(_message != 'SUCCEEDED') {
       context.pop();
        return;
    }

    final payment = Payment(
      ObjectId(),
      ObjectId.fromHexString(widget.parentId),
      ObjectId.fromHexString(widget.orderId),
      'voucher',
      DateTime.now().toUtc(),
      _voucher,
      amount: _amount,
    );

    final paymentRepository = ref.read(paymentRepositoryProvider.notifier);
    paymentRepository.create(payment);
    ref.read(totalDueProvider.notifier).decrement(_amount);

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
                        initialValue: _voucher,
                        onChanged: (value) {
                          if (value == null) return;
                        },
                      ),
                      const Gap(10),

                      FutureBuilder(
                        future: _redeem,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            _message = 'Error: ${snapshot.error}';
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          _message = snapshot.data ?? 'No message';
                          return Text(snapshot.data ?? 'No message');
                        }
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
