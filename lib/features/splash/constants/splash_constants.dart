import 'package:flutter/material.dart';

class SplashConstants {
  SplashConstants._();

  // Font Sizes
  static const double appTitleFontSize = 32.0;
  static const double subtitleFontSize = 16.0;

  // Font Weights
  static const FontWeight appTitleFontWeight = FontWeight.w700;
  static const FontWeight subtitleFontWeight = FontWeight.w400;

  // Text Properties
  static const double appTitleLetterSpacing = 1.2;
  static const double subtitleLetterSpacing = 0.5;

  // Colors & Opacity
  static const double subtitleOpacity = 0.8;

  // Dimensions
  static const double logoSize = 120.0;
  static const double loadingIndicatorSize = 24.0;
  static const double containerPadding = 32.0;

  // Spacing
  static const double logoToTitleSpacing = 24.0;
  static const double titleToSubtitleSpacing = 8.0;
  static const double subtitleToLoadingSpacing = 64.0;

  // Animation
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 1500);

  // Text Styles
  static TextStyle appTitleStyle(Color color) => TextStyle(
    fontSize: appTitleFontSize,
    fontWeight: appTitleFontWeight,
    color: color,
    letterSpacing: appTitleLetterSpacing,
  );

  static TextStyle subtitleStyle(Color color) => TextStyle(
    fontSize: subtitleFontSize,
    fontWeight: subtitleFontWeight,
    color: color.withValues(alpha: subtitleOpacity),
    letterSpacing: subtitleLetterSpacing,
  );
} 