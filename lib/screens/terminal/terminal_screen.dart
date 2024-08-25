import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/login_dialog/login_shift_dialog.dart';
import 'package:pos/screens/terminal/order_list/order_panel.dart';
import 'package:pos/consts/order_option.dart';
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
  final _overlayController = OverlayPortalController();
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
    List<OrderOption> orderOptions = OrderOption.orderOptions;
    final shiftAuth = ref.watch(shiftAuthProvider);
    _isShift = shiftAuth.state == ShiftAuthOption.shift ? true : false;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: Row(
        children: [
          const Expanded(
            child: OrderPanel(),
          ),
          OverlayPortal(
            controller: _overlayController,
            overlayChildBuilder: (BuildContext context) {
              return Positioned(
                bottom: 80,
                left: MediaQuery.of(context).size.width * 0.38,
                child: Row(
                  children: orderOptions.map((option) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Theme.of(context).colorScheme.primary,
                        elevation: 7,
                        shape: const CircleBorder(),
                        child: IconButton(
                          color: Theme.of(context).colorScheme.onSecondary,
                          iconSize: 48,
                          icon: Icon(option.icon),
                          onPressed: () {
                            context.go(context.namedLocation(
                              'terminal_form',
                              pathParameters: {
                                'orderType': option.type,
                                'parentId':'new',
                                'id':'new',
                              }
                            ));  
                          },
                        ),
                      ),
                    ),
                ).toList(),
              ));
            },
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 40,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: _overlayController.toggle,
        child: const Icon(Icons.add),
        ),
    );
  }
}
