import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized text styles built on the Poppins font family.
///
/// Always reach for one of these instead of constructing a new
/// [TextStyle] inline, so type is consistent across the app.
class AppTextStyle {
  AppTextStyle._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color color = AppColors.textPrimary,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headingLarge({Color color = AppColors.textPrimary}) =>
      _base(size: 24, weight: FontWeight.w600, color: color, height: 1.3);

  static TextStyle headingMedium({Color color = AppColors.textPrimary}) =>
      _base(size: 20, weight: FontWeight.w600, color: color, height: 1.3);

  static TextStyle title({Color color = AppColors.textPrimary}) =>
      _base(size: 18, weight: FontWeight.w600, color: color, height: 1.3);

  static TextStyle body({Color color = AppColors.textPrimary}) =>
      _base(size: 16, weight: FontWeight.w400, color: color, height: 1.4);

  static TextStyle bodyMedium({Color color = AppColors.textPrimary}) =>
      _base(size: 16, weight: FontWeight.w500, color: color, height: 1.4);

  static TextStyle caption({Color color = AppColors.textSecondary}) =>
      _base(size: 14, weight: FontWeight.w400, color: color, height: 1.3);

  static TextStyle small({Color color = AppColors.textSecondary}) =>
      _base(size: 12, weight: FontWeight.w400, color: color, height: 1.2);

  static TextStyle button({Color color = AppColors.white}) => _base(
        size: 16,
        weight: FontWeight.w600,
        color: color,
        letterSpacing: 0.2,
      );
}
