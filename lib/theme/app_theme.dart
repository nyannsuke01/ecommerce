import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  ///ダークモードかどうか
  ///true:dark, false:light
  bool isDarkMode(BuildContext context) {
    final Brightness brightness = MediaQuery.platformBrightnessOf(context);
    return brightness == Brightness.dark;
  }


  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bgColors[0],
    appBarTheme: AppBarTheme(
      color: bgAppbarWhite,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
      ),
      caption: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: grey, fontSize: 18.0),
      bodyText2: TextStyle(
        color: black,
      ),
      subtitle1: TextStyle(
        color: black,
        fontSize: 18.0,
      ),
    ),
    buttonColor: lightModeButton,
    primaryColor: black,
    canvasColor: white,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: bgColors[1],
    appBarTheme: AppBarTheme(
      color: bgAppbarBlack,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
      caption: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: white, fontSize: 18.0),
      bodyText2: TextStyle(
        color: white,
      ),
      subtitle1: TextStyle(
        color: white,
        fontSize: 18.0,
      ),
    ),
    buttonColor: darkModeButton,
    primaryColor: white,
    canvasColor: bgAppbarBlack,
  );
}
