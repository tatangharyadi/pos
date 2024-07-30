import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/screens/home/home_screen.dart';
import 'package:pos/screens/shift/shift_form/shift_form.dart';
import 'package:pos/screens/terminal/terminal_screen.dart';
import 'package:pos/screens/product/product_screen.dart';
import 'package:pos/screens/shift/shift_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/terminal',
      name: 'terminal',
      builder: (BuildContext context, GoRouterState state) {
        return const TerminalScreen();
      },
    ),
    GoRoute(
      path: '/product',
      name: 'product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: '/shift',
      name: 'shift',
      builder: (context, state) => const ShiftScreen(),
      routes: [
        GoRoute(
          path: 'detail/:id',
          name: 'shift_detail',
          builder: (context, state) => ShiftForm(
            id: state.pathParameters['id']!,
          )
        )
      ],
    ),
  ],
);