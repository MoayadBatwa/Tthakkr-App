
import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/core/constants/app_spacing.dart';
import 'package:tthakkr_app/core/styles/text_style.dart';

class AppTheme {

  static ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.teal,
      surface: AppColors.surface,
      background: AppColors.bg,
      onPrimary: AppColors.bg,
      onSecondary: AppColors.bg,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
    ),
    textTheme: TextTheme(
    ).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bg,
      elevation: 0,
      titleTextStyle: AppTextStyles.headingScreen,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.textTertiary,
      elevation: 0,
    ),
    dividerColor: AppColors.borderDefault,
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: const BorderSide(color: AppColors.borderDefault),
      ),
    ),
  );
}
  
}