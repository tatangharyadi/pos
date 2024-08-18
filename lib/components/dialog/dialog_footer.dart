import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {

  const DialogFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: MediaQuery.of(context).size.width * 0.5,
      child: const Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            side: BorderSide.none,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
          )
        )
    );
  }
}