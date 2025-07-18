import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/di/injection_container.dart';
import '../../blocs/movie/movie_bloc.dart';
import '../../widgets/movie_snap_scroll.dart';

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
              initial: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryRed,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryRed,
                ),
              ),
              loaded: (movies, currentPage, totalPages, hasNextPage, isLoadingMore) {
                return MovieSnapScroll(
                  movies: movies,
                  scrollController: _scrollController,
                  isLoadingMore: isLoadingMore,
                  onLoadMore: _loadMoreMovies,
                );
              },
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.sp,
                      color: AppColors.primaryRed,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Bir hata oluştu',
                      style: TextStyle(
                        color: AppColors.whiteText,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      message,
                      style: TextStyle(
                        color: AppColors.grayText,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MovieBloc>().add(const MovieEvent.loadMovies(limit: 5));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 