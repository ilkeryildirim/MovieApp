import '../../data/models/movie_model.dart';
import '../usecases/get_movies_usecase.dart';

abstract class MovieRepository {
  Future<MovieListResponse> getMovies({
    int page = 1,
    int limit = 5,
  });
  
  Future<FavoriteResponse> toggleFavorite(String favoriteId);
  
  Future<FavoritesListResponse> getFavorites();
  
  Future<List<MovieModel>> getFavoritesLocal();
  
  Future<void> syncFavoriteStatus(List<MovieModel> movies);
  
  Future<bool> isFavoriteLocal(String movieId);
} 