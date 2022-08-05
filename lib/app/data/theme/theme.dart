import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: white,
      elevation: customElevation,
    ),
    primaryColor: red,
    scaffoldBackgroundColor: white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: red,
      onPrimary: white,
      secondary: navyBlue,
      onSecondary: white,
      error: red,
      onError: white,
      background: white,
      onBackground: black,
      surface: white,
      onSurface: black,
    ),
  );
}
