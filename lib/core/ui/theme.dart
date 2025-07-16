import 'package:flutter/material.dart';

class NeuroWoodColors {
  static const white = Color(0xFFFFFFFF);
  static const lightGray = Color(0xFFF8F8F8);
  static const gray = Color(0xFFD9DDDF);
  static const darkGray = Color(0xFF8E9394);
  static const darkGray2 = Color(0xFFEDEDED);
  static const black = Color(0xFF1C2629);
  static const yellow = Color(0xFFEBB854);
  static const green = Color(0xFF96BC44);
  static const red = Color(0xFFB8391F);
  static const brown = Color(0xFFB27A51);
  static const oldGreen = Color(0xFF558139);
}

ThemeData themeData = ThemeData(
  primaryColor: NeuroWoodColors.green,
  scaffoldBackgroundColor: NeuroWoodColors.white,
  fontFamily: 'OpenSans',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w700,
      color: NeuroWoodColors.black,
      height: 1,
      fontSize: 22,
    ),
    displayMedium: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w600,
      color: NeuroWoodColors.black,
      height: 1.375,
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
      color: NeuroWoodColors.black,
      height: 1,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400,
      color: NeuroWoodColors.black,
      height: 1.375,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400,
      color: NeuroWoodColors.black,
      height: 1.357,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: NeuroWoodColors.darkGray,
      height: 1.357,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: NeuroWoodColors.darkGray,
      height: 1.33,
      fontSize: 12,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: NeuroWoodColors.white,
    foregroundColor: NeuroWoodColors.black,
    titleTextStyle: TextStyle(
      color: NeuroWoodColors.black,
      fontSize: 16,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w600,
    ),
  ),
);
