import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/movie_model.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class MovieInfoWidget extends StatelessWidget {
  final MovieModel movie;
  final bool isDescriptionExpanded;
  final VoidCallback onDescriptionToggle;

  const MovieInfoWidget({
    super.key,
    required this.movie,
    required this.isDescriptionExpanded,
    required this.onDescriptionToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.8),
          ],
          stops: const [0.0, 0.3, 1.0],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildProfileCircle(),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppAssets.euclidFontFamily,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    _buildExpandableDescription(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCircle() {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.inputBackground,
      ),
      padding: EdgeInsets.all(8.w),
      child: SvgPicture.asset(
        AppAssets.moviePlaceholderIcon,
        color: Colors.white.withOpacity(0.8),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildExpandableDescription() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isDescriptionExpanded) ...[
            LayoutBuilder(
              builder: (context, constraints) {
                final textStyle = TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  fontFamily: AppAssets.euclidFontFamily,
                );
                
                final textSpan = TextSpan(
                  text: movie.description,
                  style: textStyle,
                );
                
                final textPainter = TextPainter(
                  text: textSpan,
                  maxLines: 2,
                  textDirection: TextDirection.ltr,
                )..layout(maxWidth: constraints.maxWidth);
                
                if (textPainter.didExceedMaxLines) {
                  return GestureDetector(
                    onTap: onDescriptionToggle,
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        style: textStyle,
                        children: [
                          TextSpan(text: movie.description.substring(0, movie.description.length > 60 ? 60 : movie.description.length)),
                          TextSpan(
                            text: '... ' + AppStrings.showMore,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppAssets.euclidFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text(
                    movie.description,
                    style: textStyle,
                  );
                }
              },
            ),
          ],
          
          if (isDescriptionExpanded) ...[
            Text(
              movie.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 1.4,
                fontFamily: AppAssets.euclidFontFamily,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: onDescriptionToggle,
              child: Text(
                AppStrings.showLess,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppAssets.euclidFontFamily,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
} 