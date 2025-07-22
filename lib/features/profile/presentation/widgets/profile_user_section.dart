import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../constants/profile_constants.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';

class ProfileUserSection extends StatelessWidget {
  final String userName;
  final String userId;
  final String? photoUrl;
  final VoidCallback? onPhotoUpload;
  final Key? photoKey;

  const ProfileUserSection({
    super.key,
    required this.userName,
    required this.userId,
    this.photoUrl,
    this.onPhotoUpload,
    this.photoKey,
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
          _buildProfilePhoto(context),
          SizedBox(width: ProfileConstants.photoToNameSpacing.w),
          Expanded(
            child: _buildUserInfo(),
          ),
          _buildAddPhotoButton(),
        ],
      ),
    );
  }

  Widget _buildProfilePhoto(BuildContext context) {
    return Hero(
      tag: 'profile_photo_hero_$userId',
      child: GestureDetector(
        onTap: () => _showPhotoViewer(context),
        child: Container(
          key: photoKey,
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
        ),
      ),
    );
  }

  void _showPhotoViewer(BuildContext context) {
    if (photoUrl != null && photoUrl!.isNotEmpty) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false, // Transparent background
          pageBuilder: (context, animation, secondaryAnimation) => _PhotoViewer(
            photoUrl: photoUrl!,
            heroTag: 'profile_photo_hero_$userId',
          ),
          transitionDuration: const Duration(milliseconds: 300),
        ),
          );
  }
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

class _PhotoViewer extends StatelessWidget {
  final String photoUrl;
  final String heroTag;

  const _PhotoViewer({
    required this.photoUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.9),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: heroTag,
            child: Container(
              margin: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
                  imageUrl: photoUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: const BoxDecoration(
                      color: AppColors.inputBackground,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: const BoxDecoration(
                      color: AppColors.inputBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white.withValues(alpha: 0.5),
                      size: 50.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}