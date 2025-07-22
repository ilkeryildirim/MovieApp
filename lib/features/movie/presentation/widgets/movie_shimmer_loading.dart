import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui';
import '../../../../../../core/constants/app_colors.dart';

class MovieShimmerLoading extends StatelessWidget {
  const MovieShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = 56.h + MediaQuery.of(context).padding.bottom + 26.h;
    
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildMoviePosterShimmer(bottomPadding),
          _buildGradientOverlay(bottomPadding),
          _buildMovieInfoShimmer(bottomPadding),
          _buildFavoriteButtonShimmer(bottomPadding),
        ],
      ),
    );
  }

  Widget _buildMoviePosterShimmer(double bottomPadding) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: bottomPadding,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[900]!.withOpacity(0.3),
          highlightColor: Colors.grey[700]!.withOpacity(0.5),
          period: const Duration(milliseconds: 2000),
          direction: ShimmerDirection.ltr,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.inputBackground.withOpacity(0.4),
                  AppColors.inputBackground.withOpacity(0.2),
                  AppColors.inputBackground.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay(double bottomPadding) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: bottomPadding,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.5),
              Colors.black.withValues(alpha: 0.7),
            ],
            stops: const [0.0, 0.5, 0.8, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfoShimmer(double bottomPadding) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: bottomPadding,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.8),
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile circle shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[800]!.withOpacity(0.4),
              highlightColor: Colors.grey[600]!.withOpacity(0.6),
              period: const Duration(milliseconds: 1800),
              direction: ShimmerDirection.ltr,
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.inputBackground.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Movie info shimmer
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title shimmer
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!.withOpacity(0.4),
                    highlightColor: Colors.grey[600]!.withOpacity(0.6),
                    period: const Duration(milliseconds: 1800),
                    direction: ShimmerDirection.ltr,
                    child: Container(
                      width: 200.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Movie description shimmer - 2 lines
                  Shimmer.fromColors(
                    baseColor: Colors.grey[800]!.withOpacity(0.4),
                    highlightColor: Colors.grey[600]!.withOpacity(0.6),
                    period: const Duration(milliseconds: 1800),
                    direction: ShimmerDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: AppColors.inputBackground.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 250.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: AppColors.inputBackground.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteButtonShimmer(double bottomPadding) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      right: 20.w,
      bottom: bottomPadding + 100.h + 19.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.5.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[800]!.withOpacity(0.4),
            highlightColor: Colors.grey[600]!.withOpacity(0.6),
            period: const Duration(milliseconds: 1800),
            direction: ShimmerDirection.ltr,
            child: Container(
              width: 49.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.inputBackground.withOpacity(0.6),
                borderRadius: BorderRadius.circular(24.5.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 