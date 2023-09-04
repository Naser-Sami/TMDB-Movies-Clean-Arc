import 'package:flutter/material.dart';

import '../config.dart';

ThemeData _darkTheme = ThemeData(
  // ... M3
  useMaterial3: true,

  // .. system brightness
  brightness: Brightness.dark,

  // .. system colors
  colorScheme: darkColorScheme,

  // .. text styling
  textTheme: textTheme,

  // .. app bar theme
  appBarTheme: darkAppBarTheme,

  // .. elevated button theme
  elevatedButtonTheme: elevatedButtonTheme,

  // .. text fields decoration
  inputDecorationTheme: decorationTheme,

  // .. card theme
  cardTheme: darkCardTheme,

);

ThemeData get darkTheme => _darkTheme;
