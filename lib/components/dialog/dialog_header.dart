import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DialogHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const DialogHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Material(
          color: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            side: BorderSide.none,
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.onPrimary,),
              const Gap(5),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}