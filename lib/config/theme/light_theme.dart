import 'package:flutter/material.dart';

import '../config.dart';

ThemeData _lightTheme = ThemeData(
  // ... M3
  useMaterial3: true,

  // .. system brightness
  brightness: Brightness.light,

  // .. system colors
  colorScheme: lightColorScheme,

  // .. text styling
  textTheme: textTheme,

  // .. app bar theme
  appBarTheme: lightAppBarTheme,

  // .. elevated button theme
  elevatedButtonTheme: elevatedButtonTheme,

  // .. text fields decoration
  inputDecorationTheme: decorationTheme,

  // .. card theme
  cardTheme: lightCardTheme,

);

ThemeData get lightTheme => _lightTheme;
