import 'package:flutter/material.dart';

import '/core/core.dart';

ColorScheme? _lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: LTColors.primary,
  onPrimary: LTColors.surface,
  secondary: LTColors.secondary,
  onSecondary: LTColors.surface,
  error: LTColors.error,
  onError: LTColors.surface,
  background: LTColors.background,
  onBackground: LTColors.primary,
  surface: LTColors.surface,
  onSurface: LTColors.secondary,
);

ColorScheme? get lightColorScheme => _lightColorScheme;