import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/theme.dart';

class DialogButtons extends StatelessWidget {
  final Function onClickOk;
  final Function onClickCancel;

  const DialogButtons({super.key, required this.onClickOk, required this.onClickCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onClickCancel();
                    },
                    child: const Text('CANCEL'),
                  ),
                  const Gap(5),
                  ElevatedButton(
                    onPressed: () {
                      onClickOk();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}