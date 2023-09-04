import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/config.dart';
import '/core/core.dart';

AppBarTheme? _darkAppBarTheme = AppBarTheme(
  centerTitle: true,
  color: DTColors.background,
  elevation: AppSize.elevationZero,
  scrolledUnderElevation: AppSize.elevationZero,
  shadowColor: DTColors.secondary,
  titleTextStyle: getTitleMedium(),
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
);

AppBarTheme? get darkAppBarTheme => _darkAppBarTheme;