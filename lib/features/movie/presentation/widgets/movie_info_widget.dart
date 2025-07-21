import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/movie_model.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class MovieInfoWidget extends StatelessWidget {
  final MovieModel movie;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  const MovieInfoWidget({
    super.key,
    required this.movie,
    required this.isExpanded,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCircle(),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.heading4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  _buildExpandableDescription(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileCircle() {
    return Container(
      width: 40.w,
      height: 40.w,
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
          if (!isExpanded) ...[
            LayoutBuilder(
              builder: (context, constraints) {
                final textStyle = AppTextStyles.bodySmall.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  height: 1.4,
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
                    onTap: onToggleExpanded,
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        style: textStyle,
                        children: [
                          TextSpan(text: movie.description.substring(0, movie.description.length > 60 ? 60 : movie.description.length)),
                          TextSpan(
                            text: ' ${AppStrings.showMore}',
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
          
          if (isExpanded) ...[
            Text(
              movie.description,
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white.withOpacity(0.8),
                height: 1.4,
              ),
                          ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: onToggleExpanded,
              child: Text(
                AppStrings.showLess,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
} 