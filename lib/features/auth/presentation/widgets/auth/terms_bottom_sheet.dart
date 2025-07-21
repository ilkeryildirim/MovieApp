import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';

class TermsBottomSheet extends StatefulWidget {
  final VoidCallback onAccepted;
  final Duration? cooldownDuration;

  const TermsBottomSheet({
    super.key,
    required this.onAccepted,
    this.cooldownDuration,
  });

  @override
  State<TermsBottomSheet> createState() => _TermsBottomSheetState();
}

class _TermsBottomSheetState extends State<TermsBottomSheet> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;
  bool _isAccepted = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (!_hasScrolledToBottom) {
        setState(() {
          _hasScrolledToBottom = true;
        });
      }
    }
  }

  void _handleAccept() {
    if (_hasScrolledToBottom && !_isAccepted) {
      setState(() {
        _isAccepted = true;
      });
      widget.onAccepted();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.userAgreement,
                  style: TextStyle(
                    color: AppColors.whiteText,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SafeClickWidget(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: AppColors.grayText,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.all(20.w),
              child: Text(
                AppStrings.userAgreementContent,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),

          // Bottom section
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                if (!_hasScrolledToBottom) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                         decoration: BoxDecoration(
                       color: Colors.orange.withOpacity(0.1),
                       borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.orange.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.orange,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            AppStrings.scrollToBottomToConfirm,
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
                
                SafeClickWidget(
                  onTap: _hasScrolledToBottom ? _handleAccept : null,
                  cooldownDuration: widget.cooldownDuration ?? const Duration(milliseconds: 500),
                  child: Container(
                    width: double.infinity,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: _hasScrolledToBottom 
                          ? AppColors.primaryRed 
                          : AppColors.primaryRed.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.iUnderstand,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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