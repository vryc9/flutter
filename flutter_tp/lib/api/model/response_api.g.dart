// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseComic _$OFFServerResponseComicFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseComic(
      Comic.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseComicToJson(
        OFFServerResponseComic instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

OFFServerResponseCharacter _$OFFServerResponseCharacterFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseCharacter(
      Character.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseCharacterToJson(
        OFFServerResponseCharacter instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

OFFServerResponseSearchCharacter _$OFFServerResponseSearchCharacterFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSearchCharacter(
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseSearchCharacterToJson(
        OFFServerResponseSearchCharacter instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

EpisodesResponseServer _$EpisodesResponseServerFromJson(
        Map<String, dynamic> json) =>
    EpisodesResponseServer(
      episodesListResponse: (json['episodesListResponse'] as List<dynamic>)
          .map(
              (e) => EpisodesResponseServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'],
    );

Map<String, dynamic> _$EpisodesResponseServerToJson(
        EpisodesResponseServer instance) =>
    <String, dynamic>{
      'episodesListResponse':
          instance.episodesListResponse.map((e) => e.toJson()).toList(),
      'error': instance.error,
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
