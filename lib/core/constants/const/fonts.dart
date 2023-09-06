
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class SystemFontFamily {
  static const String fontFamily = Constants.primaryFont;
}

class FontWeightManager {
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w900;
}

class FontSize {
  static double s06 = 06.0.sp;
  static double s08 = 08.0.sp;
  static double s10 = 10.0.sp;
  static double s12 = 12.0.sp;
  static double s14 = 14.0.sp;
  static double s16 = 16.0.sp;
  static double s17 = 17.0.sp;
  static double s18 = 18.0.sp;
  static double s20 = 20.0.sp;
  static double s22 = 22.0.sp;
  static double s24 = 24.0.sp;
  static double s30 = 30.0.sp;
  static double s32 = 32.0.sp;

  // displays
  static double displayLarge = 57;
  static double displayMedium = 45;
  static double displaySmall = 36;

  // header
  static double headlineLarge = 32;
  static double headlineMedium = 28;
  static double headlineSmall = 24;

  // title
  static double titleLarge = 22;
  static double titleMedium = 16;
  static double titleSmall = 14;

  // label
  static double labelLarge = 14;
  static double labelMedium = 12;
  static double labelSmall = 11;

  // body
  static double bodyLarge = 16;
  static double bodyMedium = 14;
  static double bodySmall = 12;
}