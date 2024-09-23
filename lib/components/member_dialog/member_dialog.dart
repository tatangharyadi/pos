import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/member/member_repository.dart';

class MemberDialog extends ConsumerStatefulWidget {

  const MemberDialog({super.key});

  @override
  ConsumerState<MemberDialog> createState() => _MemberDialogState();
}

class _MemberDialogState extends ConsumerState<MemberDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    final memberId = _formKey.currentState!.fields['memberId']!.value as String;
    final memberRepository = ref.read(memberRepositoryProvider.notifier);
    memberRepository.getById(memberId);
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
            title: "Member ID",
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'memberId',
                          decoration: const InputDecoration(
                            hintText: 'Type or scan member ID',
                          ),
                          initialValue: '',
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
          const DialogFooter(),
        ],
      )
    );
  }
}
