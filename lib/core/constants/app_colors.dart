
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const bg         = Color(0xFF0B0F1A);
  static const surface    = Color(0xFF121829);
  static const card       = Color(0xFF1A2235);
  static const cardElevated = Color(0xFF1E2840);

  // Gold
  static const gold       = Color(0xFFC9A84C);
  static const goldLight  = Color(0xFFE8C97A);
  static const goldDim    = Color(0x26C9A84C); // 15%
  static const goldBorder = Color(0x4DC9A84C); // 30%

  // Teal
  static const teal       = Color(0xFF2ABFBF);
  static const tealDim    = Color(0x1F2ABFBF); // 12%

  // Text
  static const textPrimary   = Color(0xFFF0EDE6);
  static const textSecondary = Color(0xFF8B93A8);
  static const textTertiary  = Color(0xFF4A5168);

  // Borders
  static const borderDefault = Color(0x0FFFFFFF); // 6%
  static const borderGold    = Color(0x4DC9A84C); // 30%

  // Prayer semantic
  static const fajrColor    = Color(0xFF2ABFBF);
  static const sunriseColor = Color(0xFFE8C97A);
  static const dhuhrColor   = Color(0xFFE8C97A);
  static const asrColor     = Color(0xFFC9A84C);
  static const maghribColor = Color(0xFFE07B54);
  static const ishaColor    = Color(0xFF8B93A8);

  // Gradients
  static const heroCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1D2B45), Color(0xFF152238), Color(0xFF0F1C30)],
    stops: [0.0, 0.5, 1.0],
  );

  static const goldHorizontalGradient = LinearGradient(
    colors: [gold, goldLight],
  );

  static const goldVerticalGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gold, goldLight],
  );

  static const prayerBgGradient = RadialGradient(
    center: Alignment(0, -1.2),
    radius: 1.0,
    colors: [Color(0x2EC9A84C), Colors.transparent],
  );

  static const qiblahBgGradient = RadialGradient(
    center: Alignment(0, -0.2),
    radius: 1.0,
    colors: [Color(0x1F2ABFBF), Colors.transparent],
  );
}