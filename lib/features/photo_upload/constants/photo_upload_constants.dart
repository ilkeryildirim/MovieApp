import 'package:flutter/material.dart';

/// Photo upload feature related constants
class PhotoUploadConstants {
  const PhotoUploadConstants._();
  
  // Dimensions
  static const double horizontalPadding = 24.0;
  static const double topPadding = 32.0;
  static const double bottomPadding = 40.0;
  
  // Upload area
  static const double uploadAreaSize = 167.0;
  static const double uploadAreaBorderRadius = 30.0;
  static const double uploadIconSize = 24.0;
  static const double uploadAreaBorderWidth = 1.0;
  
  // Button
  static const double buttonHeight = 52.0;
  static const double buttonBorderRadius = 18.0;
  static const double buttonFontSize = 16.0;
  static const FontWeight buttonFontWeight = FontWeight.w600;
  
  // Text
  static const double titleFontSize = 20.0;
  static const double subtitleFontSize = 14.0;
  static const FontWeight titleFontWeight = FontWeight.w700;
  static const FontWeight subtitleFontWeight = FontWeight.w400;
  static const double titleBottomSpacing = 12.0;
  static const double subtitleBottomSpacing = 40.0;
  
  // Colors
  static Color get uploadAreaBorderColor => Colors.white.withValues(alpha: 0.1);
  static Color get uploadAreaBackgroundColor => Colors.white.withValues(alpha: 0.1);
  static const Color uploadIconColor = Colors.white;
  
  // API
  static const String uploadEndpoint = '/user/upload_photo';
  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];
} 