part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.loadFavorites() = _LoadFavorites;
  const factory FavoriteEvent.refreshFavorites() = _RefreshFavorites;
  const factory FavoriteEvent.movieFavoriteChanged({
    required String movieId,
    required bool isFavorite,
    required MovieModel movie,
  }) = _MovieFavoriteChanged;
} 