import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Cashier'),
          accountEmail: Text('cashier@yummycorp.com'),
          currentAccountPicture: CircleAvatar(),
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
          leading: const Icon(Icons.edit_calendar),
          title: const Text('Shift'),
          onTap: () {
            return context.go(
              context.namedLocation('shift'),
            );
          },
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sign out'),
        ),
      ],
    );
  }
}