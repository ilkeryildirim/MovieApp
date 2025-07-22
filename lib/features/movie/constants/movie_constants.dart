import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class MovieConstants {
  MovieConstants._();

  // Font Sizes
  static const double movieTitleFontSize = 18.0;
  static const double movieDescriptionFontSize = 14.0;
  static const double showMoreFontSize = 13.0;
  static const double ratingFontSize = 12.0;
  static const double genreFontSize = 11.0;
  static const double yearFontSize = 12.0;

  // Font Weights
  static const FontWeight movieTitleFontWeight = FontWeight.w600;
  static const FontWeight movieDescriptionFontWeight = FontWeight.w400;
  static const FontWeight showMoreFontWeight = FontWeight.w700;
  static const FontWeight ratingFontWeight = FontWeight.w500;
  static const FontWeight genreFontWeight = FontWeight.w400;
  static const FontWeight yearFontWeight = FontWeight.w400;

  // Colors
  static const Color movieTitleColor = Colors.white;
  static const Color movieDescriptionColor = Colors.white70;
  static const Color showMoreColor = Colors.white;
  static const Color ratingColor = Colors.amber;
  static const Color genreColor = Colors.white60;
  static const Color yearColor = Colors.white60;

  // Dimensions
  static const double movieCardWidth = 160.0;
  static const double movieCardHeight = 240.0;
  static const double movieImageHeight = 180.0;
  static const double movieCardRadius = 12.0;
  static const double movieCardPadding = 8.0;

  // Spacing
  static const double titleSpacing = 4.0;
  static const double descriptionSpacing = 6.0;
  static const double ratingSpacing = 4.0;
  static const double gridSpacing = 16.0;
  static const double sectionSpacing = 24.0;

  // Text Styles
  static const TextStyle movieTitleStyle = TextStyle(
    fontSize: movieTitleFontSize,
    fontWeight: movieTitleFontWeight,
    color: movieTitleColor,
  );

  static const TextStyle movieDescriptionStyle = TextStyle(
    fontSize: movieDescriptionFontSize,
    fontWeight: movieDescriptionFontWeight,
    color: movieDescriptionColor,
  );

  static const TextStyle showMoreStyle = TextStyle(
    fontSize: showMoreFontSize,
    fontWeight: showMoreFontWeight,
    color: showMoreColor,
  );

  static const TextStyle ratingStyle = TextStyle(
    fontSize: ratingFontSize,
    fontWeight: ratingFontWeight,
    color: ratingColor,
  );

  static const TextStyle genreStyle = TextStyle(
    fontSize: genreFontSize,
    fontWeight: genreFontWeight,
    color: genreColor,
  );

  static const TextStyle yearStyle = TextStyle(
    fontSize: yearFontSize,
    fontWeight: yearFontWeight,
    color: yearColor,
  );
} 