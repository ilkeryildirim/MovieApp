import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool showRetryButton;

  const AppErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.showRetryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: AppColors.primaryRed,
          ),
          SizedBox(height: 16.h),
          Text(
            AppStrings.errorOccurred,
            style: AppTextStyles.heading4,
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.grayText,
            ),
            textAlign: TextAlign.center,
          ),
          if (showRetryButton && onRetry != null) ...[
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryRed,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                AppStrings.retry,
                style: AppTextStyles.button,
              ),
            ),
          ],
        ],
      ),
    );
  }
} 