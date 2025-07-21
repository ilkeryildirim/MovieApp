import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../movie/data/models/movie_model.dart';
import '../../../movie/data/datasources/favorite_local_datasource.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final AuthRepository authRepository;
  final FavoriteLocalDataSource favoriteLocalDataSource;

  const ProfileRepositoryImpl({
    required this.authRepository,
    required this.favoriteLocalDataSource,
  });

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      AppLogger.info('Fetching profile data');

      // Get current user
      final userResult = await authRepository.getCurrentUser();
      
      return await userResult.fold(
        (failure) async {
          AppLogger.error('Failed to get user profile', error: failure);
          return Left(failure);
        },
        (user) async {
          try {
            final favoriteMovies = await favoriteLocalDataSource.getFavorites();
            
            final profile = Profile(
              user: user,
              favoriteMovies: favoriteMovies,
              isLoading: false,
            );

            AppLogger.info('Profile data fetched successfully with ${favoriteMovies.length} favorite movies');
            return Right(profile);
          } catch (e) {
            AppLogger.error('Error fetching favorite movies', error: e);
            final profile = Profile(
              user: user,
              favoriteMovies: <MovieModel>[],
              isLoading: false,
            );
            return Right(profile);
          }
        },
      );
    } catch (e) {
      AppLogger.error('Unexpected error fetching profile', error: e);
                return const Left(ServerFailure('Failed to fetch profile'));
    }
  }

  @override
  Future<Either<Failure, Profile>> refreshProfile() async {
    try {
      AppLogger.info('Refreshing profile data');

      // Refresh user data
      final userResult = await authRepository.getCurrentUser();
      
      return await userResult.fold(
        (failure) async {
          AppLogger.error('Failed to refresh user profile', error: failure);
          return Left(failure);
        },
        (user) async {

          try {
            final favoriteMovies = await favoriteLocalDataSource.getFavorites();
            
            final profile = Profile(
              user: user,
              favoriteMovies: favoriteMovies,
              isLoading: false,
            );

            AppLogger.info('Profile data refreshed successfully with ${favoriteMovies.length} favorite movies');
            return Right(profile);
          } catch (e) {
            AppLogger.error('Error fetching favorite movies during refresh', error: e);
            final profile = Profile(
              user: user,
              favoriteMovies: <MovieModel>[],
              isLoading: false,
            );
            return Right(profile);
          }
        },
      );
    } catch (e) {
      AppLogger.error('Unexpected error refreshing profile', error: e);
      return const Left(ServerFailure('Failed to refresh profile'));
    }
  }
} 