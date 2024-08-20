import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/states/shift_auth/shift_auth_provider.dart';


class LoginShiftDialog extends ConsumerStatefulWidget {
  const LoginShiftDialog({super.key});

  @override
  ConsumerState<LoginShiftDialog> createState() => _LoginShiftDialogState();
}

class _LoginShiftDialogState extends ConsumerState<LoginShiftDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _pin;
  
  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    final shiftAuth = ref.read(shiftAuthProvider.notifier);
    shiftAuth.login(_pin);
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _pin = '';
  }

  @override
  Widget build(BuildContext context) {
    print("Here");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DialogHeader(
            icon: Icons.pin,
            title: "Shift Login",
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
                          name: 'secretPin',
                          decoration: const InputDecoration(
                            hintText: 'Secret Pin',
                          ),
                          initialValue: '',
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          onChanged: (value) {
                            if (value == null) return;
                              setState(() {
                              _pin = value.toString();
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()])
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
