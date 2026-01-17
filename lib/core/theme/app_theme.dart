// ============================================================================
// FILE: lib/core/theme/app_theme.dart
// Main theme configuration for light and dark modes
// ============================================================================

import 'package:flutter/material.dart';

import 'app_typography.dart';
import 'theme_colors.dart';
import 'theme_extensions.dart';

class AppTheme {
  // Prevent instantiation
  AppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: AppThemeColors.lightColorScheme,

    textTheme: AppTypography.textTheme,

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppThemeColors.lightColorScheme.primary,
      foregroundColor: AppThemeColors.lightColorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppThemeColors.lightColorScheme.onPrimary,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppThemeColors.lightColorScheme.surface,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(color: AppThemeColors.lightColorScheme.onSurface),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppThemeColors.lightColorScheme.outline,
      thickness: 1,
      space: 1,
    ),

    // Extensions
    extensions: const <ThemeExtension<dynamic>>[GameThemeExtension.light],
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: AppThemeColors.darkColorScheme,

    textTheme: AppTypography.textTheme,

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppThemeColors.darkColorScheme.primary,
      foregroundColor: AppThemeColors.darkColorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppThemeColors.darkColorScheme.onPrimary),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppThemeColors.darkColorScheme.surface,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    ),

    // Icon Theme
    iconTheme: IconThemeData(color: AppThemeColors.darkColorScheme.onSurface),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppThemeColors.darkColorScheme.outline,
      thickness: 1,
      space: 1,
    ),

    // Extensions
    extensions: const <ThemeExtension<dynamic>>[GameThemeExtension.dark],
  );
}
