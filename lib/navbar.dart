import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/services/auth_service.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  void _signOut(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider.notifier);
    authService.signout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String accountEmail;

    accountEmail = 'Signin';
    final authService = ref.watch(authServiceProvider);
    if (authService != null) {
      accountEmail = authService.email!;
    }

    return NavigationDrawer(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(''),
          accountEmail: Text(accountEmail),
          currentAccountPicture: const CircleAvatar(),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            return context.go(
              context.namedLocation('home'),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.point_of_sale),
          title: const Text('Terminal'),
          onTap: () {
            return context.go(
              context.namedLocation('terminal'),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.production_quantity_limits),
          title: const Text('Product'),
          onTap: () {
            return context.go(
              context.namedLocation('product'),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.task),
          title: const Text('Sales'),
          onTap: () {
            return context.go(
              context.namedLocation('sales'),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_calendar),
          title: const Text('Shift'),
          onTap: () {
            return context.go(
              context.namedLocation('shift'),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            return context.go(
              context.namedLocation('setting'),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sign out'),
          onTap: () => _signOut(context, ref),
        ),
      ],
    );
  }
}