import 'package:flutter/material.dart';

import '/core/core.dart';

ColorScheme? _darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: DTColors.primary,
  onPrimary: DTColors.surface,
  secondary: DTColors.secondary,
  onSecondary: DTColors.surface,
  error: DTColors.error,
  onError: DTColors.surface,
  background: DTColors.background,
  onBackground: DTColors.primary,
  surface: DTColors.surface,
  onSurface: DTColors.secondary,
);

ColorScheme? get darkColorScheme => _darkColorScheme;