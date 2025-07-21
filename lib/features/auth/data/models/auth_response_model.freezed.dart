// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  ApiResponseWrapper get response => throw _privateConstructorUsedError;
  AuthDataModel get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ApiResponseWrapper response, AuthDataModel data) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ApiResponseWrapper response, AuthDataModel data)?
        $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ApiResponseWrapper response, AuthDataModel data)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthResponseModel value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthResponseModel value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthResponseModel value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call({ApiResponseWrapper response, AuthDataModel data});

  $ApiResponseWrapperCopyWith<$Res> get response;
  $AuthDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponseWrapper,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthDataModel,
    ) as $Val);
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiResponseWrapperCopyWith<$Res> get response {
    return $ApiResponseWrapperCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthDataModelCopyWith<$Res> get data {
    return $AuthDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseModelImplCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$AuthResponseModelImplCopyWith(_$AuthResponseModelImpl value,
          $Res Function(_$AuthResponseModelImpl) then) =
      __$$AuthResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponseWrapper response, AuthDataModel data});

  @override
  $ApiResponseWrapperCopyWith<$Res> get response;
  @override
  $AuthDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$AuthResponseModelImplCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$AuthResponseModelImpl>
    implements _$$AuthResponseModelImplCopyWith<$Res> {
  __$$AuthResponseModelImplCopyWithImpl(_$AuthResponseModelImpl _value,
      $Res Function(_$AuthResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? data = null,
  }) {
    return _then(_$AuthResponseModelImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponseWrapper,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseModelImpl implements _AuthResponseModel {
  const _$AuthResponseModelImpl({required this.response, required this.data});

  factory _$AuthResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseModelImplFromJson(json);

  @override
  final ApiResponseWrapper response;
  @override
  final AuthDataModel data;

  @override
  String toString() {
    return 'AuthResponseModel(response: $response, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseModelImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response, data);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      __$$AuthResponseModelImplCopyWithImpl<_$AuthResponseModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ApiResponseWrapper response, AuthDataModel data) $default,
  ) {
    return $default(response, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ApiResponseWrapper response, AuthDataModel data)?
        $default,
  ) {
    return $default?.call(response, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ApiResponseWrapper response, AuthDataModel data)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(response, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthResponseModel value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthResponseModel value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final ApiResponseWrapper response,
      required final AuthDataModel data}) = _$AuthResponseModelImpl;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$AuthResponseModelImpl.fromJson;

  @override
  ApiResponseWrapper get response;
  @override
  AuthDataModel get data;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiResponseWrapper _$ApiResponseWrapperFromJson(Map<String, dynamic> json) {
  return _ApiResponseWrapper.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseWrapper {
  int get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int code, String? message) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int code, String? message)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int code, String? message)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiResponseWrapper value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiResponseWrapper value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiResponseWrapper value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ApiResponseWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseWrapperCopyWith<ApiResponseWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseWrapperCopyWith<$Res> {
  factory $ApiResponseWrapperCopyWith(
          ApiResponseWrapper value, $Res Function(ApiResponseWrapper) then) =
      _$ApiResponseWrapperCopyWithImpl<$Res, ApiResponseWrapper>;
  @useResult
  $Res call({int code, String? message});
}

/// @nodoc
class _$ApiResponseWrapperCopyWithImpl<$Res, $Val extends ApiResponseWrapper>
    implements $ApiResponseWrapperCopyWith<$Res> {
  _$ApiResponseWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseWrapperImplCopyWith<$Res>
    implements $ApiResponseWrapperCopyWith<$Res> {
  factory _$$ApiResponseWrapperImplCopyWith(_$ApiResponseWrapperImpl value,
          $Res Function(_$ApiResponseWrapperImpl) then) =
      __$$ApiResponseWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String? message});
}

/// @nodoc
class __$$ApiResponseWrapperImplCopyWithImpl<$Res>
    extends _$ApiResponseWrapperCopyWithImpl<$Res, _$ApiResponseWrapperImpl>
    implements _$$ApiResponseWrapperImplCopyWith<$Res> {
  __$$ApiResponseWrapperImplCopyWithImpl(_$ApiResponseWrapperImpl _value,
      $Res Function(_$ApiResponseWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$ApiResponseWrapperImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseWrapperImpl implements _ApiResponseWrapper {
  const _$ApiResponseWrapperImpl({required this.code, this.message});

  factory _$ApiResponseWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseWrapperImplFromJson(json);

  @override
  final int code;
  @override
  final String? message;

  @override
  String toString() {
    return 'ApiResponseWrapper(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseWrapperImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of ApiResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseWrapperImplCopyWith<_$ApiResponseWrapperImpl> get copyWith =>
      __$$ApiResponseWrapperImplCopyWithImpl<_$ApiResponseWrapperImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int code, String? message) $default,
  ) {
    return $default(code, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int code, String? message)? $default,
  ) {
    return $default?.call(code, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int code, String? message)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(code, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiResponseWrapper value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiResponseWrapper value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiResponseWrapper value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseWrapperImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseWrapper implements ApiResponseWrapper {
  const factory _ApiResponseWrapper(
      {required final int code,
      final String? message}) = _$ApiResponseWrapperImpl;

  factory _ApiResponseWrapper.fromJson(Map<String, dynamic> json) =
      _$ApiResponseWrapperImpl.fromJson;

  @override
  int get code;
  @override
  String? get message;

  /// Create a copy of ApiResponseWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseWrapperImplCopyWith<_$ApiResponseWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) {
  return _AuthDataModel.fromJson(json);
}

/// @nodoc
mixin _$AuthDataModel {
  @JsonKey(name: '_id')
  String? get mongoId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)
        $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)?
        $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)?
        $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthDataModel value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthDataModel value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthDataModel value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AuthDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthDataModelCopyWith<AuthDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDataModelCopyWith<$Res> {
  factory $AuthDataModelCopyWith(
          AuthDataModel value, $Res Function(AuthDataModel) then) =
      _$AuthDataModelCopyWithImpl<$Res, AuthDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? mongoId,
      String id,
      String name,
      String email,
      String? photoUrl,
      String token});
}

/// @nodoc
class _$AuthDataModelCopyWithImpl<$Res, $Val extends AuthDataModel>
    implements $AuthDataModelCopyWith<$Res> {
  _$AuthDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mongoId = freezed,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photoUrl = freezed,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      mongoId: freezed == mongoId
          ? _value.mongoId
          : mongoId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthDataModelImplCopyWith<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  factory _$$AuthDataModelImplCopyWith(
          _$AuthDataModelImpl value, $Res Function(_$AuthDataModelImpl) then) =
      __$$AuthDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? mongoId,
      String id,
      String name,
      String email,
      String? photoUrl,
      String token});
}

/// @nodoc
class __$$AuthDataModelImplCopyWithImpl<$Res>
    extends _$AuthDataModelCopyWithImpl<$Res, _$AuthDataModelImpl>
    implements _$$AuthDataModelImplCopyWith<$Res> {
  __$$AuthDataModelImplCopyWithImpl(
      _$AuthDataModelImpl _value, $Res Function(_$AuthDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mongoId = freezed,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photoUrl = freezed,
    Object? token = null,
  }) {
    return _then(_$AuthDataModelImpl(
      mongoId: freezed == mongoId
          ? _value.mongoId
          : mongoId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthDataModelImpl implements _AuthDataModel {
  const _$AuthDataModelImpl(
      {@JsonKey(name: '_id') this.mongoId,
      required this.id,
      required this.name,
      required this.email,
      this.photoUrl,
      required this.token});

  factory _$AuthDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthDataModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? mongoId;
  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? photoUrl;
  @override
  final String token;

  @override
  String toString() {
    return 'AuthDataModel(mongoId: $mongoId, id: $id, name: $name, email: $email, photoUrl: $photoUrl, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDataModelImpl &&
            (identical(other.mongoId, mongoId) || other.mongoId == mongoId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mongoId, id, name, email, photoUrl, token);

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDataModelImplCopyWith<_$AuthDataModelImpl> get copyWith =>
      __$$AuthDataModelImplCopyWithImpl<_$AuthDataModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)
        $default,
  ) {
    return $default(mongoId, id, name, email, photoUrl, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)?
        $default,
  ) {
    return $default?.call(mongoId, id, name, email, photoUrl, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: '_id') String? mongoId, String id,
            String name, String email, String? photoUrl, String token)?
        $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(mongoId, id, name, email, photoUrl, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthDataModel value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthDataModel value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthDataModel value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthDataModelImplToJson(
      this,
    );
  }
}

abstract class _AuthDataModel implements AuthDataModel {
  const factory _AuthDataModel(
      {@JsonKey(name: '_id') final String? mongoId,
      required final String id,
      required final String name,
      required final String email,
      final String? photoUrl,
      required final String token}) = _$AuthDataModelImpl;

  factory _AuthDataModel.fromJson(Map<String, dynamic> json) =
      _$AuthDataModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get mongoId;
  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get photoUrl;
  @override
  String get token;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthDataModelImplCopyWith<_$AuthDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
