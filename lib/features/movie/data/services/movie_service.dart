import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movie_model.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/utils/logger.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieApi {
  @factoryMethod
  factory MovieApi(Dio dio) = _MovieApi;

  @GET(ApiConstants.movieListEndpoint)
  Future<dynamic> getMoviesRaw({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @POST('${ApiConstants.movieFavoriteEndpoint}/{movieId}')
  Future<FavoriteResponse> toggleFavorite(@Path('movieId') String movieId);

  @GET(ApiConstants.movieFavoritesEndpoint)
  Future<FavoritesListResponse> getFavorites();
}

@lazySingleton
class MovieService {
  final MovieApi _movieApi;

  MovieService(Dio dio) : _movieApi = MovieApi(dio);

  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      AppLogger.info('Fetching movies - Page: $page, Limit: $limit');
      
      final responseData = await _movieApi.getMoviesRaw(page: page, limit: limit);
      final data = responseData['data'] ?? responseData;
      final pagination = data['pagination'] as Map<String, dynamic>;
      
      final movieListResponse = MovieListResponse(
        movies: (data['movies'] as List<dynamic>)
            .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
            .toList(),
        totalPages: pagination['maxPage'] as int,
        currentPage: pagination['currentPage'] as int,
      );
      
      AppLogger.info('Movies fetched successfully - Page: $page, Total movies: ${movieListResponse.movies.length}');
      return movieListResponse;
    } catch (e) {
      AppLogger.error('Error fetching movies', error: e);
      rethrow;
    }
  }

  Future<FavoriteResponse> toggleFavorite(String movieId) async {
    return await _movieApi.toggleFavorite(movieId);
  }

  Future<FavoritesListResponse> getFavorites() async {
    return await _movieApi.getFavorites();
  }
} 