import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentTypeForm extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String paymentType;
  final String orderId;

  const PaymentTypeForm({super.key, required this.paymentName, required this.icon,
    required this.paymentType, required this.orderId});

  @override
  ConsumerState<PaymentTypeForm> createState() => _PaymentTypeFormState();
}

class _PaymentTypeFormState extends ConsumerState<PaymentTypeForm> {

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
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: dialogTitleBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: Theme.of(context).colorScheme.onPrimary,),
                  const Gap(5),
                  Text(
                    widget.paymentType,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,),
                  ),
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.7) / 1.5,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: dialogContentBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _build(),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                      const Gap(5),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
