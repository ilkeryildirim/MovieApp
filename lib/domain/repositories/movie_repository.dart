import '../../data/models/movie_model.dart';

abstract class MovieRepository {
  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 20,
  });
} 