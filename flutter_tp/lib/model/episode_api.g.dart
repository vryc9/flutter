// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesResponse _$EpisodesResponseFromJson(Map<String, dynamic> json) =>
    EpisodesResponse(
      episode_number: (json['episode_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      air_date: json['air_date'] as String?,
    );

Map<String, dynamic> _$EpisodesResponseToJson(EpisodesResponse instance) =>
    <String, dynamic>{
      'episode_number': instance.episode_number,
      'name': instance.name,
      'air_date': instance.air_date,
    };

EpisodesResponseServer _$EpisodesResponseServerFromJson(
        Map<String, dynamic> json) =>
    EpisodesResponseServer(
      results: (json['results'] as List<dynamic>)
          .map((e) => EpisodesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'],
    );

Map<String, dynamic> _$EpisodesResponseServerToJson(
        EpisodesResponseServer instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };
