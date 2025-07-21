import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../constants/profile_constants.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';

class ProfileHeader extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onLimitedOfferPressed;

  const ProfileHeader({
    super.key,
    this.onBackPressed,
    this.onLimitedOfferPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: ProfileConstants.horizontalPadding.w,
        right: ProfileConstants.horizontalPadding.w,
        top: MediaQuery.of(context).padding.top + ProfileConstants.headerTopPadding.h,
        bottom: ProfileConstants.headerBottomPadding.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: ProfileConstants.headerHeight.h,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: SafeClickWidget(
                    onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                    child: Container(
                      width: ProfileConstants.backButtonSize.w,
                      height: ProfileConstants.backButtonSize.w,
                      decoration: BoxDecoration(
                        color: ProfileConstants.backButtonBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: ProfileConstants.backIconSize.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      AppStrings.profileDetail,
                      style: TextStyle(
                        fontFamily: AppAssets.euclidFontFamily,
                        color: Colors.white,
                        fontSize: ProfileConstants.titleFontSize.sp,
                        fontWeight: ProfileConstants.titleFontWeight,
                        height: ProfileConstants.titleLineHeight,
                        letterSpacing: ProfileConstants.titleLetterSpacing,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: (ProfileConstants.headerHeight.h - ProfileConstants.limitedOfferButtonHeight.h) / 2,
                  child: SafeClickWidget(
                    onTap: onLimitedOfferPressed ?? () {},
                    child: Container(
                      height: ProfileConstants.limitedOfferButtonHeight.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: ProfileConstants.limitedOfferButtonPaddingH.w,
                        vertical: ProfileConstants.limitedOfferButtonPaddingV.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(ProfileConstants.limitedOfferBorderRadius.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: ProfileConstants.limitedOfferIconSize.sp,
                          ),
                          SizedBox(width: ProfileConstants.limitedOfferIconSpacing.w),
                          Text(
                            AppStrings.limitedOffer,
                            style: TextStyle(
                              fontFamily: AppAssets.euclidFontFamily,
                              color: Colors.white,
                              fontSize: ProfileConstants.limitedOfferTextSize.sp,
                              fontWeight: ProfileConstants.limitedOfferFontWeight,
                            ),
                          ),
                        ],
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