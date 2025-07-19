import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_assets.dart';

class MovieShimmerLoading extends StatelessWidget {
  const MovieShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(
        children: [
          // Full screen shimmer poster
          Shimmer.fromColors(
            baseColor: AppColors.inputBackground.withOpacity(0.3),
            highlightColor: AppColors.inputBackground.withOpacity(0.6),
            period: const Duration(milliseconds: 1200),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.inputBackground,
            ),
          ),
          
          // Movie info overlay shimmer with favorite button
                      Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
              clipBehavior: Clip.none,
              children: [
                _buildShimmerMovieInfo(),
                // Favorite button shimmer - 19px above movie info
                Positioned(
                  top: -19.h - 70.h, // 19px gap + button height (70.h)
                  right: 20.w,
                  child: _buildShimmerActionButton(),
                ),
              ],
            ),
          ),
          
          // Bottom area background
          
        ],
      ),
    );
  }

  Widget _buildShimmerActionButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.5.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[800]!.withOpacity(0.3),
          highlightColor: Colors.grey[600]!.withOpacity(0.5),
          child: Container(
            width: 49.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.grey[700]!.withOpacity(0.4),
              borderRadius: BorderRadius.circular(24.5.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

    Widget _buildShimmerMovieInfo() {
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
      child: Column(
        children: [
          // Profile section shimmer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          width: 150.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          width: double.infinity,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
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
    );
  }
} 