import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required ApiResponseWrapper response,
    required AuthDataModel data,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@freezed
class ApiResponseWrapper with _$ApiResponseWrapper {
  const factory ApiResponseWrapper({
    required int code,
    String? message,
  }) = _ApiResponseWrapper;

  factory ApiResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseWrapperFromJson(json);
}

@freezed
class AuthDataModel with _$AuthDataModel {
  const factory AuthDataModel({
    @JsonKey(name: '_id') String? mongoId,
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    required String token,
  }) = _AuthDataModel;

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
} 