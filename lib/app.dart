import 'package:flutter/material.dart';
import 'package:pos/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'configs/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'POS',
      theme: appThemeData(),
      routerConfig: goRouter
    );
  }
}