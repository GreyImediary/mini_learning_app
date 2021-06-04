import 'package:flutter/material.dart';

import 'colors.dart';

final theme = ThemeData(
  primaryColor: primary,
  fontFamily: 'MINIType',
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: textMainColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'MINIType',
      ),
    ),
    iconTheme: IconThemeData(),
  ),
  colorScheme: ColorScheme(
    primary: primary,
    primaryVariant: primaryVariant,
    secondary: secondary,
    secondaryVariant: secondaryVariant,
    surface: surface,
    background: background,
    error: error,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    onBackground: onBackground,
    onError: onError,
    brightness: brightness,
  ),
  textTheme: TextTheme(
    headline3: TextStyle(
      fontSize: 48,
      color: textMainColor,
    ),
    headline5: TextStyle(
        color: textMainColor, fontSize: 24, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: textMainColor, fontSize: 20, fontWeight: FontWeight.w500),
    subtitle1: TextStyle(
      color: textMainColor,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
        color: textMainColor, fontSize: 14, fontWeight: FontWeight.w500),
    bodyText2: TextStyle(color: textMainColor, fontSize: 16),
    bodyText1: TextStyle(fontSize: 14, color: textSecondaryColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      isDense: true
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(
            fontFamily: 'MINIType', fontWeight: FontWeight.w500)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(color: primary),
        textStyle: TextStyle(
            fontFamily: 'MINIType', fontWeight: FontWeight.w500)),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
    ),
  ),
  iconTheme: IconThemeData(color: onSurface),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.38),
    selectedItemColor: Colors.white,
  ),
  unselectedWidgetColor: testOptionColor
);