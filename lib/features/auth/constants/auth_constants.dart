import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AuthConstants {
  AuthConstants._();

  // Font Sizes
  static const double headerTitleFontSize = 18.0;
  static const double headerSubtitleFontSize = 13.0;
  static const double buttonFontSize = 16.0;
  static const double linkFontSize = 14.0;
  static const double socialButtonFontSize = 16.0;
  static const double termsTextFontSize = 12.0;
  static const double errorTextFontSize = 12.0;

  // Font Weights
  static const FontWeight headerTitleFontWeight = FontWeight.w600;
  static const FontWeight headerSubtitleFontWeight = FontWeight.w400;
  static const FontWeight buttonFontWeight = FontWeight.w600;
  static const FontWeight linkFontWeight = FontWeight.w500;
  static const FontWeight socialButtonFontWeight = FontWeight.w500;
  static const FontWeight termsTextFontWeight = FontWeight.w400;

  // Colors
  static const Color headerTitleColor = AppColors.whiteText;
  static const Color headerSubtitleColor = AppColors.grayText;
  static const Color buttonTextColor = AppColors.whiteText;
  static const Color linkColor = AppColors.primaryRed;
  static const Color socialButtonTextColor = AppColors.whiteText;
  static const Color termsTextColor = AppColors.grayText;
  static const Color errorTextColor = AppColors.errorColor;

  // Text Properties
  static const double textHeight = 1.0;
  static const double letterSpacing = 0.0;

  // Spacing
  static const double headerSpacing = 8.0;
  static const double sectionSpacing = 24.0;
  static const double buttonSpacing = 16.0;
  static const double socialButtonSpacing = 12.0;

  // Dimensions
  static const double horizontalPadding = 82.0;
  static const double buttonHeight = 52.0;
  static const double buttonRadius = 12.0;
  static const double socialButtonHeight = 48.0;
  static const double inputFieldHeight = 56.0;

  // Text Styles
  static const TextStyle headerTitleStyle = TextStyle(
    fontSize: headerTitleFontSize,
    fontWeight: headerTitleFontWeight,
    color: headerTitleColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle headerSubtitleStyle = TextStyle(
    fontSize: headerSubtitleFontSize,
    fontWeight: headerSubtitleFontWeight,
    color: headerSubtitleColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: buttonFontSize,
    fontWeight: buttonFontWeight,
    color: buttonTextColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle linkTextStyle = TextStyle(
    fontSize: linkFontSize,
    fontWeight: linkFontWeight,
    color: linkColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle socialButtonTextStyle = TextStyle(
    fontSize: socialButtonFontSize,
    fontWeight: socialButtonFontWeight,
    color: socialButtonTextColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle termsTextStyle = TextStyle(
    fontSize: termsTextFontSize,
    fontWeight: termsTextFontWeight,
    color: termsTextColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );

  static const TextStyle errorTextStyle = TextStyle(
    fontSize: errorTextFontSize,
    fontWeight: FontWeight.w400,
    color: errorTextColor,
    height: textHeight,
    letterSpacing: letterSpacing,
  );
} 