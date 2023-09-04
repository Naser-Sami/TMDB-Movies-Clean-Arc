import 'package:flutter/material.dart';

import '/core/core.dart';
import '/config/config.dart';

// Input Decoration Theme
InputDecorationTheme _decorationTheme = InputDecorationTheme(
  // .. content padding
  contentPadding: EdgeInsets.all(AppPadding.p08),

  // .. hint style
  hintStyle: getLabelLarge(),
  labelStyle: getLabelLarge(),
  errorStyle: getLabelLarge(),

  // enabled border style
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color:
            Func.isSystemDarkMode() ? DTColors.secondary : LTColors.secondary,
        width: AppSize.ws01),
    borderRadius: BorderRadius.all(
      Radius.circular(AppRadius.r08),
    ),
  ),

  // focused border style
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Func.isSystemDarkMode() ? DTColors.primary : LTColors.primary,
        width: AppSize.ws01),
    borderRadius: BorderRadius.all(
      Radius.circular(AppRadius.r08),
    ),
  ),

  // error border style
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Func.isSystemDarkMode() ? DTColors.error : LTColors.error,
        width: AppSize.ws01),
    borderRadius: BorderRadius.all(
      Radius.circular(AppRadius.r08),
    ),
  ),

  // focused border style
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Func.isSystemDarkMode() ? DTColors.primary : LTColors.primary,
        width: AppSize.ws01),
    borderRadius: BorderRadius.all(
      Radius.circular(AppRadius.r08),
    ),
  ),

);


InputDecorationTheme get decorationTheme => _decorationTheme;