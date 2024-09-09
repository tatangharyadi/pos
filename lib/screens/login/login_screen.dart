import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/navbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/services/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _username, _password;

  void _onSubmit() {
    final auth = ref.read(authServiceProvider.notifier);
    auth.signin(email: _username, password: _password);
  }

    @override
  void initState() {
    super.initState();
    _username = '';
    _password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
                        name: 'username',
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        onChanged: (value) {
                          if (value == null) return;
                            setState(() {
                            _username = value.toString();
                          });
                        },
                      ),
                      const Gap(5),
                      FormBuilderTextField(
                        name: 'password',
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          if (value == null) return;
                            setState(() {
                            _password = value.toString();
                          });
                        },
                      ),
                    ]
                  )
                )
              )
            )
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          _onSubmit();
          context.go(context.namedLocation(
              'home',
            )
          );
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,          
    );
  }
}