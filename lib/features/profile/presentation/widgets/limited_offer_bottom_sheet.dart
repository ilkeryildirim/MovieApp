import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/safe_click_widget.dart';
import '../../constants/limited_offer_constants.dart';

class LimitedOfferBottomSheet extends StatelessWidget {
  const LimitedOfferBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LimitedOfferBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * LimitedOfferConstants.bottomSheetHeightRatio,
      decoration: BoxDecoration(
        color: Color(LimitedOfferConstants.containerBackgroundColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(LimitedOfferConstants.cornerRadius.r),
          topRight: Radius.circular(LimitedOfferConstants.cornerRadius.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(LimitedOfferConstants.cornerRadius.r),
                topRight: Radius.circular(LimitedOfferConstants.cornerRadius.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      LimitedOfferConstants.gradientCenterX,
                      LimitedOfferConstants.gradientCenterY,
                    ),
                    radius: LimitedOfferConstants.gradientRadius,
                    colors: [
                      Color(LimitedOfferConstants.gradientStartColor),
                      Color(LimitedOfferConstants.gradientEndColor),
                    ],
                    stops: LimitedOfferConstants.gradientStops,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              _buildHandle(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: LimitedOfferConstants.horizontalPadding.w),
                  child: Column(
                    children: [
                      SizedBox(height: LimitedOfferConstants.topSpacing.h),
                      _buildHeader(),
                      SizedBox(height: LimitedOfferConstants.headerBottomSpacing.h),
                      _buildBonuses(),
                      SizedBox(height: LimitedOfferConstants.bonusesBottomSpacing.h),
                      _buildTokenPackages(),
                      SizedBox(height: LimitedOfferConstants.packagesBottomSpacing.h),
                      _buildViewAllButton(),
                      SizedBox(height: LimitedOfferConstants.bottomSpacing.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: EdgeInsets.only(top: LimitedOfferConstants.handleTopMargin.h),
      width: LimitedOfferConstants.handleWidth.w,
      height: LimitedOfferConstants.handleHeight.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: LimitedOfferConstants.handleOpacity),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          AppStrings.limitedOfferTitle,
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            fontSize: LimitedOfferConstants.titleFontSize.sp,
            fontWeight: LimitedOfferConstants.titleFontWeight,
            color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
          ),
        ),
        SizedBox(height: LimitedOfferConstants.subtitleTopSpacing.h),
        Text(
          AppStrings.limitedOfferSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            fontSize: LimitedOfferConstants.subtitleFontSize.sp,
            fontWeight: LimitedOfferConstants.subtitleFontWeight,
            color: Colors.white.withValues(alpha: LimitedOfferConstants.tertiaryTextOpacity),
          ),
        ),
      ],
    );
  }

  Widget _buildBonuses() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(LimitedOfferConstants.bonusContainerRadius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: LimitedOfferConstants.bonusBlurSigma,
          sigmaY: LimitedOfferConstants.bonusBlurSigma,
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: LimitedOfferConstants.bonusContainerPaddingHorizontal.w,
            right: LimitedOfferConstants.bonusContainerPaddingHorizontal.w,
            top: LimitedOfferConstants.bonusContainerPaddingTop.w,
            bottom: LimitedOfferConstants.bonusContainerPaddingBottom.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: LimitedOfferConstants.bonusBackgroundOpacity),
            borderRadius: BorderRadius.circular(LimitedOfferConstants.bonusContainerRadius.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: LimitedOfferConstants.bonusBorderOpacity),
              width: 1,
            ),
          ),
      child: Column(
        children: [
          Text(
            AppStrings.receiveBonuses,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              fontSize: LimitedOfferConstants.bonusTitleFontSize.sp,
              fontWeight: LimitedOfferConstants.bonusTitleFontWeight,
              color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
            ),
          ),
          SizedBox(height: LimitedOfferConstants.bonusItemSpacing.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBonusItem(
                iconPath: AppAssets.diamondIcon,
                label: AppStrings.premiumAccount,
              ),
              _buildBonusItem(
                iconPath: AppAssets.heartsIcon,
                label: AppStrings.moreMatches,
              ),
              _buildBonusItem(
                iconPath: AppAssets.arrowUpIcon,
                label: AppStrings.boost,
              ),
              _buildBonusItem(
                iconPath: AppAssets.heartIcon,
                label: AppStrings.moreLikes,
              ),
            ],
          ),
        ],
      ),
        ),
      ),
    );
  }

  Widget _buildBonusItem({
    required String iconPath,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: LimitedOfferConstants.bonusIconSize.w,
          height: LimitedOfferConstants.bonusIconSize.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppAssets.bgBonus),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        SizedBox(height: LimitedOfferConstants.bonusLabelTopSpacing.h),
        SizedBox(
          width: 60.w,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              fontSize: LimitedOfferConstants.bonusLabelFontSize.sp,
              fontWeight: LimitedOfferConstants.bonusLabelFontWeight,
              color: Colors.white.withValues(alpha: LimitedOfferConstants.bonusLabelOpacity),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTokenPackages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.selectTokenPackage,
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            fontSize: LimitedOfferConstants.packageTitleFontSize.sp,
            fontWeight: LimitedOfferConstants.subtitleFontWeight,
            color: Colors.white.withValues(alpha: LimitedOfferConstants.secondaryTextOpacity),
          ),
        ),
        SizedBox(height: LimitedOfferConstants.packageTitleBottomSpacing.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTokenPackage(
              tokenAmount: '330',
              price: '699,99',
              originalTokens: '200',
              discount: '10%',
              isHighlighted: false,
              packageIndex: 0,
            ),
            _buildTokenPackage(
              tokenAmount: '3.375',
              price: '6799,99',
              originalTokens: '2.000',
              discount: '70%',
              isHighlighted: true,
              packageIndex: 1,
            ),
            _buildTokenPackage(
              tokenAmount: '1.350',
              price: '6399,99',
              originalTokens: '1.000',
              discount: '35%',
              isHighlighted: false,
              packageIndex: 0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTokenPackage({
    required String tokenAmount,
    required String price,
    required String originalTokens,
    required String discount,
    required bool isHighlighted,
    required int packageIndex,
  }) {
    return Container(
      width: 112.w,
      height: 218.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            packageIndex == 0 ? AppAssets.bgPackage0 : AppAssets.bgPackage1,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Badge'ın dışarı taşmasını sağlar
        children: [
          // Discount badge - borderın tam ortasında (yarısı içinde yarısı dışında)
          Positioned(
            top: LimitedOfferConstants.discountBadgeTopOffset.h, // Yarısı dışarıda olsun
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: LimitedOfferConstants.discountBadgeWidth.w,
                height: LimitedOfferConstants.discountBadgeHeight.h,
                decoration: BoxDecoration(
                  color: Color(LimitedOfferConstants.discountBadgeBackgroundColor),
                  borderRadius: BorderRadius.circular(LimitedOfferConstants.discountBadgeRadius.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: LimitedOfferConstants.discountBadgeShadowBlur,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '-$discount',
                    style: TextStyle(
                      fontFamily: AppAssets.euclidFontFamily,
                      fontSize: LimitedOfferConstants.discountBadgeFontSize.sp,
                      fontWeight: LimitedOfferConstants.discountBadgeFontWeight,
                      color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(LimitedOfferConstants.packagePadding.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: LimitedOfferConstants.packageContentTopSpacing.h),
                Text(
                  originalTokens,
                  style: TextStyle(
                    fontFamily: AppAssets.euclidFontFamily,
                    fontSize: LimitedOfferConstants.originalTokenFontSize.sp,
                    fontWeight: LimitedOfferConstants.originalTokenFontWeight,
                    color: Colors.white.withValues(alpha: LimitedOfferConstants.tertiaryTextOpacity),
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white.withValues(alpha: LimitedOfferConstants.tertiaryTextOpacity),
                  ),
                ),
                SizedBox(height: LimitedOfferConstants.packageTokenSpacing.h),
                Text(
                  tokenAmount,
                  style: TextStyle(
                    fontFamily: AppAssets.euclidFontFamily,
                    fontSize: LimitedOfferConstants.tokenAmountFontSize.sp,
                    fontWeight: LimitedOfferConstants.tokenAmountFontWeight,
                    color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
                  ),
                ),
                Text(
                  AppStrings.tokens,
                  style: TextStyle(
                    fontFamily: AppAssets.euclidFontFamily,
                    fontSize: LimitedOfferConstants.tokenLabelFontSize.sp,
                    fontWeight: LimitedOfferConstants.tokenLabelFontWeight,
                    color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [

                    Container(
                      height: LimitedOfferConstants.priceLineHeight.h,
                      width: double.infinity,
                      color: Colors.white.withValues(alpha: LimitedOfferConstants.priceLineOpacity),
                    ),
                    SizedBox(height: LimitedOfferConstants.priceLineSpacing.h),

                    Column(
                      children: [
                        Text(
                          'TL$price',
                          style: TextStyle(
                            fontFamily: AppAssets.euclidFontFamily,
                            fontSize: LimitedOfferConstants.priceFontSize.sp,
                            fontWeight: LimitedOfferConstants.priceFontWeight,
                            color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
                          ),
                        ),
                        Text(
                          AppStrings.perWeek,
                          style: TextStyle(
                            fontFamily: AppAssets.euclidFontFamily,
                            fontSize: LimitedOfferConstants.priceSubtitleFontSize.sp,
                            fontWeight: LimitedOfferConstants.priceSubtitleFontWeight,
                            color: Colors.white.withValues(alpha: LimitedOfferConstants.tertiaryTextOpacity),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton() {
    return SafeClickWidget(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: LimitedOfferConstants.buttonHeight.h,
        decoration: BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.circular(LimitedOfferConstants.buttonRadius.r),
        ),
        child: Center(
          child: Text(
            AppStrings.viewAllTokens,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              fontSize: LimitedOfferConstants.buttonFontSize.sp,
              fontWeight: LimitedOfferConstants.subtitleFontWeight,
              color: Colors.white.withValues(alpha: LimitedOfferConstants.primaryTextOpacity),
            ),
          ),
        ),
      ),
    );
  }
}