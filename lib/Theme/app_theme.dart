import 'package:flutter/material.dart';
import 'package:ui_practical/Constants/color_constants.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: const  ColorScheme(
      primary: ColorConstants.primaryColor,
      brightness: Brightness.light,
      secondary: ColorConstants.whiteColor,
      onPrimary: ColorConstants.whiteColor,
      onSecondary: ColorConstants.whiteColor,
      onError: Colors.redAccent,
      error: Colors.redAccent,
      background: ColorConstants.whiteColor,
      onBackground: ColorConstants.whiteColor,
      surface: ColorConstants.whiteColor,
      onSurface: ColorConstants.whiteColor,
    ));
  }
}
