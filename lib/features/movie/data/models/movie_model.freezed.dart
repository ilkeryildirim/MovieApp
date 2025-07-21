// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return _MovieModel.fromJson(json);
}

/// @nodoc
mixin _$MovieModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Plot')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Poster')
  String? get poster => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director')
  String? get director => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)
        $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)?
        $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieModel value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovieModel value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieModel value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MovieModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieModelCopyWith<MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieModelCopyWith<$Res> {
  factory $MovieModelCopyWith(
          MovieModel value, $Res Function(MovieModel) then) =
      _$MovieModelCopyWithImpl<$Res, MovieModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Plot') String description,
      @JsonKey(name: 'Poster') String? poster,
      @JsonKey(name: 'Director') String? director,
      bool isFavorite});
}

/// @nodoc
class _$MovieModelCopyWithImpl<$Res, $Val extends MovieModel>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? poster = freezed,
    Object? director = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieModelImplCopyWith<$Res>
    implements $MovieModelCopyWith<$Res> {
  factory _$$MovieModelImplCopyWith(
          _$MovieModelImpl value, $Res Function(_$MovieModelImpl) then) =
      __$$MovieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Plot') String description,
      @JsonKey(name: 'Poster') String? poster,
      @JsonKey(name: 'Director') String? director,
      bool isFavorite});
}

/// @nodoc
class __$$MovieModelImplCopyWithImpl<$Res>
    extends _$MovieModelCopyWithImpl<$Res, _$MovieModelImpl>
    implements _$$MovieModelImplCopyWith<$Res> {
  __$$MovieModelImplCopyWithImpl(
      _$MovieModelImpl _value, $Res Function(_$MovieModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? poster = freezed,
    Object? director = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_$MovieModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieModelImpl implements _MovieModel {
  const _$MovieModelImpl(
      {required this.id,
      @JsonKey(name: 'Title') required this.title,
      @JsonKey(name: 'Plot') required this.description,
      @JsonKey(name: 'Poster') this.poster,
      @JsonKey(name: 'Director') this.director,
      this.isFavorite = false});

  factory _$MovieModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'Title')
  final String title;
  @override
  @JsonKey(name: 'Plot')
  final String description;
  @override
  @JsonKey(name: 'Poster')
  final String? poster;
  @override
  @JsonKey(name: 'Director')
  final String? director;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, description: $description, poster: $poster, director: $director, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.director, director) ||
                other.director == director) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, poster, director, isFavorite);

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      __$$MovieModelImplCopyWithImpl<_$MovieModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)
        $default,
  ) {
    return $default(id, title, description, poster, director, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)?
        $default,
  ) {
    return $default?.call(id, title, description, poster, director, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'Title') String title,
            @JsonKey(name: 'Plot') String description,
            @JsonKey(name: 'Poster') String? poster,
            @JsonKey(name: 'Director') String? director,
            bool isFavorite)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, title, description, poster, director, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieModel value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovieModel value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieModel value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieModelImplToJson(
      this,
    );
  }
}

abstract class _MovieModel implements MovieModel {
  const factory _MovieModel(
      {required final String id,
      @JsonKey(name: 'Title') required final String title,
      @JsonKey(name: 'Plot') required final String description,
      @JsonKey(name: 'Poster') final String? poster,
      @JsonKey(name: 'Director') final String? director,
      final bool isFavorite}) = _$MovieModelImpl;

  factory _MovieModel.fromJson(Map<String, dynamic> json) =
      _$MovieModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'Title')
  String get title;
  @override
  @JsonKey(name: 'Plot')
  String get description;
  @override
  @JsonKey(name: 'Poster')
  String? get poster;
  @override
  @JsonKey(name: 'Director')
  String? get director;
  @override
  bool get isFavorite;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieListParams _$MovieListParamsFromJson(Map<String, dynamic> json) {
  return _MovieListParams.fromJson(json);
}

/// @nodoc
mixin _$MovieListParams {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieListParams value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovieListParams value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieListParams value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MovieListParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieListParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieListParamsCopyWith<MovieListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListParamsCopyWith<$Res> {
  factory $MovieListParamsCopyWith(
          MovieListParams value, $Res Function(MovieListParams) then) =
      _$MovieListParamsCopyWithImpl<$Res, MovieListParams>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$MovieListParamsCopyWithImpl<$Res, $Val extends MovieListParams>
    implements $MovieListParamsCopyWith<$Res> {
  _$MovieListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieListParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListParamsImplCopyWith<$Res>
    implements $MovieListParamsCopyWith<$Res> {
  factory _$$MovieListParamsImplCopyWith(_$MovieListParamsImpl value,
          $Res Function(_$MovieListParamsImpl) then) =
      __$$MovieListParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$MovieListParamsImplCopyWithImpl<$Res>
    extends _$MovieListParamsCopyWithImpl<$Res, _$MovieListParamsImpl>
    implements _$$MovieListParamsImplCopyWith<$Res> {
  __$$MovieListParamsImplCopyWithImpl(
      _$MovieListParamsImpl _value, $Res Function(_$MovieListParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieListParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$MovieListParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListParamsImpl implements _MovieListParams {
  const _$MovieListParamsImpl({this.page = 1, this.limit = 20});

  factory _$MovieListParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'MovieListParams(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  /// Create a copy of MovieListParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListParamsImplCopyWith<_$MovieListParamsImpl> get copyWith =>
      __$$MovieListParamsImplCopyWithImpl<_$MovieListParamsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit) $default,
  ) {
    return $default(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit)? $default,
  ) {
    return $default?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieListParams value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovieListParams value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieListParams value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListParamsImplToJson(
      this,
    );
  }
}

abstract class _MovieListParams implements MovieListParams {
  const factory _MovieListParams({final int page, final int limit}) =
      _$MovieListParamsImpl;

  factory _MovieListParams.fromJson(Map<String, dynamic> json) =
      _$MovieListParamsImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;

  /// Create a copy of MovieListParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieListParamsImplCopyWith<_$MovieListParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteResponse {
  MovieModel get movie => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MovieModel movie, String action) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MovieModel movie, String action)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MovieModel movie, String action)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FavoriteResponse value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FavoriteResponse value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FavoriteResponse value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) then) =
      _$FavoriteResponseCopyWithImpl<$Res, FavoriteResponse>;
  @useResult
  $Res call({MovieModel movie, String action});

  $MovieModelCopyWith<$Res> get movie;
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res, $Val extends FavoriteResponse>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieModel,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieModelCopyWith<$Res> get movie {
    return $MovieModelCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteResponseImplCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$$FavoriteResponseImplCopyWith(_$FavoriteResponseImpl value,
          $Res Function(_$FavoriteResponseImpl) then) =
      __$$FavoriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MovieModel movie, String action});

  @override
  $MovieModelCopyWith<$Res> get movie;
}

/// @nodoc
class __$$FavoriteResponseImplCopyWithImpl<$Res>
    extends _$FavoriteResponseCopyWithImpl<$Res, _$FavoriteResponseImpl>
    implements _$$FavoriteResponseImplCopyWith<$Res> {
  __$$FavoriteResponseImplCopyWithImpl(_$FavoriteResponseImpl _value,
      $Res Function(_$FavoriteResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? action = null,
  }) {
    return _then(_$FavoriteResponseImpl(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieModel,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteResponseImpl implements _FavoriteResponse {
  const _$FavoriteResponseImpl({required this.movie, required this.action});

  @override
  final MovieModel movie;
  @override
  final String action;

  @override
  String toString() {
    return 'FavoriteResponse(movie: $movie, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteResponseImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie, action);

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      __$$FavoriteResponseImplCopyWithImpl<_$FavoriteResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MovieModel movie, String action) $default,
  ) {
    return $default(movie, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MovieModel movie, String action)? $default,
  ) {
    return $default?.call(movie, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MovieModel movie, String action)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(movie, action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FavoriteResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FavoriteResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FavoriteResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _FavoriteResponse implements FavoriteResponse {
  const factory _FavoriteResponse(
      {required final MovieModel movie,
      required final String action}) = _$FavoriteResponseImpl;

  @override
  MovieModel get movie;
  @override
  String get action;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoritesListResponse {
  List<MovieModel> get movies => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MovieModel> movies) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MovieModel> movies)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MovieModel> movies)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FavoritesListResponse value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FavoritesListResponse value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FavoritesListResponse value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoritesListResponseCopyWith<FavoritesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesListResponseCopyWith<$Res> {
  factory $FavoritesListResponseCopyWith(FavoritesListResponse value,
          $Res Function(FavoritesListResponse) then) =
      _$FavoritesListResponseCopyWithImpl<$Res, FavoritesListResponse>;
  @useResult
  $Res call({List<MovieModel> movies});
}

/// @nodoc
class _$FavoritesListResponseCopyWithImpl<$Res,
        $Val extends FavoritesListResponse>
    implements $FavoritesListResponseCopyWith<$Res> {
  _$FavoritesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesListResponseImplCopyWith<$Res>
    implements $FavoritesListResponseCopyWith<$Res> {
  factory _$$FavoritesListResponseImplCopyWith(
          _$FavoritesListResponseImpl value,
          $Res Function(_$FavoritesListResponseImpl) then) =
      __$$FavoritesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieModel> movies});
}

/// @nodoc
class __$$FavoritesListResponseImplCopyWithImpl<$Res>
    extends _$FavoritesListResponseCopyWithImpl<$Res,
        _$FavoritesListResponseImpl>
    implements _$$FavoritesListResponseImplCopyWith<$Res> {
  __$$FavoritesListResponseImplCopyWithImpl(_$FavoritesListResponseImpl _value,
      $Res Function(_$FavoritesListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_$FavoritesListResponseImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
    ));
  }
}

/// @nodoc

class _$FavoritesListResponseImpl implements _FavoritesListResponse {
  const _$FavoritesListResponseImpl({required final List<MovieModel> movies})
      : _movies = movies;

  final List<MovieModel> _movies;
  @override
  List<MovieModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  String toString() {
    return 'FavoritesListResponse(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesListResponseImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movies));

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesListResponseImplCopyWith<_$FavoritesListResponseImpl>
      get copyWith => __$$FavoritesListResponseImplCopyWithImpl<
          _$FavoritesListResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MovieModel> movies) $default,
  ) {
    return $default(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MovieModel> movies)? $default,
  ) {
    return $default?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MovieModel> movies)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FavoritesListResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FavoritesListResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FavoritesListResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _FavoritesListResponse implements FavoritesListResponse {
  const factory _FavoritesListResponse(
      {required final List<MovieModel> movies}) = _$FavoritesListResponseImpl;

  @override
  List<MovieModel> get movies;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoritesListResponseImplCopyWith<_$FavoritesListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
