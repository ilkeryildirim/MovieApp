import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/repositories/movie_repository.dart';
import '../../../data/datasources/local/favorite_local_datasource.dart';
import '../../../core/utils/logger.dart';

part 'favorite_bloc.freezed.dart';

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

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.loaded({
    required List<MovieModel> movies,
    @Default(false) bool isSynced,
  }) = _Loaded;
  const factory FavoriteState.error(String message) = _Error;
}

@lazySingleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final MovieRepository _movieRepository;
  final FavoriteLocalDataSource _favoriteLocalDataSource;
  bool _hasServerSynced = false;
  
  FavoriteBloc(this._movieRepository, this._favoriteLocalDataSource) : super(const FavoriteState.initial()) {
    on<_LoadFavorites>(_onLoadFavorites);
    on<_RefreshFavorites>(_onRefreshFavorites);
    on<_MovieFavoriteChanged>(_onMovieFavoriteChanged);
  }

  Future<void> _onLoadFavorites(_LoadFavorites event, Emitter<FavoriteState> emit) async {
    try {
      emit(const FavoriteState.loading());
      
      final localFavorites = await _favoriteLocalDataSource.getFavorites();
      emit(FavoriteState.loaded(movies: localFavorites, isSynced: false));
      
      if (!_hasServerSynced) {
        try {
          final response = await _movieRepository.getFavorites();
          await _favoriteLocalDataSource.saveFavorites(response.movies);
          _hasServerSynced = true;
          
          emit(FavoriteState.loaded(movies: response.movies, isSynced: true));
          AppLogger.info('Favorites synced with server successfully');
        } catch (e) {
          AppLogger.warning('Failed to sync favorites with server, using offline data');
        }
      }
    } catch (e) {
      AppLogger.error('Error loading favorites', error: e);
      emit(FavoriteState.error(e.toString()));
    }
  }

  Future<void> _onRefreshFavorites(_RefreshFavorites event, Emitter<FavoriteState> emit) async {
    try {
      final response = await _movieRepository.getFavorites();
      await _favoriteLocalDataSource.saveFavorites(response.movies);
      _hasServerSynced = true;
      
      emit(FavoriteState.loaded(movies: response.movies, isSynced: true));
    } catch (e) {
      AppLogger.error('Error refreshing favorites', error: e);
      final localFavorites = await _favoriteLocalDataSource.getFavorites();
      emit(FavoriteState.loaded(movies: localFavorites, isSynced: false));
    }
  }

  void _onMovieFavoriteChanged(_MovieFavoriteChanged event, Emitter<FavoriteState> emit) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    try {
      List<MovieModel> updatedMovies;
      
      if (event.isFavorite) {
        await _favoriteLocalDataSource.addFavorite(event.movie);
        
        if (!currentState.movies.any((movie) => movie.id == event.movieId)) {
          updatedMovies = [event.movie, ...currentState.movies];
        } else {
          updatedMovies = currentState.movies.map((movie) {
            return movie.id == event.movieId ? event.movie : movie;
          }).toList();
        }
      } else {
        await _favoriteLocalDataSource.removeFavorite(event.movieId);
        updatedMovies = currentState.movies.where((movie) => movie.id != event.movieId).toList();
      }

      emit(currentState.copyWith(movies: updatedMovies));
      AppLogger.info('Favorite status updated locally for movie: ${event.movieId}');
    } catch (e) {
      AppLogger.error('Error updating favorite locally', error: e);
    }
  }
} 