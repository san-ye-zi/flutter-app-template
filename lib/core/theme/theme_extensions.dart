// ============================================================================
// FILE: lib/core/theme/theme_extensions.dart
// Custom theme extensions for game-specific colors
// ============================================================================

import 'package:flutter/material.dart';

/// Custom theme extension for game-specific colors
class GameThemeExtension extends ThemeExtension<GameThemeExtension> {
  const GameThemeExtension({
    required this.playerOColor,
    required this.playerXColor,
    required this.cellBackground,
    required this.cellBorder,
    required this.winningCellBackground,
    required this.gridBackground,
    required this.gradientStart,
    required this.gradientEnd,
    required this.appBarBackground,
    required this.appBarForeground,
    required this.loadingIndicator,
    required this.splashGradientStart,
    required this.splashGradientEnd,
  });

  final Color playerOColor;
  final Color playerXColor;
  final Color cellBackground;
  final Color cellBorder;
  final Color winningCellBackground;
  final Color gridBackground;
  final Color gradientStart;
  final Color gradientEnd;
  final Color appBarBackground;
  final Color appBarForeground;
  final Color loadingIndicator;
  final Color splashGradientStart;
  final Color splashGradientEnd;

  // Light theme game colors
  static const GameThemeExtension light = GameThemeExtension(
    playerOColor: Color(0xFF2196F3), // Blue
    playerXColor: Color(0xFFF44336), // Red
    cellBackground: Color(0xFF1A1A1A), // Dark gray
    cellBorder: Color(0xFF424242), // Gray
    winningCellBackground: Color(0xFF4CAF50), // Green
    gridBackground: Color(0xFF000000), // Black
    gradientStart: Color(0xFFFFC107), // Yellow
    gradientEnd: Color(0xFFFFB300), // Yellow dark
    appBarBackground: Color(0xFFFFC107), // Yellow
    appBarForeground: Colors.black, // Black text
    loadingIndicator: Colors.black87, // Black indicator
    splashGradientStart: Color(0xFFFFC107), // Yellow
    splashGradientEnd: Color(0xFFFFB300), // Yellow dark
  );

  // Dark theme game colors
  static const GameThemeExtension dark = GameThemeExtension(
    playerOColor: Color(0xFF42A5F5), // Lighter blue
    playerXColor: Color(0xFFEF5350), // Lighter red
    cellBackground: Color(0xFF2C2C2C), // Lighter dark gray
    cellBorder: Color(0xFF616161), // Lighter gray
    winningCellBackground: Color(0xFF66BB6A), // Lighter green
    gridBackground: Color(0xFF1E1E1E), // Dark surface
    gradientStart: Color(0xFFFFD54F), // Lighter yellow
    gradientEnd: Color(0xFFFFCA28), // Lighter yellow variant
    appBarBackground: Color(0xFF6200EA), // Purple
    appBarForeground: Colors.white, // White text
    loadingIndicator: Colors.white70, // White indicator
    splashGradientStart: Color(0xFF6200EA), // Purple
    splashGradientEnd: Color(0xFF3700B3), // Purple dark
  );

  @override
  GameThemeExtension copyWith({
    Color? playerOColor,
    Color? playerXColor,
    Color? cellBackground,
    Color? cellBorder,
    Color? winningCellBackground,
    Color? gridBackground,
    Color? gradientStart,
    Color? gradientEnd,
    Color? appBarBackground,
    Color? appBarForeground,
    Color? loadingIndicator,
    Color? splashGradientStart,
    Color? splashGradientEnd,
  }) => GameThemeExtension(
    playerOColor: playerOColor ?? this.playerOColor,
    playerXColor: playerXColor ?? this.playerXColor,
    cellBackground: cellBackground ?? this.cellBackground,
    cellBorder: cellBorder ?? this.cellBorder,
    winningCellBackground: winningCellBackground ?? this.winningCellBackground,
    gridBackground: gridBackground ?? this.gridBackground,
    gradientStart: gradientStart ?? this.gradientStart,
    gradientEnd: gradientEnd ?? this.gradientEnd,
    appBarBackground: appBarBackground ?? this.appBarBackground,
    appBarForeground: appBarForeground ?? this.appBarForeground,
    loadingIndicator: loadingIndicator ?? this.loadingIndicator,
    splashGradientStart: splashGradientStart ?? this.splashGradientStart,
    splashGradientEnd: splashGradientEnd ?? this.splashGradientEnd,
  );

  @override
  GameThemeExtension lerp(ThemeExtension<GameThemeExtension>? other, double t) {
    if (other is! GameThemeExtension) {
      return this;
    }
    return GameThemeExtension(
      playerOColor:
          Color.lerp(playerOColor, other.playerOColor, t) ?? playerOColor,
      playerXColor:
          Color.lerp(playerXColor, other.playerXColor, t) ?? playerXColor,
      cellBackground:
          Color.lerp(cellBackground, other.cellBackground, t) ?? cellBackground,
      cellBorder: Color.lerp(cellBorder, other.cellBorder, t) ?? cellBorder,
      winningCellBackground:
          Color.lerp(winningCellBackground, other.winningCellBackground, t) ??
          winningCellBackground,
      gridBackground:
          Color.lerp(gridBackground, other.gridBackground, t) ?? gridBackground,
      gradientStart:
          Color.lerp(gradientStart, other.gradientStart, t) ?? gradientStart,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t) ?? gradientEnd,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t) ??
          appBarBackground,
      appBarForeground:
          Color.lerp(appBarForeground, other.appBarForeground, t) ??
          appBarForeground,
      loadingIndicator:
          Color.lerp(loadingIndicator, other.loadingIndicator, t) ??
          loadingIndicator,
      splashGradientStart:
          Color.lerp(splashGradientStart, other.splashGradientStart, t) ??
          splashGradientStart,
      splashGradientEnd:
          Color.lerp(splashGradientEnd, other.splashGradientEnd, t) ??
          splashGradientEnd,
    );
  }
}

// Extension method to access game theme easily
extension GameThemeContext on BuildContext {
  GameThemeExtension get gameTheme =>
      Theme.of(this).extension<GameThemeExtension>()!;
}
