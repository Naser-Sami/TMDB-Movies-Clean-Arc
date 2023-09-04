
import 'package:clean_architecture_structure/core/core.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: SystemFontFamily.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getDisplayLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.displayLarge,
    fontWeight ?? FontWeightManager.bold,
    color,
  );
}

TextStyle getDisplayMedium(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.displayMedium,
    fontWeight ?? FontWeightManager.medium,
    color,
  );
}

TextStyle getDisplaySmall(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.displaySmall,
    fontWeight ?? FontWeightManager.regular,
    color,
  );
}

TextStyle getHeadlineLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.headlineLarge,
    fontWeight ?? FontWeightManager.bold,
    color,
  );
}

TextStyle getHeadlineMedium(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.headlineMedium,
    fontWeight ?? FontWeightManager.medium,
    color,
  );
}

TextStyle getHeadlineSmall(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.headlineSmall,
    fontWeight ?? FontWeightManager.regular,
    color,
  );
}

TextStyle getTitleLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.titleLarge,
    fontWeight ?? FontWeightManager.bold,
    color,
  );
}

TextStyle getTitleMedium(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.titleMedium,
    fontWeight ?? FontWeightManager.medium,
    color,
  );
}

TextStyle getTitleSmall(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.titleSmall,
    fontWeight ?? FontWeightManager.regular,
    color,
  );
}

TextStyle getLabelLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.labelLarge,
    fontWeight ?? FontWeightManager.bold,
    color,
  );
}

TextStyle getLabelMedium(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.labelMedium,
    fontWeight ?? FontWeightManager.medium,
    color,
  );
}

TextStyle getLabelSmall(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.labelSmall,
    fontWeight ?? FontWeightManager.regular,
    color,
  );
}

TextStyle getBodyLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.bodyLarge,
    fontWeight ?? FontWeightManager.bold,
    color,
  );
}

TextStyle getBodyMedium(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.bodyMedium,
    fontWeight ?? FontWeightManager.medium,
    color,
  );
}

TextStyle getBodySmall(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize ?? FontSize.bodySmall,
    fontWeight ?? FontWeightManager.regular,
    color,
  );
}