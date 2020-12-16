import 'package:flutter/material.dart';

class AppColors {
  static const yellow = Color(0xFFFDD252);
  static const purple = Color(0xFF8A78E4);
  static final red = Colors.red[100];

  static final theme = ThemeData(
    brightness: Brightness.dark,
    applyElevationOverlayColor: true,
    canvasColor: purple,
    primaryColor: purple,
    scaffoldBackgroundColor: purple,
    backgroundColor: purple,
    dialogBackgroundColor: purple,
    accentColor: yellow,
    accentColorBrightness: ThemeData.estimateBrightnessForColor(yellow),
    toggleableActiveColor: yellow,
    errorColor: red,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
  );
}
