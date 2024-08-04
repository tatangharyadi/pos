import 'package:flutter/material.dart';
import 'package:pos/theme.dart';
import 'configs/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'POS',
      theme: appThemeData(),
      routerConfig: router
    );
  }
}