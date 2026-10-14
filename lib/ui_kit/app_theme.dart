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
    textTheme: const TextTheme(
      displayLarge: AppTextStyle.h1,
      displayMedium: AppTextStyle.h2,
      displaySmall: AppTextStyle.h3,
      headlineMedium: AppTextStyle.h4,
      headlineSmall: AppTextStyle.h5,
      bodyLarge: AppTextStyle.body,
      titleMedium: AppTextStyle.subtitle,
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
    textTheme: TextTheme(
      displayLarge: AppTextStyle.h1.copyWith(color: Colors.white),
      displayMedium: AppTextStyle.h2.copyWith(color: Colors.white),
      displaySmall: AppTextStyle.h3.copyWith(color: Colors.white),
      headlineMedium: AppTextStyle.h4.copyWith(color: Colors.white),
      headlineSmall: AppTextStyle.h5.copyWith(color: Colors.white),
      bodyLarge: AppTextStyle.body.copyWith(color: Colors.white70),
      titleMedium: AppTextStyle.subtitle.copyWith(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
