// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      response:
          ApiResponseWrapper.fromJson(json['response'] as Map<String, dynamic>),
      data: AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'response': instance.response.toJson(),
      'data': instance.data.toJson(),
    };

_$ApiResponseWrapperImpl _$$ApiResponseWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseWrapperImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ApiResponseWrapperImplToJson(
        _$ApiResponseWrapperImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      if (instance.message case final value?) 'message': value,
    };

_$AuthDataModelImpl _$$AuthDataModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthDataModelImpl(
      mongoId: json['_id'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photo_url'] as String?,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AuthDataModelImplToJson(_$AuthDataModelImpl instance) =>
    <String, dynamic>{
      if (instance.mongoId case final value?) '_id': value,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      if (instance.photoUrl case final value?) 'photo_url': value,
      'token': instance.token,
    };
