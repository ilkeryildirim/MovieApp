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
} 