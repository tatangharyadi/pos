import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/screens/terminal/terminal_form/member/member_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/member/member_repository.dart';

class MemberPanel extends ConsumerWidget {
  const MemberPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberRepositoryProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MemberBar(),
        const Gap(5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                        member.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(member.email ?? 'no email'),
                      Text(member.phone ?? 'no phone'),
                      const Gap(12),
                      Text(
                        'Credit Benefit',
                        style: Theme.of(context).textTheme.labelLarge
                      ),
                      Text(member.creditBenefit.cycle),
                      Text(member.creditBenefit.limit.toString()),
                      Text(member.creditBenefit.balance.toString()),
                      Text(member.creditBenefit.transactionTimestamp.toString()),                      
                    ],
                  ),
                ),
              const Gap(5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Campaigns',
                        style: Theme.of(context).textTheme.labelLarge
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}