import 'package:flutter/material.dart';

import '/config/config.dart';
import '/core/core.dart';

ElevatedButtonThemeData? _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // elevated button default width and height
      fixedSize: Size(AppSize.ws343, AppSize.hs48),
      textStyle: getTitleMedium(),

      // .. styling colors
      foregroundColor:
          Func.isSystemDarkMode() ? DTColors.text : LTColors.surface,
      disabledForegroundColor:
          Func.isSystemDarkMode() ? DTColors.secondary : LTColors.secondary,
      disabledBackgroundColor:
          Func.isSystemDarkMode() ? DTColors.outline : LTColors.outline,
      backgroundColor:
          Func.isSystemDarkMode() ? DTColors.primary : LTColors.primary,
      surfaceTintColor:
          Func.isSystemDarkMode() ? DTColors.background : LTColors.surface,

      // elevated button default shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        side: BorderSide(
          width: AppSize.ws02,
          color: Func.isSystemDarkMode() ? DTColors.primary : LTColors.primary,
        ),
      ),
    ),
  );
}

ElevatedButtonThemeData? get elevatedButtonTheme => _elevatedButtonTheme();
