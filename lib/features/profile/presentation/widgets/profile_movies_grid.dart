import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../constants/profile_constants.dart';
import '../../../../../../core/widgets/safe_click_widget.dart';
import '../pages/profile_movie_detail_page.dart';

class ProfileMoviesGrid extends StatelessWidget {
  final List? favoriteMovies;
  final bool isLoading;

  const ProfileMoviesGrid({
    super.key,
    this.favoriteMovies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildShimmerGrid();
    }

    if (favoriteMovies == null || favoriteMovies!.isEmpty) {
      return _buildEmptyState();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ProfileConstants.gridCrossAxisCount,
        childAspectRatio: ProfileConstants.gridChildAspectRatio,
        crossAxisSpacing: ProfileConstants.gridCrossAxisSpacing.w,
        mainAxisSpacing: ProfileConstants.gridMainAxisSpacing.h,
      ),
      itemCount: favoriteMovies!.length,
      itemBuilder: (context, index) {
        final movie = favoriteMovies![index];
        return _buildMovieCard(context, movie);
      },
    );
  }

  Widget _buildMovieCard(BuildContext context, movie) {
    return SafeClickWidget(
      onTap: () => _navigateToMovieDetail(context, movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: 'movie_${movie.id}_profile',
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
                  child: movie.poster != null && movie.poster!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: movie.poster!.startsWith('http://') 
                              ? movie.poster!.replaceFirst('http://', 'https://') 
                              : movie.poster!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _buildMovieShimmer(),
                          errorWidget: (context, url, error) => _buildMoviePlaceholder(movie.title),
                        )
                      : _buildMoviePlaceholder(movie.title),
                ),
              ),
            ),
          ),
          SizedBox(height: ProfileConstants.movieImageToTextSpacing.h),
          Text(
            movie.title ?? AppStrings.movieTitle,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              color: Colors.white,
              fontSize: ProfileConstants.movieTitleFontSize.sp,
              fontWeight: ProfileConstants.movieTitleFontWeight,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: ProfileConstants.movieTitleToDirectorSpacing.h),
          Text(
            movie.director ?? AppStrings.defaultDirector,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              color: ProfileConstants.movieDirectorColor,
              fontSize: ProfileConstants.movieDirectorFontSize.sp,
              fontWeight: ProfileConstants.movieDirectorFontWeight,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  void _navigateToMovieDetail(BuildContext context, movie) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ProfileMovieDetailPage(movie: movie),
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget _buildMoviePlaceholder(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryRed.withValues(alpha: 0.8),
            AppColors.primaryRed.withValues(alpha: 0.4),
          ],
        ),
      ),
      child: Center(
        child: Text(
          title.isNotEmpty ? title[0].toUpperCase() : 'M',
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

  Widget _buildMovieShimmer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
        color: ProfileConstants.shimmerCardBackgroundColor,
      ),
      child: Shimmer.fromColors(
        baseColor: ProfileConstants.shimmerBaseColor,
        highlightColor: ProfileConstants.shimmerHighlightColor,
        period: ProfileConstants.shimmerPeriod,
        direction: ShimmerDirection.ltr,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
            color: ProfileConstants.shimmerContainerColor,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyMovieSlot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
              color: ProfileConstants.emptySlotBackgroundColor,
              border: Border.all(
                color: ProfileConstants.emptySlotBorderColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.movie_outlined,
                color: ProfileConstants.emptySlotIconColor,
                size: ProfileConstants.emptyIconSize.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: ProfileConstants.movieImageToTextSpacing.h),
        Container(
          height: ProfileConstants.shimmerTextHeight.h,
          width: ProfileConstants.shimmerTextWidth.w,
          decoration: BoxDecoration(
            color: ProfileConstants.shimmerTextBackgroundColor,
            borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
          ),
        ),
        SizedBox(height: ProfileConstants.movieTitleToDirectorSpacing.h),
        Container(
          height: ProfileConstants.shimmerSubTextHeight.h,
          width: ProfileConstants.shimmerSubTextWidth.w,
          decoration: BoxDecoration(
            color: ProfileConstants.shimmerTextBackgroundColor,
            borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: ProfileConstants.emptyStateHeight.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_outlined,
              color: ProfileConstants.emptyStateTitleColor,
              size: ProfileConstants.emptyStateIconSize.sp,
            ),
            SizedBox(height: ProfileConstants.emptyStateIconSpacing.h),
            Text(
              AppStrings.noFavoriteMoviesYet,
              style: TextStyle(
                fontFamily: AppAssets.euclidFontFamily,
                color: ProfileConstants.emptyStateTextColor,
                fontSize: ProfileConstants.emptyStateTitleFontSize.sp,
                fontWeight: ProfileConstants.emptyStateFontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ProfileConstants.gridCrossAxisCount,
        childAspectRatio: ProfileConstants.gridChildAspectRatio,
        crossAxisSpacing: ProfileConstants.gridCrossAxisSpacing.w,
        mainAxisSpacing: ProfileConstants.gridMainAxisSpacing.h,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildShimmerCard();
      },
    );
  }

  Widget _buildShimmerCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
              color: ProfileConstants.shimmerCardBackgroundColor,
            ),
            child: Shimmer.fromColors(
              baseColor: ProfileConstants.shimmerBaseColor,
              highlightColor: ProfileConstants.shimmerHighlightColor,
              period: ProfileConstants.shimmerPeriod,
              direction: ShimmerDirection.ltr,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ProfileConstants.movieCardBorderRadius.r),
                  color: ProfileConstants.shimmerContainerColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: ProfileConstants.movieImageToTextSpacing.h),
        Container(
          height: ProfileConstants.shimmerTextHeight.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
            color: ProfileConstants.shimmerTextBackgroundColor,
          ),
          child: Shimmer.fromColors(
            baseColor: ProfileConstants.shimmerBaseColor,
            highlightColor: ProfileConstants.shimmerHighlightColor,
            period: ProfileConstants.shimmerPeriod,
            direction: ShimmerDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
                color: ProfileConstants.shimmerContainerColor,
              ),
            ),
          ),
        ),
        SizedBox(height: ProfileConstants.movieTitleToDirectorSpacing.h),
        Container(
          height: ProfileConstants.shimmerSubTextHeight.h,
          width: ProfileConstants.shimmerSubTextWidth.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
            color: ProfileConstants.shimmerTextBackgroundColor,
          ),
          child: Shimmer.fromColors(
            baseColor: ProfileConstants.shimmerBaseColor,
            highlightColor: ProfileConstants.shimmerHighlightColor,
            period: ProfileConstants.shimmerPeriod,
            direction: ShimmerDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ProfileConstants.shimmerTextBorderRadius.r),
                color: ProfileConstants.shimmerContainerColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
} 