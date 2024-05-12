import 'package:flutter/material.dart';

import 'colors_schema.dart';

class AppThemes {
  // singleton
  AppThemes._internal();
  static final AppThemes _instance = AppThemes._internal();
  factory AppThemes() => _instance;

  changeCustomScheme(String color, Brightness brightness) {
    final hexColors = int.parse(color, radix: 16);
    final Color colors = Color(hexColors);

    selectedSchema = const AppColorScheme().fromColor(colors, brightness);
  }

  changeBrightness(Brightness brightness) {
    selectedSchema =
        const AppColorScheme().fromColor(selectedSchema.primary, brightness);
  }

  AppColorScheme selectedSchema = const AppColorScheme(
    brightness: Brightness.light,
    background: Colors.white,
    primary: Color(0xff031851),
    onPrimary: Color(0xff1036E2),

  );
}
