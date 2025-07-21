import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/svg_helper.dart';
import '../../../../core/widgets/safe_click_widget.dart';
import '../../constants/photo_upload_constants.dart';

class PhotoUploadArea extends StatelessWidget {
  final File? selectedFile;
  final VoidCallback onTap;

  const PhotoUploadArea({
    super.key,
    required this.selectedFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeClickWidget(
      onTap: onTap,
      child: Container(
        width: PhotoUploadConstants.uploadAreaSize.w,
        height: PhotoUploadConstants.uploadAreaSize.w,
        decoration: BoxDecoration(
          color: PhotoUploadConstants.uploadAreaBackgroundColor,
          borderRadius: BorderRadius.circular(
            PhotoUploadConstants.uploadAreaBorderRadius.r,
          ),
          border: Border.all(
            color: PhotoUploadConstants.uploadAreaBorderColor,
            width: PhotoUploadConstants.uploadAreaBorderWidth,
          ),
        ),
        child: selectedFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                  PhotoUploadConstants.uploadAreaBorderRadius.r,
                ),
                child: Image.file(
                  selectedFile!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
                        : Center(
                child: SvgIcon(
                  asset: AppAssets.plusIcon,
                  width: PhotoUploadConstants.uploadIconSize.sp,
                  height: PhotoUploadConstants.uploadIconSize.sp,
                  color: PhotoUploadConstants.uploadIconColor,
                ),
              ),
      ),
    );
  }
}
