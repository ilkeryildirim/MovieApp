import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/profile_constants.dart';
import '../../../core/widgets/safe_click_widget.dart';

class ProfileUserSection extends StatelessWidget {
  final String userName;
  final String userId;
  final String? photoUrl;
  final VoidCallback? onPhotoUpload;

  const ProfileUserSection({
    super.key,
    required this.userName,
    required this.userId,
    this.photoUrl,
    this.onPhotoUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ProfileConstants.horizontalPadding.w,
        right: ProfileConstants.horizontalPadding.w,
      ),
      child: Row(
        children: [
          _buildProfilePhoto(),
          SizedBox(width: ProfileConstants.photoToNameSpacing.w),
          Expanded(
            child: _buildUserInfo(),
          ),
          _buildAddPhotoButton(),
        ],
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Container(
      width: ProfileConstants.profilePhotoSize.w,
      height: ProfileConstants.profilePhotoSize.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ProfileConstants.photoBorder,
          width: ProfileConstants.photoBorderWidth,
        ),
      ),
      child: ClipOval(
        child: photoUrl != null && photoUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: photoUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildUserInitial(),
                errorWidget: (context, url, error) => _buildUserInitial(),
              )
            : _buildUserInitial(),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          userName.isNotEmpty ? userName : AppStrings.defaultUser,
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            color: Colors.white,
            fontSize: ProfileConstants.userNameFontSize.sp,
            fontWeight: ProfileConstants.userNameFontWeight,
          ),
        ),
        SizedBox(height: ProfileConstants.nameToIdSpacing.h),
        Text(
          'ID: ${userId.length > 6 ? userId.substring(0, 6) : userId}',
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            color: ProfileConstants.userIdColor,
            fontSize: ProfileConstants.userIdFontSize.sp,
            fontWeight: ProfileConstants.userIdFontWeight,
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoButton() {
    return SafeClickWidget(
      onTap: onPhotoUpload ?? () {},
      child: Container(
        width: ProfileConstants.addPhotoButtonWidth.w,
        height: ProfileConstants.addPhotoButtonHeight.h,
        decoration: BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.circular(ProfileConstants.addPhotoButtonBorderRadius.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ProfileConstants.addPhotoButtonPaddingH.w,
            vertical: ProfileConstants.addPhotoButtonPaddingV.h,
          ),
          child: Center(
            child: Text(
              AppStrings.addPhoto,
              style: TextStyle(
                fontFamily: AppAssets.euclidFontFamily,
                color: Colors.white,
                fontSize: ProfileConstants.addPhotoTextSize.sp,
                fontWeight: ProfileConstants.addPhotoFontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInitial() {
    return Container(
      color: AppColors.primaryRed,
      child: Center(
        child: Text(
          userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
          style: TextStyle(
            fontFamily: AppAssets.euclidFontFamily,
            color: Colors.white,
            fontSize: ProfileConstants.initialTextSize.sp,
            fontWeight: ProfileConstants.initialFontWeight,
          ),
        ),
      ),
    );
  }
} 