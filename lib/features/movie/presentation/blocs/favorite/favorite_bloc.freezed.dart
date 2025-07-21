// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavorites,
    required TResult Function() refreshFavorites,
    required TResult Function(String movieId, bool isFavorite, MovieModel movie)
        movieFavoriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavorites,
    TResult? Function()? refreshFavorites,
    TResult? Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavorites,
    TResult Function()? refreshFavorites,
    TResult Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFavorites value) loadFavorites,
    required TResult Function(_RefreshFavorites value) refreshFavorites,
    required TResult Function(_MovieFavoriteChanged value) movieFavoriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFavorites value)? loadFavorites,
    TResult? Function(_RefreshFavorites value)? refreshFavorites,
    TResult? Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFavorites value)? loadFavorites,
    TResult Function(_RefreshFavorites value)? refreshFavorites,
    TResult Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
          FavoriteEvent value, $Res Function(FavoriteEvent) then) =
      _$FavoriteEventCopyWithImpl<$Res, FavoriteEvent>;
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res, $Val extends FavoriteEvent>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadFavoritesImplCopyWith<$Res> {
  factory _$$LoadFavoritesImplCopyWith(
          _$LoadFavoritesImpl value, $Res Function(_$LoadFavoritesImpl) then) =
      __$$LoadFavoritesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFavoritesImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$LoadFavoritesImpl>
    implements _$$LoadFavoritesImplCopyWith<$Res> {
  __$$LoadFavoritesImplCopyWithImpl(
      _$LoadFavoritesImpl _value, $Res Function(_$LoadFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadFavoritesImpl implements _LoadFavorites {
  const _$LoadFavoritesImpl();

  @override
  String toString() {
    return 'FavoriteEvent.loadFavorites()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFavoritesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavorites,
    required TResult Function() refreshFavorites,
    required TResult Function(String movieId, bool isFavorite, MovieModel movie)
        movieFavoriteChanged,
  }) {
    return loadFavorites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavorites,
    TResult? Function()? refreshFavorites,
    TResult? Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
  }) {
    return loadFavorites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavorites,
    TResult Function()? refreshFavorites,
    TResult Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (loadFavorites != null) {
      return loadFavorites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFavorites value) loadFavorites,
    required TResult Function(_RefreshFavorites value) refreshFavorites,
    required TResult Function(_MovieFavoriteChanged value) movieFavoriteChanged,
  }) {
    return loadFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFavorites value)? loadFavorites,
    TResult? Function(_RefreshFavorites value)? refreshFavorites,
    TResult? Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
  }) {
    return loadFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFavorites value)? loadFavorites,
    TResult Function(_RefreshFavorites value)? refreshFavorites,
    TResult Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (loadFavorites != null) {
      return loadFavorites(this);
    }
    return orElse();
  }
}

abstract class _LoadFavorites implements FavoriteEvent {
  const factory _LoadFavorites() = _$LoadFavoritesImpl;
}

/// @nodoc
abstract class _$$RefreshFavoritesImplCopyWith<$Res> {
  factory _$$RefreshFavoritesImplCopyWith(_$RefreshFavoritesImpl value,
          $Res Function(_$RefreshFavoritesImpl) then) =
      __$$RefreshFavoritesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshFavoritesImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$RefreshFavoritesImpl>
    implements _$$RefreshFavoritesImplCopyWith<$Res> {
  __$$RefreshFavoritesImplCopyWithImpl(_$RefreshFavoritesImpl _value,
      $Res Function(_$RefreshFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshFavoritesImpl implements _RefreshFavorites {
  const _$RefreshFavoritesImpl();

  @override
  String toString() {
    return 'FavoriteEvent.refreshFavorites()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshFavoritesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavorites,
    required TResult Function() refreshFavorites,
    required TResult Function(String movieId, bool isFavorite, MovieModel movie)
        movieFavoriteChanged,
  }) {
    return refreshFavorites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavorites,
    TResult? Function()? refreshFavorites,
    TResult? Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
  }) {
    return refreshFavorites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavorites,
    TResult Function()? refreshFavorites,
    TResult Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (refreshFavorites != null) {
      return refreshFavorites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFavorites value) loadFavorites,
    required TResult Function(_RefreshFavorites value) refreshFavorites,
    required TResult Function(_MovieFavoriteChanged value) movieFavoriteChanged,
  }) {
    return refreshFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFavorites value)? loadFavorites,
    TResult? Function(_RefreshFavorites value)? refreshFavorites,
    TResult? Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
  }) {
    return refreshFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFavorites value)? loadFavorites,
    TResult Function(_RefreshFavorites value)? refreshFavorites,
    TResult Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (refreshFavorites != null) {
      return refreshFavorites(this);
    }
    return orElse();
  }
}

abstract class _RefreshFavorites implements FavoriteEvent {
  const factory _RefreshFavorites() = _$RefreshFavoritesImpl;
}

/// @nodoc
abstract class _$$MovieFavoriteChangedImplCopyWith<$Res> {
  factory _$$MovieFavoriteChangedImplCopyWith(_$MovieFavoriteChangedImpl value,
          $Res Function(_$MovieFavoriteChangedImpl) then) =
      __$$MovieFavoriteChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String movieId, bool isFavorite, MovieModel movie});

  $MovieModelCopyWith<$Res> get movie;
}

/// @nodoc
class __$$MovieFavoriteChangedImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$MovieFavoriteChangedImpl>
    implements _$$MovieFavoriteChangedImplCopyWith<$Res> {
  __$$MovieFavoriteChangedImplCopyWithImpl(_$MovieFavoriteChangedImpl _value,
      $Res Function(_$MovieFavoriteChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? isFavorite = null,
    Object? movie = null,
  }) {
    return _then(_$MovieFavoriteChangedImpl(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieModel,
    ));
  }

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieModelCopyWith<$Res> get movie {
    return $MovieModelCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value));
    });
  }
}

/// @nodoc

class _$MovieFavoriteChangedImpl implements _MovieFavoriteChanged {
  const _$MovieFavoriteChangedImpl(
      {required this.movieId, required this.isFavorite, required this.movie});

  @override
  final String movieId;
  @override
  final bool isFavorite;
  @override
  final MovieModel movie;

  @override
  String toString() {
    return 'FavoriteEvent.movieFavoriteChanged(movieId: $movieId, isFavorite: $isFavorite, movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieFavoriteChangedImpl &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId, isFavorite, movie);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieFavoriteChangedImplCopyWith<_$MovieFavoriteChangedImpl>
      get copyWith =>
          __$$MovieFavoriteChangedImplCopyWithImpl<_$MovieFavoriteChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFavorites,
    required TResult Function() refreshFavorites,
    required TResult Function(String movieId, bool isFavorite, MovieModel movie)
        movieFavoriteChanged,
  }) {
    return movieFavoriteChanged(movieId, isFavorite, movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFavorites,
    TResult? Function()? refreshFavorites,
    TResult? Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
  }) {
    return movieFavoriteChanged?.call(movieId, isFavorite, movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFavorites,
    TResult Function()? refreshFavorites,
    TResult Function(String movieId, bool isFavorite, MovieModel movie)?
        movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (movieFavoriteChanged != null) {
      return movieFavoriteChanged(movieId, isFavorite, movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFavorites value) loadFavorites,
    required TResult Function(_RefreshFavorites value) refreshFavorites,
    required TResult Function(_MovieFavoriteChanged value) movieFavoriteChanged,
  }) {
    return movieFavoriteChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFavorites value)? loadFavorites,
    TResult? Function(_RefreshFavorites value)? refreshFavorites,
    TResult? Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
  }) {
    return movieFavoriteChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFavorites value)? loadFavorites,
    TResult Function(_RefreshFavorites value)? refreshFavorites,
    TResult Function(_MovieFavoriteChanged value)? movieFavoriteChanged,
    required TResult orElse(),
  }) {
    if (movieFavoriteChanged != null) {
      return movieFavoriteChanged(this);
    }
    return orElse();
  }
}

abstract class _MovieFavoriteChanged implements FavoriteEvent {
  const factory _MovieFavoriteChanged(
      {required final String movieId,
      required final bool isFavorite,
      required final MovieModel movie}) = _$MovieFavoriteChangedImpl;

  String get movieId;
  bool get isFavorite;
  MovieModel get movie;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieFavoriteChangedImplCopyWith<_$MovieFavoriteChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MovieModel> movies, bool isSynced) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MovieModel> movies, bool isSynced) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavoriteState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MovieModel> movies, bool isSynced) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FavoriteState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MovieModel> movies, bool isSynced});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? isSynced = null,
  }) {
    return _then(_$LoadedImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<MovieModel> movies, this.isSynced = false})
      : _movies = movies;

  final List<MovieModel> _movies;
  @override
  List<MovieModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'FavoriteState.loaded(movies: $movies, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), isSynced);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MovieModel> movies, bool isSynced) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(movies, isSynced);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(movies, isSynced);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(movies, isSynced);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FavoriteState {
  const factory _Loaded(
      {required final List<MovieModel> movies,
      final bool isSynced}) = _$LoadedImpl;

  List<MovieModel> get movies;
  bool get isSynced;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MovieModel> movies, bool isSynced) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MovieModel> movies, bool isSynced)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FavoriteState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
