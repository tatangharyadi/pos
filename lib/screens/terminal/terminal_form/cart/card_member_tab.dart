import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/components/member_dialog/member_dialog.dart';

class CartMemberTab extends ConsumerWidget {
  const CartMemberTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const MemberDialog();
                }
              );
            },
            child: const Text('Member ID'),)
        ]
      ),
    );
  }
}