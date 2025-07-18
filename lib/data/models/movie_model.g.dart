// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieModelImpl _$$MovieModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieModelImpl(
      id: json['id'] as String,
      title: json['Title'] as String,
      description: json['Plot'] as String,
      posterUrl: json['Poster'] as String,
    );

Map<String, dynamic> _$$MovieModelImplToJson(_$MovieModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Plot': instance.description,
      'Poster': instance.posterUrl,
    };

_$MovieListParamsImpl _$$MovieListParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieListParamsImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$MovieListParamsImplToJson(
        _$MovieListParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
