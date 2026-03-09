
import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get displayArabic => const TextStyle(
    fontFamily: 'Amiri',
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static TextStyle get displayLarge => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 52,
    fontWeight: FontWeight.w300,
    color: AppColors.goldLight,
    letterSpacing: -2,
    height: 1.1,
  );

  static TextStyle get displayCounter => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 58,
    fontWeight: FontWeight.w300,
    color: AppColors.goldLight,
    letterSpacing: -3,
    height: 1.0,
  );

  static TextStyle get headingScreen => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyArabic => const TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.8,
  );

  static TextStyle get bodyArabicSmall => const TextStyle(
    fontFamily: 'NotoNaskhArabic',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static TextStyle get bodyRegular => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle get bodySmall => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle get labelCaps => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
    letterSpacing: 1.5,
  );

  static TextStyle get labelTime => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle get labelSource => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 11,
    fontStyle: FontStyle.italic,
    color: AppColors.textTertiary,
  );

  static TextStyle get prayerName => const TextStyle(
    fontFamily: 'dmSans',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}