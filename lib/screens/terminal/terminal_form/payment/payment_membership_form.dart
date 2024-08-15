import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/theme.dart';
import 'package:go_router/go_router.dart';

class PaymentMembershipForm extends StatelessWidget {
  final String orderId;
  const PaymentMembershipForm({super.key, required this.orderId});

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
                  Icon(Icons.card_membership, color: Theme.of(context).colorScheme.onPrimary,),
                  const Gap(5),
                  Text(
                    'Membership',
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
                  Row(
                    children: [
                      Text(
                        'Member ID:',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryFixed,),
                      ),
                    ],
                  ),
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
