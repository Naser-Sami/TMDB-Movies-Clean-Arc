
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '/core/core.dart';

class Func {

  // handel the theme brightness
  static bool isDarkMode = false;
  static Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static bool isSystemDarkMode() {
    return isDarkMode = brightness == Brightness.dark;
  }

  // FOR SVG ICONS
  static String getIconSVG(String name) {
    return '${Constants.pathSystemIcons}$name.svg';
  }
}