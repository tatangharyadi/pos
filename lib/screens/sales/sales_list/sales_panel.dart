import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/screens/sales/sales_list/sales_grid.dart';

class SalesPanel extends ConsumerStatefulWidget {
  const SalesPanel({super.key});

  @override
  ConsumerState<SalesPanel> createState() => _ProductPanelState();
}

class _ProductPanelState extends ConsumerState<SalesPanel> {
  
  @override
  Widget build(BuildContext context) {
    
    return const SingleChildScrollView(
      child: Column(
          children: [
            Row(
              children: [
                SalesGrid(),
              ],
            )
          ],
      ),
    );
  }
}