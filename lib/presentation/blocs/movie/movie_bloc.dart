import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/repositories/movie_repository.dart';
import '../../../data/datasources/local/favorite_local_datasource.dart';
import '../../../core/utils/logger.dart';
import '../../../core/di/injection_container.dart';
import '../favorite/favorite_bloc.dart';

part 'movie_bloc.freezed.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.loadMovies({@Default(20) int limit}) = _LoadMovies;
  const factory MovieEvent.loadMoreMovies({@Default(20) int limit}) = _LoadMoreMovies;
  const factory MovieEvent.refreshMovies({@Default(20) int limit}) = _RefreshMovies;
  const factory MovieEvent.toggleFavorite({required String movieId}) = _ToggleFavorite;
}

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
  const factory MovieState.loading() = _Loading;
  const factory MovieState.loaded({
    required List<MovieModel> movies,
    required int currentPage,
    required int totalPages,
    required bool hasNextPage,
    required bool isLoadingMore,
  }) = Loaded;
  const factory MovieState.error(String message) = _Error;
}

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;
  final FavoriteLocalDataSource _favoriteLocalDataSource;
  
  MovieBloc(this._movieRepository, this._favoriteLocalDataSource) : super(const MovieState.initial()) {
    on<_LoadMovies>(_onLoadMovies);
    on<_LoadMoreMovies>(_onLoadMoreMovies);
    on<_RefreshMovies>(_onRefreshMovies);
    on<_ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadMovies(_LoadMovies event, Emitter<MovieState> emit) async {
    try {
      emit(const MovieState.loading());
      
      final response = await _movieRepository.getMovies(
        page: 1,
        limit: event.limit,
      );
      
      emit(MovieState.loaded(
        movies: response.movies,
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        hasNextPage: response.currentPage < response.totalPages,
        isLoadingMore: false,
      ));
    } catch (e) {
      AppLogger.error('Error loading movies', error: e);
      emit(MovieState.error(e.toString()));
    }
  }

  Future<void> _onLoadMoreMovies(_LoadMoreMovies event, Emitter<MovieState> emit) async {
    final currentState = state;
    if (currentState is! Loaded) return;
    
    if (!currentState.hasNextPage || currentState.isLoadingMore) return;
    
    try {
      emit(currentState.copyWith(isLoadingMore: true));
      
      final nextPage = currentState.currentPage + 1;
      final response = await _movieRepository.getMovies(
        page: nextPage,
        limit: event.limit,
      );
      
      final allMovies = [...currentState.movies, ...response.movies];
      
      emit(MovieState.loaded(
        movies: allMovies,
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        hasNextPage: response.currentPage < response.totalPages,
        isLoadingMore: false,
      ));
    } catch (e) {
      AppLogger.error('Error loading more movies', error: e);
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> _onRefreshMovies(_RefreshMovies event, Emitter<MovieState> emit) async {
    try {
      final response = await _movieRepository.getMovies(
        page: 1,
        limit: event.limit,
      );
      
      emit(MovieState.loaded(
        movies: response.movies,
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        hasNextPage: response.currentPage < response.totalPages,
        isLoadingMore: false,
      ));
    } catch (e) {
      AppLogger.error('Error refreshing movies', error: e);
      emit(MovieState.error(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(_ToggleFavorite event, Emitter<MovieState> emit) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final movieToToggle = currentState.movies.firstWhere((movie) => movie.id == event.movieId);
    final newFavoriteStatus = !movieToToggle.isFavorite;
    
    final optimisticUpdatedMovies = currentState.movies.map((movie) {
      if (movie.id == event.movieId) {
        return movie.copyWith(isFavorite: newFavoriteStatus);
      }
      return movie;
    }).toList();

    emit(currentState.copyWith(movies: optimisticUpdatedMovies));

    try {
      if (newFavoriteStatus) {
        await _favoriteLocalDataSource.addFavorite(movieToToggle.copyWith(isFavorite: true));
      } else {
        await _favoriteLocalDataSource.removeFavorite(event.movieId);
      }

      getIt<FavoriteBloc>().add(FavoriteEvent.movieFavoriteChanged(
        movieId: event.movieId,
        isFavorite: newFavoriteStatus,
        movie: movieToToggle.copyWith(isFavorite: newFavoriteStatus),
      ));

      final favoriteResponse = await _movieRepository.toggleFavorite(event.movieId);
      
      final isFavoriteFromAction = favoriteResponse.action == 'favorited';
      
      final finalUpdatedMovies = currentState.movies.map((movie) {
        if (movie.id == event.movieId) {
          return favoriteResponse.movie.copyWith(isFavorite: isFavoriteFromAction);
        }
        return movie;
      }).toList();

      emit(currentState.copyWith(movies: finalUpdatedMovies));
      
      if (isFavoriteFromAction != newFavoriteStatus) {
        if (isFavoriteFromAction) {
          await _favoriteLocalDataSource.addFavorite(favoriteResponse.movie.copyWith(isFavorite: true));
        } else {
          await _favoriteLocalDataSource.removeFavorite(event.movieId);
        }
        
        getIt<FavoriteBloc>().add(FavoriteEvent.movieFavoriteChanged(
          movieId: event.movieId,
          isFavorite: isFavoriteFromAction,
          movie: favoriteResponse.movie.copyWith(isFavorite: isFavoriteFromAction),
        ));
      }
      
      AppLogger.info('Favorite toggle completed successfully for movie: ${event.movieId}, action: ${favoriteResponse.action}');
    } catch (e) {
      AppLogger.error('Error toggling favorite', error: e);
      
      final revertedMovies = currentState.movies.map((movie) {
        if (movie.id == event.movieId) {
          return movie.copyWith(isFavorite: !newFavoriteStatus);
        }
        return movie;
      }).toList();
      emit(currentState.copyWith(movies: revertedMovies));

      try {
        if (!newFavoriteStatus) {
          await _favoriteLocalDataSource.addFavorite(movieToToggle);
        } else {
          await _favoriteLocalDataSource.removeFavorite(event.movieId);
        }
        
        getIt<FavoriteBloc>().add(FavoriteEvent.movieFavoriteChanged(
          movieId: event.movieId,
          isFavorite: !newFavoriteStatus,
          movie: movieToToggle,
        ));
      } catch (localError) {
        AppLogger.error('Error reverting local favorite state', error: localError);
      }
    }
  }
} 