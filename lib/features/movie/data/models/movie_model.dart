import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required String id,
    @JsonKey(name: 'Title') required String title,
    @JsonKey(name: 'Plot') required String description,
    @JsonKey(name: 'Poster') String? poster,
    @JsonKey(name: 'Director') String? director,
    @Default(false) bool isFavorite,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}



@freezed
class MovieListParams with _$MovieListParams {
  const factory MovieListParams({
    @Default(1) int page,
    @Default(20) int limit,
  }) = _MovieListParams;

  factory MovieListParams.fromJson(Map<String, dynamic> json) => _$MovieListParamsFromJson(json);
}

@freezed
class FavoriteResponse with _$FavoriteResponse {
  const factory FavoriteResponse({
    required MovieModel movie,
    required String action,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return FavoriteResponse(
      movie: MovieModel.fromJson(data['movie'] as Map<String, dynamic>),
      action: data['action'] as String,
    );
  }
}

@freezed
class FavoritesListResponse with _$FavoritesListResponse {
  const factory FavoritesListResponse({
    required List<MovieModel> movies,
  }) = _FavoritesListResponse;

  factory FavoritesListResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return FavoritesListResponse(
      movies: (data as List<dynamic>)
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList(),
    );
  }
} 