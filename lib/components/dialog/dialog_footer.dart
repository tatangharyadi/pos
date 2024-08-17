import 'package:flutter/material.dart';
import 'package:pos/theme.dart';

class DialogFooter extends StatelessWidget {

  const DialogFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(28),
      decoration: const BoxDecoration(
        color: dialogContentBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
    );
  }
}