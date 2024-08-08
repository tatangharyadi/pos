import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductNavBar extends StatelessWidget {
  const ProductNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Cashier'),
          accountEmail: Text('cashier@pos.com'),
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
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Product'),
          onTap: () {
            // return context.go(
            //   context.namedLocation('terminal'),
            // );
          },
        ),
        ListTile(
          leading: const Icon(Icons.production_quantity_limits),
          title: const Text('Availability'),
          onTap: () {
            return context.go(
              context.namedLocation('product'),
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