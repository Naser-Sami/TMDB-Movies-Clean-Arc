import 'package:flutter/material.dart';

import '/core/core.dart';

CardTheme? _darkCardTheme = CardTheme(
  color: DTColors.background,
  shadowColor: DTColors.secondary,
  elevation: AppSize.elevation04,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.r04),
  ),
);

CardTheme? get darkCardTheme => _darkCardTheme;