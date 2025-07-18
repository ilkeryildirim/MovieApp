import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/repositories/movie_repository.dart';
import '../../../core/utils/logger.dart';

part 'movie_bloc.freezed.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.loadMovies({@Default(20) int limit}) = _LoadMovies;
  const factory MovieEvent.loadMoreMovies({@Default(20) int limit}) = _LoadMoreMovies;
  const factory MovieEvent.refreshMovies({@Default(20) int limit}) = _RefreshMovies;
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
  
  MovieBloc(this._movieRepository) : super(const MovieState.initial()) {
    on<_LoadMovies>(_onLoadMovies);
    on<_LoadMoreMovies>(_onLoadMoreMovies);
    on<_RefreshMovies>(_onRefreshMovies);
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
} 