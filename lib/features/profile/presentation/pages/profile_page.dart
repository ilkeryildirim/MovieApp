import 'package:flutter/material.dart';
import 'package:flutter_base_app/core/constants/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../constants/profile_constants.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../blocs/profile/profile_bloc.dart';
import '../../../movie/presentation/blocs/favorite/favorite_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_user_section.dart';
import '../widgets/profile_movies_grid.dart';
import '../widgets/limited_offer_bottom_sheet.dart';
import '../../../movie/presentation/widgets/pull_to_refresh_indicator.dart';
import '../../../../core/router/app_router.dart';


class ProfilePage extends StatefulWidget {
  final VoidCallback? onBackPressed;
  
  const ProfilePage({super.key, this.onBackPressed});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showPullToRefresh = false;
  double _overscrollAmount = 0.0;
  bool _isRefreshing = false;
  GlobalKey _photoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => getIt<FavoriteBloc>()..add(const FavoriteEvent.loadFavorites()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              unauthenticated: () => context.go(AppRoutes.login),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (profile) => _buildProfileContent(context, profile.user),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryRed,
                  ),
                ),
                error: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.errorOccurred,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () => context.read<ProfileBloc>().add(
                          const ProfileEvent.loadProfile(),
                        ),
                        child: Text(AppStrings.retry),
                      ),
                    ],
                  ),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryRed,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, user) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              final metrics = notification.metrics;
              if (metrics.pixels < 0) {
                final overscroll = metrics.pixels.abs();
                if (overscroll > ProfileConstants.pullToRefreshMinOffset && !_isRefreshing) {
                  setState(() {
                    _overscrollAmount = overscroll;
                    _showPullToRefresh = true;
                  });
                }
              } else if (_showPullToRefresh && !_isRefreshing) {
                setState(() {
                  _showPullToRefresh = false;
                  _overscrollAmount = 0.0;
                });
              }
            } else if (notification is ScrollEndNotification) {
              if (_overscrollAmount > ProfileConstants.pullToRefreshTriggerOffset && !_isRefreshing) {
                _triggerRefresh();
              }
            }
            return false;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                ProfileHeader(
                  onBackPressed: widget.onBackPressed,
                  onLimitedOfferPressed: () => LimitedOfferBottomSheet.show(context),
                ),
                ProfileUserSection(
                  userName: user.name,
                  userId: user.id,
                  photoUrl: user.avatarUrl,
                  photoKey: _photoKey,
                  onPhotoUpload: () async {
                    final photoUrl = await context.push<String>(AppRoutes.photoUpload);
                    if (photoUrl != null && mounted) {
                      setState(() {
                        _photoKey = GlobalKey();
                      });
                      
                      context.read<AuthBloc>().add(
                        AuthEvent.updateProfilePhoto(photoUrl),
                      );
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfilePhoto(photoUrl),
                      );
                    }
                  },
                ),
                SizedBox(height: ProfileConstants.moviesSectionTopPadding.h),
                _buildMoviesSection(context),
              ],
            ),
          ),
        ),
        if (_showPullToRefresh)
          PullToRefreshIndicator(
            overscrollAmount: _overscrollAmount,
          ),
      ],
    );
  }

  Widget _buildMoviesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ProfileConstants.horizontalPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.favoriteMovies,
            style: TextStyle(
              fontFamily: AppAssets.euclidFontFamily,
              color: Colors.white,
              fontSize: ProfileConstants.moviesTitleFontSize.sp,
              fontWeight: ProfileConstants.moviesTitleFontWeight,
            ),
          ),
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => ProfileMoviesGrid(isLoading: true),
                loaded: (favorites, isSynced) => ProfileMoviesGrid(
                  favoriteMovies: favorites,
                  isLoading: _isRefreshing,
                ),
                orElse: () => ProfileMoviesGrid(isLoading: true),
              );
            },
          ),
          SizedBox(height: ProfileConstants.bottomNavPadding.h),
        ],
      ),
    );
  }

  void _triggerRefresh() async {
    if (_isRefreshing) return;
    
    setState(() {
      _isRefreshing = true;
      _showPullToRefresh = false;
      _overscrollAmount = 0.0;
    });

    // Refresh both profile and favorite movies
    context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
    context.read<FavoriteBloc>().add(const FavoriteEvent.refreshFavorites());

    await Future.delayed(const Duration(milliseconds: ProfileConstants.refreshMinDuration));

    if (mounted) {
      setState(() {
        _isRefreshing = false;
      });
    }
  }
} 