import 'package:flutter/material.dart';
import 'package:pos/screens/terminal/terminal_form/member/member_bar.dart';

class MemberPanel extends StatelessWidget {
  const MemberPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MemberBar(),
        Text('Member Panel')
      ],
    );
  }
}