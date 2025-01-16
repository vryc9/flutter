// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_list_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieListResponse _$SerieListResponseFromJson(Map<String, dynamic> json) =>
    SerieListResponse(
      name: json['name'] as String,
      image: ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      count_of_episodes: (json['count_of_episodes'] as num?)?.toInt(),
      start_year: json['start_year'] as String?,
      publisher: json['publisher'] == null
          ? null
          : Person.fromJson(json['publisher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerieListResponseToJson(SerieListResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image.toJson(),
      'count_of_episodes': instance.count_of_episodes,
      'start_year': instance.start_year,
      'publisher': instance.publisher?.toJson(),
    };
