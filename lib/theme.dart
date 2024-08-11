import 'package:flutter/material.dart';

appThemeData() {
  return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      );
}

final tileBackground = Colors.green.shade900.withOpacity(0.7);

const dismissibleBackground = Colors.red;