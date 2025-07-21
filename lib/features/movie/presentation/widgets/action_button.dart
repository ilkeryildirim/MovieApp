import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.5.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: 49.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(24.5.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: .2),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
} 