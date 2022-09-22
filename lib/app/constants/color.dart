import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark1 = Color(0xFF310771);
const appPurpleLight1 = Color(0xFF9343F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE67848);

ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appPurple,
        extendedTextStyle: TextStyle(color: appWhite)),
    primaryColor: appPurpleDark1,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(elevation: 4, backgroundColor: appPurple),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appPurpleDark1),
        bodyText2: TextStyle(color: appPurpleDark1)),
    listTileTheme: ListTileThemeData(textColor: appPurpleDark1),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
            border: Border(bottom: BorderSide(color: appPurpleDark1))),
        labelColor: appPurpleDark1));

ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appWhite,
        extendedTextStyle: TextStyle(color: appPurple)),
    primaryColor: appWhite,
    scaffoldBackgroundColor: appPurpleDark1,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: appPurpleDark1),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appWhite),
        bodyText2: TextStyle(color: appWhite)),
    listTileTheme: ListTileThemeData(textColor: appWhite),
    tabBarTheme: TabBarTheme(
        indicator:
            BoxDecoration(border: Border(bottom: BorderSide(color: appWhite))),
        labelColor: appWhite));
