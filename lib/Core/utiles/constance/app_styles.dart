import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/app_color.dart';

class AppStyles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        cardColor:
            isDarkTheme ? AppColors.darkCardColor : AppColors.lightCardColor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
            backgroundColor: isDarkTheme
                ? AppColors.darkScaffoldColor
                : AppColors.lightScaffoldColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            )));
  }
}
