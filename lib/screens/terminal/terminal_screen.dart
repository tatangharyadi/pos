import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/login_dialog/login_shift_dialog.dart';
import 'package:pos/screens/terminal/order_list/order_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/states/shift_auth/shift_auth_model.dart';
import 'package:pos/states/shift_auth/shift_auth_provider.dart';

class TerminalScreen extends ConsumerStatefulWidget {
  const TerminalScreen({super.key});

  @override
  ConsumerState<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends ConsumerState<TerminalScreen> {
  late bool _isShift;

  @override
  void initState() {
    super.initState();
    _isShift = false;
  }

  void _onShiftChange(bool value) {
    final shiftAuth = ref.watch(shiftAuthProvider.notifier);
    shiftAuth.logout();
  }

  @override
  Widget build(BuildContext context) {
    final shiftAuth = ref.watch(shiftAuthProvider);
    _isShift = shiftAuth.state == ShiftAuthOption.shift ? true : false;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: const Row(
        children: [
          Expanded(
            child: OrderPanel()
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 50,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(shiftAuth.id),
              const Gap(5),
              Switch(
                value: _isShift, 
                onChanged: (value){
                  if(!_isShift) {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LoginShiftDialog();
                      }
                    );
                  } else {_onShiftChange(value);}
                }
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
            context.go(context.namedLocation(
                'terminal_form',
                pathParameters: {
                  'id':'new',
                  'parentId':'new',
                }
            )
          );      
        },
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,          
    );
  }
}
 