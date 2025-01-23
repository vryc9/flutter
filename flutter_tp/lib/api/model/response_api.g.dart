// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseComicList _$OFFServerResponseComicListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseComicList(
      (json['results'] as List<dynamic>)
          .map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseComicListToJson(
        OFFServerResponseComicList instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

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

MovieResponseServer _$MovieResponseServerFromJson(Map<String, dynamic> json) =>
    MovieResponseServer(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'],
    );

Map<String, dynamic> _$MovieResponseServerToJson(
        MovieResponseServer instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

SerieResponseServer _$SerieResponseServerFromJson(Map<String, dynamic> json) =>
    SerieResponseServer(
      results: json['results'] == null
          ? null
          : SerieResponse.fromJson(json['results'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$SerieResponseServerToJson(
        SerieResponseServer instance) =>
    <String, dynamic>{
      'results': instance.results?.toJson(),
      'error': instance.error,
    };
