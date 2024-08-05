import 'package:flutter/material.dart';

class CustomColors {
  static MaterialColor primary = createMaterialColor(const Color(0xFF6590FF));
  static MaterialColor accent = createMaterialColor(const Color(0xFFFF7373));
  static MaterialColor lightText = createMaterialColor(const Color(0xFF4E4E4E));
  static MaterialColor lightAccentBackground = createMaterialColor(const Color(0xFFFFEFEF));
  static MaterialColor lightBackground = createMaterialColor(const Color(0xFFF9F9F9));
  static MaterialColor lightBody = createMaterialColor(const Color(0xFFFFFFFF));
  static MaterialColor lightCard = createMaterialColor(const Color(0xFFE4E4E4));
  static MaterialColor lightPremium = createMaterialColor(const Color(0xFFFFFFFF));
  static MaterialColor lightItem = createMaterialColor(const Color(0x48D1E3FF));
  static MaterialColor lightItemText = createMaterialColor(const Color(0xFF6B6BFF));
  static MaterialColor lightItemSubText = createMaterialColor(const Color(0xFF3D3D86));
  static MaterialColor darkText = createMaterialColor(const Color(0xFF959595));
  static MaterialColor darkBackground = createMaterialColor(const Color(0xFF171717));
  static MaterialColor darkAccentBackground = createMaterialColor(const Color(0xFF4D4040));
  static MaterialColor darkBody = createMaterialColor(const Color(0xFF1D1D1D));
  static MaterialColor darkPremiumLeft = createMaterialColor(const Color(0xFF171717));
  static MaterialColor darkPremiumRight = createMaterialColor(const Color(0xFF282828));
  static MaterialColor darkCard = createMaterialColor(const Color(0xFF1D1D1D));
  static MaterialColor darkItem = createMaterialColor(const Color(0x48303748));
  static MaterialColor darkItemText = createMaterialColor(const Color(0xFFA4A4CF));
  static MaterialColor darkItemSubText = createMaterialColor(const Color(0xFFEDEDFF));

  static ColorScheme lightmode = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: lightBody,
    secondary: lightBackground,
    onSecondary: lightText,
    error: accent,
    onError: lightAccentBackground,
    surface: lightBody,
    onSurface: lightText,
    tertiary: lightPremium,
    tertiaryContainer: lightPremium,
    outlineVariant: darkText,
    outline: primary,
    secondaryContainer: lightCard,
    surfaceContainer: lightItem,
    surfaceContainerHigh: lightItemText,
    surfaceContainerLow: lightItemSubText,
  );

  static ColorScheme darkmode = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: darkBody,
    secondary: darkBackground,
    onSecondary: darkText,
    error: accent,
    onError: darkAccentBackground,
    surface: darkBody,
    onSurface: darkText,
    tertiary: darkPremiumLeft,
    tertiaryContainer: darkPremiumRight,
    outlineVariant: lightText,
    outline: primary,
    secondaryContainer: darkCard,
    surfaceContainer: darkItem,
    surfaceContainerHigh: darkItemText,
    surfaceContainerLow: darkItemSubText,
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}