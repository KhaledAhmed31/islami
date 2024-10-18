import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/utilities/my_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              iconSize: 50,
              overlayColor: Colors.black,
              surfaceTintColor: Colors.black,
              focusColor: Colors.black,
              hoverColor: Colors.black,
              foregroundColor: Colors.black)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        shadowColor: const Color.fromARGB(0, 23, 23, 23),
        overlayColor: const Color.fromARGB(255, 222, 194, 147),
      )),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
          titleMedium:
              TextStyle(color: MyColors.primaryLightColor, fontSize: 27)),
      primaryColor: MyColors.primaryLightColor,
      canvasColor: MyColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: MyColors.primaryLightColor,
            fontSize: 23,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: MyColors.lightIconColor));
}
