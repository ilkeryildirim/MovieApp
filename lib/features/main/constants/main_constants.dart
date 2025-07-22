import 'package:flutter/material.dart';

class MainConstants {
  MainConstants._();

  // Font Sizes
  static const double bottomNavLabelFontSize = 12.0;
  static const double appBarTitleFontSize = 16.0;

  // Font Weights
  static const FontWeight bottomNavLabelFontWeight = FontWeight.w500;
  static const FontWeight appBarTitleFontWeight = FontWeight.w600;

  // Colors
  static const Color bottomNavLabelColor = Colors.white;
  static const Color bottomNavInactiveColor = Colors.white54;
  static const Color appBarTitleColor = Colors.white;

  // Dimensions
  static const double bottomNavHeight = 80.0;
  static const double bottomNavIconSize = 24.0;
  static const double bottomNavPadding = 16.0;
  static const double bottomNavItemSpacing = 8.0;
  static const double bottomNavItemWidth = 16.0;
  static const double appBarHeight = 56.0;

  // Spacing
  static const double bottomNavLabelSpacing = 8.0;
  static const double bottomNavItemHorizontalSpacing = 16.0;

  // Border Radius
  static const double bottomNavRadius = 20.0;
  static const double bottomNavItemRadius = 12.0;

  // Text Styles
  static const TextStyle bottomNavLabelStyle = TextStyle(
    fontSize: bottomNavLabelFontSize,
    fontWeight: bottomNavLabelFontWeight,
    color: bottomNavLabelColor,
  );

  static const TextStyle bottomNavInactiveLabelStyle = TextStyle(
    fontSize: bottomNavLabelFontSize,
    fontWeight: bottomNavLabelFontWeight,
    color: bottomNavInactiveColor,
  );

  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: appBarTitleFontSize,
    fontWeight: appBarTitleFontWeight,
    color: appBarTitleColor,
  );
} 