// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list_api.dart';

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
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerieListResponseToJson(SerieListResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image.toJson(),
      'count_of_episodes': instance.count_of_episodes,
      'start_year': instance.start_year,
      'publisher': instance.publisher?.toJson(),
    };

SerieListResponseServer _$SerieListResponseServerFromJson(
        Map<String, dynamic> json) =>
    SerieListResponseServer(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SerieListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'],
    );

Map<String, dynamic> _$SerieListResponseServerToJson(
        SerieListResponseServer instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };
