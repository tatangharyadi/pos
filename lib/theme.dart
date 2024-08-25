import 'package:flutter/material.dart';

appThemeData() {
  return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      );
}

final tileBackground = Colors.green.shade900.withOpacity(0.7);
final listTileBackground = Colors.green.shade900.withOpacity(0.1);
final buttonBackground = Colors.green.shade900.withOpacity(0.7);

const dismissibleBackground = Colors.red;

final dialogTitleBackground = Colors.green.shade900;
const dialogContentBackground = Colors.white;

const activeText = Colors.black;
const inactiveText = Colors.grey;