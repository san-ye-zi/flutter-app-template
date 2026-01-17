// ============================================================================
// FILE: lib/core/theme/theme_colors.dart
// Color schemes for light and dark modes
// ============================================================================

import 'package:flutter/material.dart';

class AppThemeColors {
  AppThemeColors._();

  // Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary colors (Yellow - main brand color)
    primary: Color(0xFFFFC107), // Yellow
    onPrimary: Color(0xFF000000), // Black text on yellow
    primaryContainer: Color(0xFFFFB300), // Yellow dark
    onPrimaryContainer: Color(0xFF000000),

    // Secondary colors (Purple - accent)
    secondary: Color(0xFF6200EA), // Purple
    onSecondary: Color(0xFFFFFFFF), // White text on purple
    secondaryContainer: Color(0xFF3700B3), // Purple dark
    onSecondaryContainer: Color(0xFFFFFFFF),

    // Tertiary colors (Blue for player O)
    tertiary: Color(0xFF2196F3), // Blue
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF1976D2),
    onTertiaryContainer: Color(0xFFFFFFFF),

    // Error colors (Red for player X)
    error: Color(0xFFF44336), // Red
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFE53935),
    onErrorContainer: Color(0xFFFFFFFF), // Dark gray text
    // Surface colors
    surface: Color(0xFFFFFFFF), // White
    onSurface: Color(0xFF000000), // Black
    surfaceContainerHighest: Color(0xFFF5F5F5), // Light gray
    onSurfaceVariant: Color(0xFF424242),

    // Outline
    outline: Color(0xFFBDBDBD),
    outlineVariant: Color(0xFFE0E0E0),

    // Shadow
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),

    // Inverse colors
    inverseSurface: Color(0xFF1A1A1A),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFFFFD54F),
  );

  // Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary colors (Yellow adjusted for dark mode)
    primary: Color(0xFFFFD54F), // Lighter yellow for dark background
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFFFFB300),
    onPrimaryContainer: Color(0xFF000000),

    // Secondary colors (Purple adjusted for dark mode)
    secondary: Color(0xFF9C27B0), // Lighter purple
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFF7B1FA2),
    onSecondaryContainer: Color(0xFFFFFFFF),

    // Tertiary colors (Blue for player O)
    tertiary: Color(0xFF42A5F5), // Lighter blue
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFF1976D2),
    onTertiaryContainer: Color(0xFFFFFFFF),

    // Error colors (Red for player X)
    error: Color(0xFFEF5350), // Lighter red
    onError: Color(0xFF000000),
    errorContainer: Color(0xFFD32F2F),
    onErrorContainer: Color(0xFFFFFFFF), // Light gray text
    // Surface colors
    surface: Color(0xFF1E1E1E), // Dark surface
    onSurface: Color(0xFFE1E1E1), // Softer white for better readability
    surfaceContainerHighest: Color(0xFF2C2C2C), // Elevated surfaces
    onSurfaceVariant: Color(0xFFB0B0B0), // Secondary text
    // Outline
    outline: Color(0xFF616161),
    outlineVariant: Color(0xFF424242),

    // Shadow
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),

    // Inverse colors
    inverseSurface: Color(0xFFE0E0E0),
    onInverseSurface: Color(0xFF121212),
    inversePrimary: Color(0xFFFFC107),
  );
}
