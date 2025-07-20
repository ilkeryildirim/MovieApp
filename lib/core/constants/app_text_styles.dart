import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_assets.dart';

class AppTextStyles {
  static final String _fontFamily = AppAssets.euclidFontFamily;

  // Headings
  static TextStyle heading1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle heading4 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  // Body
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grayText,
  );

  // Button
  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle buttonSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  // Caption
  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grayText,
  );

  // Error
  static TextStyle error = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.errorColor,
  );

  // Link
  static TextStyle link = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    decoration: TextDecoration.underline,
  );

  // Input
  static TextStyle inputText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle inputHint = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.grayText,
  );

  // Movie specific
  static TextStyle movieTitle = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    color: AppColors.whiteText,
  );

  static TextStyle movieDescription = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    color: AppColors.whiteText.withOpacity(0.8),
    height: 1.5,
  );
} 