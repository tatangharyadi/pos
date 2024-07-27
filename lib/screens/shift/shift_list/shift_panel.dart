import 'package:flutter/material.dart';
import 'package:pos/screens/shift/shift_list/shift_grid.dart';

class ShiftPanel extends StatelessWidget {
  const ShiftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          Expanded(
            child: ShiftGrid()
          )
        ],
    );
  }
}