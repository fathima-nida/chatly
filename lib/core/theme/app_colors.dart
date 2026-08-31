import 'package:flutter/material.dart';

/// Centralized color palette for the entire app.
///
/// Never hardcode a `Color(0x...)` value inside a widget — add it here
/// instead so the whole app stays consistent and themeable.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFFEC4899);
  static const Color primaryLight = Color(0xFFFCE7F3);

  // Surfaces
  static const Color background = Color(0xFFFFF7FB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFF5D0FE);

  // Text
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  // Status
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);

  // Chat bubbles
  static const Color receivedMessage = Color(0xFFFDF2F8);
  static const Color sentMessage = Color(0xFFEC4899);
  static const Color sentMessageText = Color(0xFFFFFFFF);
  static const Color receivedMessageText = Color(0xFF1F2937);

  // Misc
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9CA3AF);
  static const Color shadow = Color(0x1A831843);
  static const Color online = success;


   LinearGradient appBarGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFF472B6),
    Color(0xFFEC4899),
    Color(0xFFDB2777),
  ],
);
}