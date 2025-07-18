import 'package:injectable/injectable.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';
import '../../domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImpl(this._movieService);

  @override
  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 20,
  }) async {
    return await _movieService.getMovies(page: page, limit: limit);
  }
} 