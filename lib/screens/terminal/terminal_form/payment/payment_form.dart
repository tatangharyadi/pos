import 'package:flutter/material.dart';
import 'package:pos/components/dialog/stateful_dialog/stateful_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentForm extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String paymentType;
  final String orderId;

  const PaymentForm({super.key, required this.paymentName, required this.icon,
    required this.paymentType, required this.orderId});

  @override
  ConsumerState<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends ConsumerState<PaymentForm> {
  late StatefulDialog statefulDialog;

  Widget _buildMembership() {
    return Row (
      children: [
        Text(
          'Member ID:',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,),
        ),
      ],
    );
  }

  Widget _buildQris() {
    return Container (
    );
  }

  Widget _buildEdc() {
    return Container (
    );
  }

  Widget _buildCash() {
    return Container (
    );
  }

  Widget _buildVoucher() {
    return Container (
    );
  }

  Widget _build() {
    switch (widget.paymentType) {
      case 'MEMBERSHIP':
        return _buildMembership();
      case 'QRIS':
        return _buildQris();
      case 'EDC':
        return _buildEdc();
      case 'CASH':
        return _buildCash();
      case 'VOUCHER':
        return _buildVoucher();
      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    statefulDialog = StatefulDialog(
      paymentName: widget.paymentName,
      icon: widget.icon,
      paymentType: widget.paymentType,
      orderId: widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return statefulDialog;
  }
}
