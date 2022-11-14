import 'package:currency_converter/core/utils/app_value.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_font.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.primaryColor,
          selectedIconTheme: IconThemeData(size: AppSize.s45),
          unselectedIconTheme: IconThemeData(size: AppSize.s35),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.3,
              fontSize: AppFontSize.s17),
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.3,
              fontSize: AppFontSize.s18),
          type: BottomNavigationBarType.fixed));
}
