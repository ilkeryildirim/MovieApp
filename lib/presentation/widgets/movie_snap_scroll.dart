import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/movie_model.dart';

class MovieSnapScroll extends StatefulWidget {
  final List<MovieModel> movies;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;

  const MovieSnapScroll({
    super.key,
    required this.movies,
    required this.scrollController,
    this.isLoadingMore = false,
    this.onLoadMore,
  });

  @override
  State<MovieSnapScroll> createState() => _MovieSnapScrollState();
}

class _MovieSnapScrollState extends State<MovieSnapScroll> {
  late PageController _pageController;
  int _currentMovieIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryRed,
        ),
      );
    }

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: widget.movies.length + (widget.isLoadingMore ? 1 : 0),
          onPageChanged: (index) {
            setState(() {
              _currentMovieIndex = index;
            });
            
            // Pagination logic - Son 2 item'da load more yap
            if (index >= widget.movies.length - 2 && widget.onLoadMore != null) {
              widget.onLoadMore!();
            }
          },
          itemBuilder: (context, index) {
            // Loading indicator'ı son item'da göster
            if (index == widget.movies.length && widget.isLoadingMore) {
              return _buildLoadingIndicator();
            }

            final movie = widget.movies[index];
            return _buildMovieCard(movie, index);
          },
        ),
        
        // Loading indicator for pagination
        if (widget.isLoadingMore && widget.movies.isNotEmpty)
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 16.w,
                      height: 16.w,
                      child: const CircularProgressIndicator(
                        color: AppColors.primaryRed,
                        strokeWidth: 2,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Yükleniyor...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryRed,
          strokeWidth: 3,
        ),
      ),
    );
  }

  Widget _buildMovieCard(MovieModel movie, int index) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(
        children: [
          // Full screen poster
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: movie.posterUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: AppColors.inputBackground,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryRed,
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.inputBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.grayText,
                      size: 48.sp,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Resim yüklenemedi',
                      style: TextStyle(
                        color: AppColors.grayText,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'URL: ${movie.posterUrl}',
                      style: TextStyle(
                        color: AppColors.grayText,
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Right side action buttons
          Positioned(
            right: 20.w,
            bottom: 120.h,
            child: Column(
              children: [
                _buildActionButton(
                  icon: Icons.favorite_border,
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                _buildActionButton(
                  icon: Icons.share,
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                _buildActionButton(
                  icon: Icons.bookmark_border,
                  onTap: () {},
                ),
              ],
            ),
          ),
          
          // Movie info overlay (bottom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildMovieInfo(movie),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildMovieInfo(MovieModel movie) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.9),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 100.w, 30.h), // Right padding for buttons
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Movie title
          Text(
            movie.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          
          // Movie description
          Text(
            movie.description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
} 