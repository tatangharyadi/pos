import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/auth_service.dart';
import 'package:pos/screens/login/login_screen.dart';
import 'package:pos/screens/home/home_screen.dart';
import 'package:pos/screens/setting/setting_screen.dart';
import 'package:pos/screens/product/product_screen.dart';
import 'package:pos/screens/product/product_detail/product_detail_screen.dart';
import 'package:pos/screens/sales/sales_screen.dart';
import 'package:pos/screens/shift/shift_screen.dart';
import 'package:pos/screens/shift/shift_form/shift_form.dart';
import 'package:pos/screens/terminal/terminal_screen.dart';
import 'package:pos/screens/terminal/terminal_form/terminal_form.dart';
import 'package:pos/screens/terminal/order_list/order_grid.dart';

part 'app_router.g.dart';

@riverpod
  GoRouter goRouter(GoRouterRef ref) {
  final appState = ref.watch(appServiceProvider);
  final user = ref.watch(authServiceProvider);

  return GoRouter (
    initialLocation: '/',
    redirect: (context, state) {
      if (appState.isLoading || appState.hasError) {
        if(foundation.kDebugMode && appState.isLoading) {
          print('DEBUG: isLoading');
        }
        if(foundation.kDebugMode && appState.hasError) {
          print('DEBUG: hasError');
        }
        return '/';
      }
      if (user == null) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
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
        builder: (context, state) => const TerminalScreen(),
        routes: [
          GoRoute(
            path: 'detail/:orderType/:parentId/:id',
            name: 'terminal_form',
            builder: (context, state) => TerminalForm(
              parentId: state.pathParameters['parentId']!,
              id: state.pathParameters['id']!,
              orderType: state.pathParameters['orderType']!,
            ),
          ),
          GoRoute(
            path: 'order/:parentId',
            name: 'terminal_order',
            builder: (context, state) => OrderGrid(
              parentId: state.pathParameters['parentId']!,
            ),
          )
        ], 
      ),
      GoRoute(
        path: '/product',
        name: 'product',
        builder: (context, state) => const ProductScreen(),
        routes: [
          GoRoute(
            path: 'detail/:id',
            name: 'product_detail',
            builder: (context, state) => ProductDetail(
              id: state.pathParameters['id']!,
            ),
          )
        ], 
      ),
            GoRoute(
        path: '/sales',
        name: 'sales',
        builder: (context, state) => const SalesScreen(),
        // routes: [
        //   GoRoute(
        //     path: 'sales/:id',
        //     name: 'sales_detail',
        //     builder: (context, state) => SalesDetail(
        //       id: state.pathParameters['id']!,
        //     ),
        //   )
        // ], 
      ),
      GoRoute(
        path: '/shift',
        name: 'shift',
        builder: (context, state) => const ShiftScreen(),
        routes: [
          GoRoute(
            path: 'detail/:id',
            name: 'shift_form',
            builder: (context, state) => ShiftForm(
              id: state.pathParameters['id']!,
            ), 
          )
        ],
      ),
      GoRoute(
        path: '/setting',
        name: 'setting',
        builder: (context, state) => const SettingScreen(),
      ),
    ],
  );
}