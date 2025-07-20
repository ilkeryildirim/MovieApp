import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';

class PullToRefreshIndicator extends StatelessWidget {
  final double overscrollAmount;
  final double threshold;

  const PullToRefreshIndicator({
    super.key,
    required this.overscrollAmount,
    this.threshold = 80,
  });

  @override
  Widget build(BuildContext context) {
    final isReady = overscrollAmount > threshold;
    final opacity = (overscrollAmount / threshold).clamp(0.0, 1.0);
    final scale = (1.0 + (overscrollAmount / 250)).clamp(0.8, 1.3);

    return Positioned(
      top: 20.h + (overscrollAmount * 0.3).clamp(0, 80),
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 100),
        child: Transform.scale(
          scale: scale,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle: (overscrollAmount / 50) * 3.14159,
                  child: Icon(
                    Icons.refresh,
                    color: isReady ? Colors.green : Colors.white,
                    size: 22.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  isReady ? AppStrings.releaseToRefresh : AppStrings.refresh,
                  style: AppTextStyles.buttonSmall.copyWith(
                    color: isReady ? Colors.green : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 