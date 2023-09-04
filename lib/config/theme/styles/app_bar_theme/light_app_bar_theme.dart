import 'package:flutter/material.dart';

import '/config/config.dart';
import '/core/core.dart';

AppBarTheme? _lightAppBarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: LTColors.background,
  foregroundColor: LTColors.text,
  elevation: AppSize.elevationZero,
  scrolledUnderElevation: AppSize.elevationZero,
  shadowColor: LTColors.secondary,
  titleTextStyle: getTitleMedium(color: LTColors.text),
  toolbarTextStyle: getTitleMedium(color: LTColors.text),
  // systemOverlayStyle: const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   systemNavigationBarColor: Colors.black,
  //   systemNavigationBarDividerColor: Colors.black,
  //   statusBarBrightness: Brightness.dark,
  //   systemNavigationBarIconBrightness: Brightness.dark,
  //   systemStatusBarContrastEnforced: true,
  //   systemNavigationBarContrastEnforced: true,
  // ),
);

AppBarTheme? get lightAppBarTheme => _lightAppBarTheme;