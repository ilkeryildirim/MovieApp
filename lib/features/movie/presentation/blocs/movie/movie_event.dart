part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.loadMovies({@Default(20) int limit}) = _LoadMovies;
  const factory MovieEvent.loadMoreMovies({@Default(20) int limit}) = _LoadMoreMovies;
  const factory MovieEvent.refreshMovies({@Default(20) int limit}) = _RefreshMovies;
  const factory MovieEvent.toggleFavorite({required String movieId}) = _ToggleFavorite;
} 