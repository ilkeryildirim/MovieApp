import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/movie_model.dart';
import 'movie_shimmer_loading.dart';
import 'movie_info_widget.dart';
import 'action_button.dart';

class MovieSnapScroll extends StatefulWidget {
  final List<MovieModel> movies;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final VoidCallback? onRefresh;

  const MovieSnapScroll({
    super.key,
    required this.movies,
    required this.scrollController,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.onRefresh,
  });

  @override
  State<MovieSnapScroll> createState() => _MovieSnapScrollState();
}

class _MovieSnapScrollState extends State<MovieSnapScroll> {
  late PageController _pageController;
  bool _isDescriptionExpanded = false;
  bool _showPullToRefresh = false;
  double _overscrollAmount = 0.0;
  bool _isRefreshing = false;
  bool _isGoingToFirst = false;
  int _currentPage = 0;
  bool _canRefresh = false; // Eşik aşıldığında true olur
  Timer? _releaseTimer; // Bırakma kontrolü için timer
  double _lastOverscroll = 0.0; // Son overscroll değeri

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages();
  }

  @override
  void didUpdateWidget(MovieSnapScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.movies.length > oldWidget.movies.length) {
      _preloadImages();
    }
  }

  void _preloadImages() {
    for (int i = 0; i < widget.movies.length && i < 5; i++) {
      if (widget.movies[i].posterUrl.isNotEmpty) {
        precacheImage(
          CachedNetworkImageProvider(
            widget.movies[i].posterUrl.replaceFirst('http://', 'https://'),
            headers: const {
              'User-Agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
              'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
              'Accept-Language': 'en-US,en;q=0.9',
              'Referer': 'https://www.imdb.com/',
            },
          ),
          context,
        );
      }
    }
  }

  void _preloadNearbyImages(int currentIndex) {
    if (widget.movies.isEmpty) return;

    const preloadRadius = 2;
    final startIndex =
        (currentIndex - preloadRadius).clamp(0, widget.movies.length - 1);
    final endIndex =
        (currentIndex + preloadRadius).clamp(0, widget.movies.length - 1);

    for (int i = startIndex; i <= endIndex; i++) {
      if (widget.movies[i].posterUrl.isNotEmpty) {
        precacheImage(
          CachedNetworkImageProvider(
            widget.movies[i].posterUrl.replaceFirst('http://', 'https://'),
            headers: const {
              'User-Agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
              'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
              'Accept-Language': 'en-US,en;q=0.9',
              'Referer': 'https://www.imdb.com/',
            },
          ),
          context,
        );
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _releaseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const MovieShimmerLoading();
    }

    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              final currentPixels = notification.metrics.pixels;
              final minExtent = notification.metrics.minScrollExtent;
              final maxExtent = notification.metrics.maxScrollExtent;

                          // Pull to refresh (ilk sayfa, yukarı scroll)
            if (_currentPage == 0 && currentPixels < minExtent) {
              final overscroll = (minExtent - currentPixels).abs();
              if (overscroll > 20 && overscroll < 25) {
                print('⬆️ Pull to refresh detected: ${overscroll.toStringAsFixed(1)}px');
              }
              
              setState(() {
                _overscrollAmount = overscroll;
                _showPullToRefresh = overscroll > 20;
                // Eşik aşıldığında flag set et (sadece bir kez)
                if (overscroll > 80 && !_canRefresh && !_isRefreshing) {
                  _canRefresh = true;
                  print('🟢 Ready to refresh when released! (overscroll: ${overscroll.toStringAsFixed(1)}px)');
                }
                _lastOverscroll = overscroll;
              });
            }
            // Infinite scroll - son sayfada aşağı scroll = direkt ilk sayfaya
            else if (_currentPage >= widget.movies.length - 1 &&
                currentPixels > maxExtent && !_isGoingToFirst) {
              final overscroll = (currentPixels - maxExtent).abs();
              
              // Küçük bir overscroll ile direkt infinite scroll tetikle
              if (overscroll > 10) {
                _isGoingToFirst = true;
                print('🔄 Infinite scroll triggered! Going to first page...');
                
                // Direkt infinite scroll animasyonu
                final wrapPageIndex = widget.movies.length;
                _pageController.animateToPage(
                  wrapPageIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                ).then((_) {
                  _isGoingToFirst = false;
                  print('✅ Infinite scroll completed');
                });
              }
                          } else {
                // Reset only visual indicators, preserve action flags for ScrollEnd
                if (_showPullToRefresh) {
                  setState(() {
                    _showPullToRefresh = false;
                    _overscrollAmount = 0.0;
                    _lastOverscroll = 0.0;
                  });
                }
              }
            }

                      if (notification is ScrollEndNotification) {
            // User stopped scrolling, check if release actions should be triggered
            print('📍 ScrollEnd: canRefresh=${_canRefresh}');
            
            // Cancel any previous timer
            _releaseTimer?.cancel();
            
                        // Use timer to ensure user truly released (prevent false triggers)
            _releaseTimer = Timer(const Duration(milliseconds: 10), () {
              if (_canRefresh && !_isRefreshing) {
                _isRefreshing = true;
                print('🔄 Refresh triggered on confirmed release!');
                
                                  setState(() {
                    _showPullToRefresh = false;
                    _overscrollAmount = 0.0;
                    _canRefresh = false;
                    _lastOverscroll = 0.0;
                  });
                
                                  Future.delayed(const Duration(milliseconds: 20), () {
                    if (widget.onRefresh != null) {
                      widget.onRefresh!();
                      print('✅ Refresh callback executed');
                    }
                    _isRefreshing = false;
                  });
              } 
                              else {
                  // Clean up if no action needed
                  setState(() {
                    _showPullToRefresh = false;
                    _overscrollAmount = 0.0;
                    _canRefresh = false;
                    _lastOverscroll = 0.0;
                  });
                }
            });
          }

            return false;
          },
          child: Stack(
            children: [
                            PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: widget.movies.length + 1, // +1 for infinite scroll wrap
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.antiAlias,
                onPageChanged: (index) {
                  // Handle wrap page - if we're at the wrap page, silently jump to first
                  if (index >= widget.movies.length) {
                    Future.delayed(const Duration(milliseconds: 50), () {
                      _pageController.jumpToPage(0);
                    });
                    return;
                  }
                  
                  setState(() {
                    _currentPage = index;
                    _isDescriptionExpanded = false;
                  });

                  // Load more when approaching end (not on wrap page)
                  if (index >= widget.movies.length - 2 &&
                      widget.onLoadMore != null) {
                    widget.onLoadMore!();
                  }

                  _preloadNearbyImages(index);
                },
                itemBuilder: (context, index) {
                  if (widget.movies.isEmpty) return const SizedBox.shrink();

                  // Handle wrap page - show first movie when at the end
                  final movieIndex = index >= widget.movies.length ? 0 : index;
                  final movie = widget.movies[movieIndex];
                  
                  return _buildMovieCard(movie, movieIndex);
                },
              ),
              // Pull to refresh indicator (top)
              if (_showPullToRefresh)
                Positioned(
                  top: 20.h + (_overscrollAmount * 0.3).clamp(0, 80),
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: (_overscrollAmount / 80).clamp(0.0, 1.0),
                    duration: const Duration(milliseconds: 100),
                    child: Transform.scale(
                      scale: (1.0 + (_overscrollAmount / 250)).clamp(0.8, 1.3),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle: (_overscrollAmount / 50) * 3.14159,
                              child: Icon(
                                Icons.refresh,
                                color: _overscrollAmount > 80
                                    ? Colors.green
                                    : Colors.white,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              _overscrollAmount > 80
                                  ? "Bırak ve yenile"
                                  : "Yenile",
                              style: TextStyle(
                                color: _overscrollAmount > 80
                                    ? Colors.green
                                    : Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppAssets.euclidFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


            ],
          ),
      ),
    );
  }

  Widget _buildMovieCard(MovieModel movie, int index) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Poster - bottom navigation'a göre pozisyonlanmış
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80.h,
            // Bottom navigation height
            child: RepaintBoundary(
              key: ValueKey('poster_$index'),
              child: CachedNetworkImage(
                imageUrl: movie.posterUrl.replaceFirst('http://', 'https://'),
                fit: BoxFit.cover,
                httpHeaders: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
                  'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
                  'Accept-Language': 'en-US,en;q=0.9',
                  'Referer': 'https://www.imdb.com/',
                },
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.inputBackground,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryRed,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.inputBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.movie_outlined,
                        color: AppColors.grayText,
                        size: 64.sp,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        movie.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppAssets.euclidFontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppStrings.posterLoadError,
                        style: TextStyle(
                          color: AppColors.grayText,
                          fontSize: 14.sp,
                          fontFamily: AppAssets.euclidFontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Movie info overlay with favorite button
          Positioned(
            bottom: 70.h, // Bottom navigation height
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                MovieInfoWidget(
                  movie: movie,
                  isDescriptionExpanded: _isDescriptionExpanded,
                  onDescriptionToggle: () {
                    setState(() {
                      _isDescriptionExpanded = !_isDescriptionExpanded;
                    });
                  },
                ),
                Positioned(
                  top: -19.h - 70.h,
                  right: 20.w,
                  child: ActionButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
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
