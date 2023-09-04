import 'package:flutter/material.dart';

import '/core/core.dart';

CardTheme? _lightCardTheme = CardTheme(
  color: LTColors.background,
  shadowColor: LTColors.secondary,
  elevation: AppSize.elevation04,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.r04),
  ),
);

CardTheme? get lightCardTheme => _lightCardTheme;