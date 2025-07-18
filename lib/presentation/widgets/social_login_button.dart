import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/safe_click_widget.dart';
import '../../core/constants/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      cooldownDuration: const Duration(milliseconds: 100),
      onTap: onPressed,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: AppColors.socialButtonBackground,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
} 