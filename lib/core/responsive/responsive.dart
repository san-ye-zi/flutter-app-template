// ============================================================================
// FILE: lib/core/responsive/responsive.dart
// Enhanced responsive system with small mobile support
// ============================================================================

import 'package:flutter/material.dart';

/// Screen size categories based on width breakpoints
enum ScreenSize {
  smallMobile, // < 425px (iPhone SE, Galaxy S8)
  mobile, // 375px - 600px (Most phones)
  tablet, // > 600px (iPads, Android tablets)
}

/// Complete responsive system for Flutter apps with small mobile support
class Responsive {
  Responsive._();

  // ===========================================================================
  // BREAKPOINTS - Carefully chosen based on real device statistics
  // ===========================================================================

  /// Small mobile breakpoint (iPhone SE 2020, Galaxy S8)
  static const double smallMobileBreakpoint = 425;

  /// Standard mobile breakpoint
  static const double mobileBreakpoint = 600;

  /// Tablet breakpoint
  static const double tabletBreakpoint = 1200;

  // ===========================================================================
  // SCREEN SIZE DETECTION
  // ===========================================================================

  /// Get current screen size category
  static ScreenSize getSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= mobileBreakpoint) return ScreenSize.tablet;
    if (width >= smallMobileBreakpoint) return ScreenSize.mobile;
    return ScreenSize.smallMobile;
  }

  /// Check if current screen is small mobile (iPhone SE, etc.)
  static bool isSmallMobile(BuildContext context) =>
      getSize(context) == ScreenSize.smallMobile;

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) =>
      getSize(context) == ScreenSize.mobile;

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) =>
      getSize(context) == ScreenSize.tablet;

  /// Get screen width
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Get screen height
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Get the shorter dimension (useful for game boards)
  static double shortestSide(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide;

  /// Get the longer dimension
  static double longestSide(BuildContext context) =>
      MediaQuery.of(context).size.longestSide;

  // ===========================================================================
  // RESPONSIVE VALUES
  // ===========================================================================

  /// Get responsive value based on screen size
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? smallMobile,
  }) {
    switch (getSize(context)) {
      case ScreenSize.smallMobile:
        return smallMobile ?? mobile;
      case ScreenSize.mobile:
        return mobile;
      case ScreenSize.tablet:
        return tablet ?? mobile;
    }
  }

  /// Get responsive double value with automatic scaling
  /// Uses carefully tuned multipliers based on screen size
  static double scale(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? smallMobile,
  }) => value(
    context,
    smallMobile: smallMobile ?? mobile * 0.85, // 15% smaller for small screens
    mobile: mobile,
    tablet: tablet ?? mobile * 1.25, // 25% larger for tablets
  );

  /// Get value proportional to screen width
  /// Useful for elements that should scale with screen size
  static double proportional(
    BuildContext context,
    double percentage, {
    double? min,
    double? max,
  }) {
    final screenWidth = width(context);
    var value = screenWidth * (percentage / 100);

    if (min != null && value < min) value = min;
    if (max != null && value > max) value = max;

    return value;
  }

  // ===========================================================================
  // FONT SIZES
  // ===========================================================================

  /// Get responsive font size
  static double fontSize(
    BuildContext context,
    double baseSize, {
    double? smallMobileScale,
    double? mobileScale,
    double? tabletScale,
  }) => value(
    context,
    smallMobile: baseSize * (smallMobileScale ?? 0.85),
    mobile: baseSize * (mobileScale ?? 1.0),
    tablet: baseSize * (tabletScale ?? 1.2),
  );

  // ===========================================================================
  // SPACING
  // ===========================================================================

  /// Get responsive spacing value
  static double spacing(BuildContext context, double baseSpacing) =>
      scale(context, mobile: baseSpacing);

  /// Get responsive grid spacing (for game board cells)
  static double gridSpacing(BuildContext context) => value(
    context,
    smallMobile: 8, // Tighter spacing for small screens
    mobile: 12, // Standard spacing
    tablet: 16, // More breathing room
  );

  // ===========================================================================
  // PADDING & INSETS
  // ===========================================================================

  /// Get responsive padding
  static EdgeInsets padding(
    BuildContext context, {
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? smallMobile,
  }) => value(
    context,
    smallMobile: smallMobile ?? mobile * 0.85,
    mobile: mobile,
    tablet: tablet ?? mobile * 1.25,
  );

  /// Get responsive horizontal padding
  static double horizontalPadding(BuildContext context) => value(
    context,
    smallMobile: 16, // Minimal padding for small screens
    mobile: 20, // Standard padding
    tablet: 40, // More space
  );

  /// Get responsive vertical padding
  static double verticalPadding(BuildContext context) =>
      value(context, smallMobile: 12, mobile: 16, tablet: 24);

  /// Get safe area padding that's responsive
  static EdgeInsets safeAreaPadding(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return EdgeInsets.fromLTRB(
      padding.left + horizontalPadding(context),
      padding.top + verticalPadding(context),
      padding.right + horizontalPadding(context),
      padding.bottom + verticalPadding(context),
    );
  }

  // ===========================================================================
  // BORDER RADIUS
  // ===========================================================================

  /// Get responsive border radius
  static BorderRadius borderRadius(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? smallMobile,
  }) {
    final radius = scale(
      context,
      smallMobile: smallMobile,
      mobile: mobile,
      tablet: tablet,
    );
    return BorderRadius.circular(radius);
  }

  // ===========================================================================
  // ICON SIZES
  // ===========================================================================

  /// Get responsive icon size
  static double iconSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? smallMobile,
  }) =>
      scale(context, smallMobile: smallMobile, mobile: mobile, tablet: tablet);
}

// ============================================================================
// RESPONSIVE WIDGETS
// ============================================================================

/// Responsive text widget with automatic font size scaling
class ResponsiveText extends StatelessWidget {
  const ResponsiveText(
    this.text, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.mobileFontSize,
    this.tabletFontSize,
    this.smallMobileFontSize,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? smallMobileFontSize;
  final double? mobileFontSize;
  final double? tabletFontSize;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();
    final baseFontSize = baseStyle.fontSize ?? 14;

    final fontSize = Responsive.value(
      context,
      smallMobile: smallMobileFontSize ?? mobileFontSize ?? baseFontSize * 0.85,
      mobile: mobileFontSize ?? baseFontSize,
      tablet: tabletFontSize ?? mobileFontSize ?? baseFontSize * 1.2,
    );

    return Text(
      text,
      style: baseStyle.copyWith(fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Widget builder for different screen sizes
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    this.tablet,
    this.smallMobile,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? smallMobile;

  @override
  Widget build(BuildContext context) => Responsive.value(
    context,
    smallMobile: smallMobile,
    mobile: mobile,
    tablet: tablet,
  );
}

// ============================================================================
// EXTENSIONS
// ============================================================================

/// Extension for scaling EdgeInsets
extension EdgeInsetsScale on EdgeInsets {
  EdgeInsets operator *(double multiplier) => EdgeInsets.fromLTRB(
    left * multiplier,
    top * multiplier,
    right * multiplier,
    bottom * multiplier,
  );
}

/// Extension for getting responsive values from BuildContext
extension ResponsiveContext on BuildContext {
  /// Quick access to screen size
  ScreenSize get screenSize => Responsive.getSize(this);

  /// Quick access to checks
  bool get isSmallMobile => Responsive.isSmallMobile(this);
  bool get isMobile => Responsive.isMobile(this);
  bool get isTablet => Responsive.isTablet(this);

  /// Quick access to dimensions
  double get screenWidth => Responsive.width(this);
  double get screenHeight => Responsive.height(this);
  double get shortestSide => Responsive.shortestSide(this);
  double get longestSide => Responsive.longestSide(this);
}
