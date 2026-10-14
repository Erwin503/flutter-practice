import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.primaryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColor.accent,
      secondary: AppColor.yellow,
      surface: AppColor.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black45),
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.accent,
      secondary: AppColor.yellow,
      surface: AppColor.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
