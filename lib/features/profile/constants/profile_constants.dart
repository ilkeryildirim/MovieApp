import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Profile page related constants including dimensions, opacity values,
/// style configurations and other reusable values
class ProfileConstants {
  const ProfileConstants._();

  /// Dimensions
  static const double horizontalPadding = 24.0;
  static const double headerTopPadding = 16.0;
  static const double headerBottomPadding = 36.0;
  static const double userSectionTopPadding = 0.0;
  static const double moviesSectionTopPadding = 28.0;
  static const double bottomNavPadding = 100.0;
  
  /// Profile header
  static const double headerHeight = 44.0;
  static const double backButtonSize = 44.0;
  static const double backIconSize = 20.0;
  static const double limitedOfferButtonHeight = 32.0;
  static const double limitedOfferButtonPaddingH = 12.0;
  static const double limitedOfferButtonPaddingV = 6.0;
  static const double limitedOfferBorderRadius = 53.0;
  static const double limitedOfferIconSize = 16.0;
  static const double limitedOfferIconSpacing = 4.0;
  static const double titleFontSize = 15.0;
  static const double limitedOfferTextSize = 12.0;
  static const FontWeight titleFontWeight = FontWeight.w500;
  static const FontWeight limitedOfferFontWeight = FontWeight.w600;
  static const double titleLineHeight = 1.0;
  static const double titleLetterSpacing = 0.0;
  
  /// Profile user section
  static const double profilePhotoSize = 62.0;
  static const double photoBorderWidth = 2.0;
  static const double photoToNameSpacing = 9.0;
  static const double nameToIdSpacing = 6.0;
  static const double userNameFontSize = 15.0;
  static const double userIdFontSize = 12.0;
  static const FontWeight userNameFontWeight = FontWeight.w500;
  static const FontWeight userIdFontWeight = FontWeight.w400;
  static const double addPhotoButtonWidth = 121.0;
  static const double addPhotoButtonHeight = 36.0;
  static const double addPhotoButtonBorderRadius = 8.0;
  static const double addPhotoButtonPaddingH = 19.0;
  static const double addPhotoButtonPaddingV = 10.0;
  static const double addPhotoTextSize = 13.0;
  static const FontWeight addPhotoFontWeight = FontWeight.w700;
  static const double initialTextSize = 32.0;
  static const FontWeight initialFontWeight = FontWeight.w700;
  
  /// Movies section
  static const double moviesTitleFontSize = 13.0;
  static const FontWeight moviesTitleFontWeight = FontWeight.w700;
  static const double moviesTitleToGridSpacing = 24.0;
  static const int gridCrossAxisCount = 2;
  static const double gridChildAspectRatio = 154 / 212;
  static const double gridCrossAxisSpacing = 16.0;
  static const double gridMainAxisSpacing = 16.0;
  static const double movieImageToTextSpacing = 16.0;
  static const double movieTitleToDirectorSpacing = 2.0;
  static const double movieTitleFontSize = 12.0;
  static const double movieDirectorFontSize = 11.0;
  static const FontWeight movieTitleFontWeight = FontWeight.w500;
  static const FontWeight movieDirectorFontWeight = FontWeight.w400;
  static const double movieCardBorderRadius = 8.0;
  static const double emptyIconSize = 32.0;
  static const double emptyStateTitleFontSize = 16.0;
  static const FontWeight emptyStateFontWeight = FontWeight.w400;
  static const double emptyStateHeight = 300.0;
  static const double emptyStateIconSpacing = 16.0;
  static const double emptyStateIconSize = 48.0;
  static const double shimmerTextHeight = 12.0;
  static const double shimmerSubTextHeight = 11.0;
  static const double shimmerTextWidth = 60.0;
  static const double shimmerSubTextWidth = 80.0;
  static const double shimmerTextBorderRadius = 4.0;
  
  /// Pull to refresh
  static const double pullToRefreshMinOffset = 10.0;
  static const double pullToRefreshTriggerOffset = 80.0;
  static const int refreshMinDuration = 1500;
  
  /// Opacity values
  static const double backButtonBackgroundAlpha = 0.2;
  static const double backButtonBorderAlpha = 0.2;
  static const double photoBorderAlpha = 0.2;
  static const double userIdAlpha = 0.5;
  static const double movieDirectorAlpha = 0.5;
  static const double shimmerBaseAlpha = 0.4;
  static const double shimmerHighlightAlpha = 0.6;
  static const double emptySlotBorderAlpha = 0.1;
  static const double emptySlotBackgroundAlpha = 0.3;
  static const double emptySlotIconAlpha = 0.3;
  static const double emptyStateTextAlpha = 0.6;
  static const double emptyStateTitleAlpha = 0.3;
  
  /// Shimmer configuration
  static const Duration shimmerPeriod = Duration(milliseconds: 1800);
  
  /// Colors with alpha values
  static Color get backButtonBackground => AppColors.socialButtonBackground;
  static Color get backButtonBorder => Colors.white.withValues(alpha: backButtonBorderAlpha);
  static Color get photoBorder => Colors.white.withValues(alpha: photoBorderAlpha);
  static Color get userIdColor => Colors.white.withValues(alpha: userIdAlpha);
  static Color get movieDirectorColor => Colors.white.withValues(alpha: movieDirectorAlpha);
  static Color get shimmerBaseColor => Colors.grey[800]!.withValues(alpha: shimmerBaseAlpha);
  static Color get shimmerHighlightColor => Colors.grey[600]!.withValues(alpha: shimmerHighlightAlpha);
  static Color get shimmerContainerColor => AppColors.inputBackground.withValues(alpha: 0.6);
  static Color get emptySlotBorderColor => Colors.white.withValues(alpha: emptySlotBorderAlpha);
  static Color get emptySlotBackgroundColor => AppColors.inputBackground.withValues(alpha: emptySlotBackgroundAlpha);
  static Color get emptySlotIconColor => Colors.white.withValues(alpha: emptySlotIconAlpha);
  static Color get emptyStateTextColor => Colors.white.withValues(alpha: emptyStateTextAlpha);
  static Color get emptyStateTitleColor => Colors.white.withValues(alpha: emptyStateTitleAlpha);
  static Color get shimmerCardBackgroundColor => AppColors.inputBackground.withValues(alpha: shimmerBaseAlpha);
  static Color get shimmerTextBackgroundColor => AppColors.inputBackground.withValues(alpha: shimmerBaseAlpha);
} 