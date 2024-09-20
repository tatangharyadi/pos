import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/member/member_api.dart';

class MemberDialog extends ConsumerStatefulWidget {

  const MemberDialog({super.key});

  @override
  ConsumerState<MemberDialog> createState() => _MemberDialogState();
}

class _MemberDialogState extends ConsumerState<MemberDialog> {
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    final dio = Dio();
    final memberApi = MemberApi(dio);
    memberApi.getMember('GPAS-123', 'AIzaSyCf2k5jFzmZemeutSKGVHrNAuX3sqhsfeM').then((value) {
      print(value.name);
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DialogHeader(
            icon: Icons.card_membership,
            title: "Scan member ID",
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
