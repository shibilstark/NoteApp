import 'package:flutter/material.dart';
import 'package:note_app/core/colors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: scaffoldWhite,
      appBarTheme: AppBarTheme(backgroundColor: primaryColor));
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldWhite,
    appBarTheme: AppBarTheme(backgroundColor: darkThemeBlack),
  );
}
