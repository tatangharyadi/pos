import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartMemberTab extends ConsumerWidget {
  const CartMemberTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Member ID')
        ]
      ),
    );
  }
}