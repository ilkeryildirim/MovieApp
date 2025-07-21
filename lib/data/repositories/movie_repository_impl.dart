import 'package:injectable/injectable.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';
import '../datasources/local/favorite_local_datasource.dart';
import '../../domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieService _movieService;
  final FavoriteLocalDataSource _favoriteLocalDataSource;

  MovieRepositoryImpl(this._movieService, this._favoriteLocalDataSource);

  @override
  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _movieService.getMovies(page: page, limit: limit);
    
    final localFavorites = await _favoriteLocalDataSource.getFavorites();
    final favoriteIds = localFavorites.map((movie) => movie.id).toSet();
    
    final syncedMovies = response.movies.map((movie) {
      final isFavorite = favoriteIds.contains(movie.id);
      return movie.copyWith(isFavorite: isFavorite);
    }).toList();
    
    return MovieListResponse(
      movies: syncedMovies,
      totalPages: response.totalPages,
      currentPage: response.currentPage,
    );
  }

  @override
  Future<FavoriteResponse> toggleFavorite(String favoriteId) async {
    return await _movieService.toggleFavorite(favoriteId);
  }

  @override
  Future<FavoritesListResponse> getFavorites() async {
    final response = await _movieService.getFavorites();
    
    final favoritesWithCorrectStatus = response.movies.map((movie) {
      return movie.copyWith(isFavorite: true);
    }).toList();
    
    await _favoriteLocalDataSource.saveFavorites(favoritesWithCorrectStatus);
    
    return FavoritesListResponse(movies: favoritesWithCorrectStatus);
  }

  @override
  Future<List<MovieModel>> getFavoritesLocal() async {
    return await _favoriteLocalDataSource.getFavorites();
  }

  @override
  Future<void> syncFavoriteStatus(List<MovieModel> movies) async {
    // This method is no longer needed since we handle sync in getMovies
  }

  @override
  Future<bool> isFavoriteLocal(String movieId) async {
    return await _favoriteLocalDataSource.isFavorite(movieId);
  }
} 