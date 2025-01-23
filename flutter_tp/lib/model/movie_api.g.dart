// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      name: MovieResponse._stringFromJson(json['name']),
      api_detail_url: json['api_detail_url'] as String?,
      image: ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      id: MovieResponse._stringFromJson(json['id']),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'api_detail_url': instance.api_detail_url,
      'image': instance.image.toJson(),
      'id': instance.id,
    };
