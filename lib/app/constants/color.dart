import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark1 = Color(0xFF1E0771);
const appPurpleLight1 = Color(0xFF9343F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE67848);

ThemeData appLight = ThemeData(
    primaryColor: appPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: appPurple));

ThemeData appDark = ThemeData(
    primaryColor: appWhite,
    scaffoldBackgroundColor: appPurpleDark1,
    appBarTheme: AppBarTheme(backgroundColor: appPurpleDark1),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appWhite),
        bodyText2: TextStyle(color: appWhite)));
