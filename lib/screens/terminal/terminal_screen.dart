import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/login_dialog/login_shift_dialog.dart';
import 'package:pos/screens/terminal/order_list/order_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/states/shift/shift_auth_provider.dart';

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
    setState(() {
      _isShift = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shiftAuth = ref.watch(shiftAuthProvider);
    _isShift = shiftAuth == ShiftAuthState.shift ? true : false;

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
              const Text("shift"),
              const Gap(5),
              Switch(
                value: _isShift, 
                onChanged: (value){
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const LoginShiftDialog();
                    }
                  );
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
 