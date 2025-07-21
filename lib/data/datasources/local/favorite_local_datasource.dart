import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exceptions.dart';
import '../../models/movie_model.dart';

abstract class FavoriteLocalDataSource {
  Future<List<MovieModel>> getFavorites();
  Future<void> saveFavorites(List<MovieModel> favorites);
  Future<void> addFavorite(MovieModel movie);
  Future<void> removeFavorite(String movieId);
  Future<bool> isFavorite(String movieId);
  Future<void> clearFavorites();
}

@Injectable(as: FavoriteLocalDataSource)
class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _favoritesKey = 'favorite_movies';
  
  const FavoriteLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  
  @override
  Future<List<MovieModel>> getFavorites() async {
    try {
      final favoritesJson = sharedPreferences.getStringList(_favoritesKey);
      if (favoritesJson == null) return [];
      
      return favoritesJson
          .map((json) => MovieModel.fromJson(jsonDecode(json) as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw const CacheException('Failed to get favorites');
    }
  }
  
  @override
  Future<void> saveFavorites(List<MovieModel> favorites) async {
    try {
      final favoritesJson = favorites
          .map((movie) => jsonEncode(movie.toJson()))
          .toList();
      
      final result = await sharedPreferences.setStringList(_favoritesKey, favoritesJson);
      if (!result) {
        throw const CacheException('Failed to save favorites');
      }
    } catch (e) {
      throw const CacheException('Failed to save favorites');
    }
  }
  
  @override
  Future<void> addFavorite(MovieModel movie) async {
    try {
      final favorites = await getFavorites();
      
      if (!favorites.any((fav) => fav.id == movie.id)) {
        final updatedMovie = movie.copyWith(isFavorite: true);
        favorites.add(updatedMovie);
        await saveFavorites(favorites);
      }
    } catch (e) {
      throw const CacheException('Failed to add favorite');
    }
  }
  
  @override
  Future<void> removeFavorite(String movieId) async {
    try {
      final favorites = await getFavorites();
      favorites.removeWhere((movie) => movie.id == movieId);
      await saveFavorites(favorites);
    } catch (e) {
      throw const CacheException('Failed to remove favorite');
    }
  }
  
  @override
  Future<bool> isFavorite(String movieId) async {
    try {
      final favorites = await getFavorites();
      return favorites.any((movie) => movie.id == movieId);
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<void> clearFavorites() async {
    try {
      await sharedPreferences.remove(_favoritesKey);
    } catch (e) {
      throw const CacheException('Failed to clear favorites');
    }
  }
} 