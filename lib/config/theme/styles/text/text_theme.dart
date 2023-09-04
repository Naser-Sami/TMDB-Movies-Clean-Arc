// text theme style for light theme and dark theme
import 'package:flutter/material.dart';

import '../../theme.dart';

TextTheme? _textTheme = TextTheme(
  displayLarge: getDisplayLarge(),
  displayMedium: getDisplayMedium(),
  displaySmall: getDisplaySmall(),

  headlineLarge: getHeadlineLarge(),
  headlineMedium: getHeadlineMedium(),
  headlineSmall: getHeadlineSmall(),

  titleLarge: getTitleLarge(),
  titleMedium: getTitleMedium(),
  titleSmall: getTitleSmall(),

  labelLarge: getLabelLarge(),
  labelMedium: getLabelMedium(),
  labelSmall: getLabelSmall(),

  bodyLarge: getBodyLarge(),
  bodyMedium: getBodyMedium(),
  bodySmall: getBodySmall(),
);

TextTheme? get textTheme => _textTheme;