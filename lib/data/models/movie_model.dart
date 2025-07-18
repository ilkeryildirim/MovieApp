import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required String id,
    @JsonKey(name: 'Title') required String title,
    @JsonKey(name: 'Plot') required String description,
    @JsonKey(name: 'Poster') required String posterUrl,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}

@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    required List<MovieModel> movies,
    required int totalPages,
    required int currentPage,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    final pagination = json['pagination'] as Map<String, dynamic>;
    return MovieListResponse(
      movies: (json['movies'] as List<dynamic>)
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList(),
      totalPages: pagination['maxPage'] as int,
      currentPage: pagination['currentPage'] as int,
    );
  }
}

@freezed
class MovieListParams with _$MovieListParams {
  const factory MovieListParams({
    @Default(1) int page,
    @Default(20) int limit,
  }) = _MovieListParams;

  factory MovieListParams.fromJson(Map<String, dynamic> json) => _$MovieListParamsFromJson(json);
} 