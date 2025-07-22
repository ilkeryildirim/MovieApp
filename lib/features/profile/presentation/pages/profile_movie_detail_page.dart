import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';
import '../../../movie/data/models/movie_model.dart';

class ProfileMovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const ProfileMovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildMoviePoster(context),
            _buildGradientOverlay(),
            _buildMovieInfo(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviePoster(BuildContext context) {
    final posterUrl = movie.poster?.startsWith('http://') == true
        ? movie.poster!.replaceFirst('http://', 'https://')
        : movie.poster;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Hero(
        tag: 'movie_${movie.id}_profile', // Same hero tag as the grid card
        child: Material(
          type: MaterialType.transparency,
          child: ClipRect(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: posterUrl ?? '',
                key: ValueKey('profile_movie_detail_${movie.id}_${posterUrl.hashCode}'),
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildMoviePosterShimmer(),
                errorWidget: (context, url, error) => _buildMoviePlaceholder(),
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoviePosterShimmer() {
    return ClipRect(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[900]!.withOpacity(0.3),
          highlightColor: Colors.grey[700]!.withOpacity(0.5),
          period: const Duration(milliseconds: 1800),
          direction: ShimmerDirection.ltr,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.inputBackground.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildMoviePlaceholder() {
    return ClipRect(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryRed.withOpacity(0.8),
              AppColors.primaryRed.withOpacity(0.4),
            ],
          ),
        ),
        child: Center(
          child: Text(
            movie.title.isNotEmpty ? movie.title[0].toUpperCase() : 'M',
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              color: Colors.white,
              fontSize: 64.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.8),
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.inputBackground,
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Icon(
                    Icons.movie,
                    color: Colors.white.withOpacity(0.8),
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontFamily: AppAssets.euclidFontFamily,
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      if (movie.director != null)
                        Text(
                          'Director: ${movie.director}',
                          style: TextStyle(
                            fontFamily: AppAssets.euclidFontFamily,
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      SizedBox(height: 12.h),
                      Text(
                        movie.description,
                        style: TextStyle(
                          fontFamily: AppAssets.euclidFontFamily,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16.h,
      left: 20.w,
      child: SafeClickWidget(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: AppColors.socialButtonBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
} 