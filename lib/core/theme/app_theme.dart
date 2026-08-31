import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_style.dart';

/// Builds the single ThemeData used across the app.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,

        primary: AppColors.primary,
        onPrimary: AppColors.white,

        secondary: AppColors.primaryLight,
        onSecondary: AppColors.primary,

        error: AppColors.error,
        onError: AppColors.white,

        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,

        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primary,

        secondaryContainer: AppColors.receivedMessage,
        onSecondaryContainer: AppColors.textPrimary,

        tertiary: AppColors.success,
        onTertiary: AppColors.white,

        tertiaryContainer: const Color(0xFFE8F8F0),
        onTertiaryContainer: AppColors.success,

        errorContainer: const Color(0xFFFEE2E2),
        onErrorContainer: AppColors.error,

        outline: AppColors.border,

        shadow: AppColors.shadow,

        inverseSurface: AppColors.textPrimary,
        onInverseSurface: AppColors.white,
        inversePrimary: AppColors.primary,

        surfaceTint: AppColors.primary,
      ),

      scaffoldBackgroundColor: AppColors.background,
    );

    return base.copyWith(
      // ---------------- AppBar ----------------
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: AppColors.primary,
        ),
        titleTextStyle: AppTextStyle.title(),
      ),

      // ---------------- Input ----------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),

        hintStyle: AppTextStyle.body(
          color: AppColors.textSecondary,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusMd,
          ),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusMd,
          ),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusMd,
          ),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusMd,
          ),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
      ),

      // ---------------- Elevated Button ----------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,

          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.sm,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSpacing.radiusMd,
            ),
          ),

          textStyle: AppTextStyle.button(),
        ),
      ),

      // ---------------- Text Button ----------------
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyle.button(
            color: AppColors.primary,
          ),
        ),
      ),

      // ---------------- Floating Button ----------------
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 2,
      ),

      // ---------------- Card ----------------
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusLg,
          ),
        ),
      ),

      // ---------------- Divider ----------------
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: AppSpacing.lg,
      ),

      // ---------------- Icon ----------------
      iconTheme: const IconThemeData(
        color: AppColors.primary,
        size: 24,
      ),

      // ---------------- Checkbox ----------------
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.white;
        }),
      ),

      // ---------------- Switch ----------------
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLight;
          }
          return AppColors.border;
        }),
      ),

      // ---------------- Progress Indicator ----------------
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // ---------------- Bottom Navigation ----------------
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      // ---------------- Navigation Bar (Material 3) ----------------
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryLight,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return AppTextStyle.body(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey,
          );
        }),
      ),

      splashFactory: InkRipple.splashFactory,
    );
  }
}