import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../data/models/movie_model.dart';
import 'movie_info_widget.dart';
import 'action_button.dart';
import '../../../../../../core/widgets/error_widget.dart';
import '../../../../../../core/constants/app_colors.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final int index;
  final bool isDescriptionExpanded;
  final VoidCallback onToggleDescription;
  final VoidCallback? onFavoritePressed;

  const MovieCard({
    super.key,
    required this.movie,
    required this.index,
    required this.isDescriptionExpanded,
    required this.onToggleDescription,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = 56.h + MediaQuery.of(context).padding.bottom + 26.h;
    
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildMoviePoster(context, bottomPadding),
          _buildGradientOverlay(bottomPadding),
          _buildMovieInfo(bottomPadding),
          _buildFavoriteButton(bottomPadding),
        ],
      ),
    );
  }

  Widget _buildMoviePoster(BuildContext context, double bottomPadding) {
    final posterUrl = movie.poster?.startsWith('http://') == true
        ? movie.poster!.replaceFirst('http://', 'https://')
        : movie.poster;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: bottomPadding,
      child: CachedNetworkImage(
        imageUrl: posterUrl ?? '',
        key: ValueKey('movie_poster_${movie.id}_${posterUrl.hashCode}'),
        fit: BoxFit.cover,
        httpHeaders: const {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
        },
        placeholder: (context, url) => _buildMoviePosterShimmer(),
        errorWidget: (context, url, error) => AppErrorWidget(
          message: AppStrings.posterLoadError,
          showRetryButton: false,
        ),
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  Widget _buildMoviePosterShimmer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[900]!.withOpacity(0.3),
        highlightColor: Colors.grey[700]!.withOpacity(0.5),
        period: const Duration(milliseconds: 2000),
        direction: ShimmerDirection.ltr,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.inputBackground.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay(double bottomPadding) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: bottomPadding,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.5),
              Colors.black.withValues(alpha: 0.7),
            ],
            stops: const [0.0, 0.5, 0.8, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(double bottomPadding) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: bottomPadding,
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
        child: MovieInfoWidget(
          movie: movie,
          isExpanded: isDescriptionExpanded,
          onToggleExpanded: onToggleDescription,
        ),
      ),
    );
  }

    Widget _buildFavoriteButton(double bottomPadding) {
     return AnimatedPositioned(
       duration: const Duration(milliseconds: 300),
       curve: Curves.easeInOut,
       right: 20.w,
       bottom: bottomPadding + (isDescriptionExpanded ? 150.h : 100.h) + 19.h,
       child: GestureDetector(
         onTap: onFavoritePressed ?? () {},
         child: ActionButton(
           icon: movie.isFavorite ? Icons.favorite : Icons.favorite_border,
           onPressed: onFavoritePressed ?? () {},
           backgroundColor: Colors.transparent,
           iconColor: movie.isFavorite ? Colors.white : Colors.white,
         ),
       ),
     );
   }
} 