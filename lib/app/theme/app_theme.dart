import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 14,
      color: AppColors.white,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.white,
      ),
    ),
  ),
);
