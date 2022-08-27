import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark1 = Color(0xFF310771);
const appPurpleLight1 = Color(0xFF9343F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE67848);

ThemeData appLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: appPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(elevation: 4, backgroundColor: appPurple),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appPurpleDark1),
        bodyText2: TextStyle(color: appPurpleDark1)));

ThemeData appDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: appWhite,
    scaffoldBackgroundColor: appPurpleDark1,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: appPurpleDark1),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appWhite),
        bodyText2: TextStyle(color: appWhite)));
