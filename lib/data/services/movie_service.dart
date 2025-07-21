import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/movie_model.dart';
import '../../core/constants/api_constants.dart';
import '../../core/utils/logger.dart';

@lazySingleton
class MovieService {
  final Dio _dio;

  MovieService(this._dio);

  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      AppLogger.info('Fetching movies - Page: $page, Limit: $limit');
      
      final response = await _dio.get(
        ApiConstants.movieList,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        final movieListResponse = MovieListResponse.fromJson(data);
        
        AppLogger.info('Movies fetched successfully - Page: $page, Total movies: ${movieListResponse.movies.length}');
        return movieListResponse;
      } else {
        throw Exception('Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.error('Error fetching movies', error: e);
      rethrow;
    }
  }

  Future<FavoriteResponse> toggleFavorite(String favoriteId) async {
    try {
      AppLogger.info('Toggling favorite for movie: $favoriteId');
      
      final response = await _dio.post('${ApiConstants.movieFavorite}/$favoriteId');

      if (response.statusCode == 200) {
        final favoriteResponse = FavoriteResponse.fromJson(response.data);
        AppLogger.info('Favorite toggled successfully for movie: $favoriteId');
        return favoriteResponse;
      } else {
        throw Exception('Failed to toggle favorite: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.error('Error toggling favorite', error: e);
      rethrow;
    }
  }

  Future<FavoritesListResponse> getFavorites() async {
    try {
      AppLogger.info('Fetching favorite movies');
      
      final response = await _dio.get(ApiConstants.movieFavorites);

      if (response.statusCode == 200) {
        final favoritesResponse = FavoritesListResponse.fromJson(response.data);
        AppLogger.info('Favorites fetched successfully - Count: ${favoritesResponse.movies.length}');
        return favoritesResponse;
      } else {
        throw Exception('Failed to fetch favorites: ${response.statusCode}');
      }
    } catch (e) {
      AppLogger.error('Error fetching favorites', error: e);
      rethrow;
    }
  }
} 