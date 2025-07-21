import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/movie_model.dart';
import 'movie_page_view.dart';
import 'pull_to_refresh_indicator.dart';
import 'movie_card.dart';

class MovieSnapScroll extends StatefulWidget {
  final List<MovieModel> movies;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final VoidCallback? onRefresh;
  final Function(String movieId)? onFavoritePressed;

  const MovieSnapScroll({
    super.key,
    required this.movies,
    required this.scrollController,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.onRefresh,
    this.onFavoritePressed,
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
  bool _canRefresh = false;
  Timer? _releaseTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadNearbyImages(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _releaseTimer?.cancel();
    super.dispose();
  }

  void _preloadNearbyImages(int currentIndex) {
    final context = this.context;
    final indices = [
      currentIndex - 1,
      currentIndex,
      currentIndex + 1,
      currentIndex + 2,
    ];

    for (final index in indices) {
      if (index >= 0 && index < widget.movies.length) {
        final movie = widget.movies[index];
        if (movie.poster != null) {
          final posterUrl = movie.poster!.startsWith('http://') == true
              ? movie.poster!.replaceFirst('http://', 'https://')
              : movie.poster!;

          precacheImage(
            CachedNetworkImageProvider(
              posterUrl,
              headers: const {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
                'Accept-Language': 'en-US,en;q=0.9',
                'Cache-Control': 'no-cache',
                'Pragma': 'no-cache',
              },
            ),
            context,
          );
        }
      }
    }
  }

  void _handlePageChanged(int index) {
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

    if (index >= widget.movies.length - 2 && widget.onLoadMore != null) {
      widget.onLoadMore!();
    }

    _preloadNearbyImages(index);
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final currentPixels = notification.metrics.pixels;
      final minExtent = notification.metrics.minScrollExtent;
      final maxExtent = notification.metrics.maxScrollExtent;

      if (_currentPage == 0 && currentPixels < minExtent) {
        _handlePullToRefresh(minExtent - currentPixels);
      } else if (_currentPage >= widget.movies.length - 1 &&
          currentPixels > maxExtent &&
          !_isGoingToFirst) {
        _handleInfiniteScroll(currentPixels - maxExtent);
      } else {
        _resetIndicators();
      }
    }

    if (notification is ScrollEndNotification) {
      _handleScrollEnd();
    }
  }

  void _handlePullToRefresh(double overscroll) {
    setState(() {
      _overscrollAmount = overscroll;
      _showPullToRefresh = overscroll > 20;
      if (overscroll > 80 && !_canRefresh && !_isRefreshing) {
        _canRefresh = true;
      }

    });
  }

  void _handleInfiniteScroll(double overscroll) {
    if (overscroll > 10) {
      _isGoingToFirst = true;
      final wrapPageIndex = widget.movies.length;
      _pageController
          .animateToPage(
        wrapPageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      )
          .then((_) {
        _isGoingToFirst = false;
      });
    }
  }

  void _resetIndicators() {
    if (_showPullToRefresh) {
      setState(() {
        _showPullToRefresh = false;
        _overscrollAmount = 0.0;
      });
    }
  }

  void _handleScrollEnd() {
    _releaseTimer?.cancel();
    _releaseTimer = Timer(const Duration(milliseconds: 10), () {
      if (_canRefresh && !_isRefreshing) {
        _isRefreshing = true;
        setState(() {
          _showPullToRefresh = false;
          _overscrollAmount = 0.0;
          _canRefresh = false;
        });

        Future.delayed(const Duration(milliseconds: 20), () {
          widget.onRefresh?.call();
          _isRefreshing = false;
        });
      } else {
        setState(() {
          _showPullToRefresh = false;
          _overscrollAmount = 0.0;
          _canRefresh = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScrollNotification(notification);
          return false;
        },
        child: Stack(
          children: [
            MoviePageView(
              controller: _pageController,
              movies: widget.movies,
              onPageChanged: _handlePageChanged,
              itemBuilder: (context, index) {
                if (widget.movies.isEmpty) return const SizedBox.shrink();

                final movieIndex = index >= widget.movies.length ? 0 : index;
                final movie = widget.movies[movieIndex];

                return MovieCard(
                  movie: movie,
                  index: movieIndex,
                  isDescriptionExpanded: _isDescriptionExpanded,
                  onToggleDescription: () {
                    setState(() {
                      _isDescriptionExpanded = !_isDescriptionExpanded;
                    });
                  },
                  onFavoritePressed: widget.onFavoritePressed != null
                      ? () => widget.onFavoritePressed!(movie.id)
                      : null,
                );
              },
            ),
            if (_showPullToRefresh)
              PullToRefreshIndicator(
                overscrollAmount: _overscrollAmount,
              ),
          ],
        ),
      ),
    );
  }
}
