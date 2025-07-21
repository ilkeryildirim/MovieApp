import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/di/injection_container.dart';
import '../../blocs/movie/movie_bloc.dart';
import '../../widgets/movie/movie_snap_scroll.dart';
import '../../widgets/movie/movie_shimmer_loading.dart';
import '../../../core/widgets/error_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => getIt<MovieBloc>()..add(const MovieEvent.loadMovies(limit: 5)),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreMovies() {
    if (_isLoadingMore) return;
    
    final bloc = context.read<MovieBloc>();
    final currentState = bloc.state;
    
    if (currentState is Loaded && currentState.hasNextPage) {
      setState(() {
        _isLoadingMore = true;
      });
      bloc.add(const MovieEvent.loadMoreMovies(limit: 5));
    }
  }
  
  void _refreshMovies() {
    context.read<MovieBloc>().add(const MovieEvent.loadMovies(limit: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is Loaded) {
              setState(() {
                _isLoadingMore = false;
              });
            }
          },
          builder: (context, state) {
            return state.when(
                initial: () => const MovieShimmerLoading(),
                loading: () => const MovieShimmerLoading(),
                loaded: (movies, currentPage, totalPages, hasNextPage, isLoadingMore) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: 1.0,
                    curve: Curves.easeInOut,
                    child: MovieSnapScroll(
                      movies: movies,
                      scrollController: _scrollController,
                      isLoadingMore: isLoadingMore,
                      onLoadMore: _loadMoreMovies,
                      onRefresh: _refreshMovies,
                      onFavoritePressed: (movieId) {
                        context.read<MovieBloc>().add(MovieEvent.toggleFavorite(movieId: movieId));
                      },
                    ),
                  );
                },
                error: (message) => AppErrorWidget(
                  message: message,
                  onRetry: () {
                    context.read<MovieBloc>().add(const MovieEvent.loadMovies(limit: 5));
                  },
                ),
                );
          },
        ),
      ),
    );
  }
} 