import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/core/constants/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/safe_click_widget.dart';
import '../../../../core/utils/image_compress_helper.dart';
import '../blocs/photo_upload/photo_upload_bloc.dart';
import '../widgets/photo_upload_area.dart';
import '../../constants/photo_upload_constants.dart';

class PhotoUploadPage extends StatefulWidget {
  const PhotoUploadPage({super.key});

  @override
  State<PhotoUploadPage> createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;

  Future<void> _pickImage() async {
    try {
      // Check platform-specific permission
      PermissionStatus permission;
      if (Platform.isAndroid) {
        // Try photos permission first (Android 13+)
        permission = await Permission.photos.status;
        if (permission.isDenied || permission.isRestricted) {
          permission = await Permission.photos.request();
        }
        
        // If photos permission is not supported, fallback to storage
        if (permission.isDenied) {
          permission = await Permission.storage.status;
          if (permission.isDenied || permission.isRestricted) {
            permission = await Permission.storage.request();
          }
        }
      } else {
        // For iOS, use photos permission
        permission = await Permission.photos.status;
        if (permission.isDenied || permission.isRestricted) {
          permission = await Permission.photos.request();
        }
      }
      
      if (permission.isGranted || permission.isLimited) {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50, // Reduced quality to reduce file size
          maxWidth: 800,    // Added max dimensions
          maxHeight: 800,
        );

        if (image != null) {
          final originalFile = File(image.path);
          
          // Show loading while compressing
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Fotoğraf işleniyor...'),
                duration: Duration(seconds: 2),
              ),
            );
          }
          
          // Compress image
          final compressedFile = await ImageCompressHelper.compressImage(originalFile);
          
          setState(() {
            _selectedFile = compressedFile ?? originalFile;
          });
        }
      } else if (permission.isPermanentlyDenied) {
        _showPermissionDialog();
      } else {
        // Permission denied, show info
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fotoğraf seçmek için izin gerekli'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Hata: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.inputBackground,
        title: const Text(
          'İzin Gerekli',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Fotoğraf seçmek için galeriye erişim izni gerekli. Lütfen ayarlardan izin verin.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Ayarlar'),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PhotoUploadBloc>(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: BlocConsumer<PhotoUploadBloc, PhotoUploadState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (photoUrl) {
                  // Navigate back or to profile with photoUrl
                  context.pop(photoUrl);
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: AppColors.errorColor,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                uploading: () => true,
                orElse: () => false,
              );

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PhotoUploadConstants.horizontalPadding.w,
                ),
                child: Column(
                  children: [
                    SizedBox(height: PhotoUploadConstants.topPadding.h),
                    _buildHeader(context),
                     SizedBox(height: 88.h,),
                    _buildContent(),
                    const Spacer(),
                    _buildButton(context, isLoading),
                    SizedBox(height: PhotoUploadConstants.bottomPadding.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        SafeClickWidget(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.inputBackground.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        Text(
          AppStrings.profileDetails,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: AppAssets.euclidFontFamily,
            color: Colors.white,
            fontSize: 15.sp
          ),
        ),
        const Spacer(),
        SizedBox(width: 44.w), // Balance for back button
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.uploadYourPhotos,
          style: TextStyle(
            fontSize: PhotoUploadConstants.titleFontSize.sp,
            fontWeight: PhotoUploadConstants.titleFontWeight,
            color: Colors.white,
          ),
        ),
        SizedBox(height: PhotoUploadConstants.titleBottomSpacing.h),
        Text(
          AppStrings.uploadPhotosSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: PhotoUploadConstants.subtitleFontSize.sp,
            fontWeight: PhotoUploadConstants.subtitleFontWeight,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(height: PhotoUploadConstants.subtitleBottomSpacing.h),
        PhotoUploadArea(
          selectedFile: _selectedFile,
          onTap: _pickImage,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, bool isLoading) {
    final hasFile = _selectedFile != null;
    final isEnabled = hasFile && !isLoading;
    
    return SafeClickWidget(
      onTap: isEnabled ? () {
        if (_selectedFile != null) {
          context.read<PhotoUploadBloc>().add(
            PhotoUploadEvent.uploadPhoto(_selectedFile!),
          );
        }
      } : null,
      child: Container(
        width: double.infinity,
        height: PhotoUploadConstants.buttonHeight.h,
        decoration: BoxDecoration(
          color: isEnabled 
              ? AppColors.primaryRed 
              : AppColors.primaryRed.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(
            PhotoUploadConstants.buttonBorderRadius.r,
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  AppStrings.continueButton,
                  style: TextStyle(
                    fontSize: PhotoUploadConstants.buttonFontSize.sp,
                    fontWeight: PhotoUploadConstants.buttonFontWeight,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
} 