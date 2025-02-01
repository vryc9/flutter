// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseComics _$OFFServerResponseComicsFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseComics(
      (json['results'] as List<dynamic>)
          .map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseComicsToJson(
        OFFServerResponseComics instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

OFFServerResponseSeries _$OFFServerResponseSeriesFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSeries(
      (json['results'] as List<dynamic>)
          .map((e) => Serie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseSeriesToJson(
        OFFServerResponseSeries instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

OFFServerResponseEpisodes _$OFFServerResponseEpisodesFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseEpisodes(
      (json['results'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseEpisodesToJson(
        OFFServerResponseEpisodes instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

OFFServerResponseMovies _$OFFServerResponseMoviesFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseMovies(
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseMoviesToJson(
        OFFServerResponseMovies instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

OFFServerResponseCharacters _$OFFServerResponseCharactersFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseCharacters(
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseCharactersToJson(
        OFFServerResponseCharacters instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
    };

OFFServerResponseComic _$OFFServerResponseComicFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseComic(
      Comic.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseComicToJson(
        OFFServerResponseComic instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
    };

OFFServerResponseCharacter _$OFFServerResponseCharacterFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseCharacter(
      Character.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseCharacterToJson(
        OFFServerResponseCharacter instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
    };

OFFServerResponseSerie _$OFFServerResponseSerieFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSerie(
      Serie.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseSerieToJson(
        OFFServerResponseSerie instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
    };

OFFServerResponseMovie _$OFFServerResponseMovieFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseMovie(
      Movie.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseMovieToJson(
        OFFServerResponseMovie instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
    };

OFFServerResponsePerson _$OFFServerResponsePersonFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponsePerson(
      Person.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponsePersonToJson(
        OFFServerResponsePerson instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
    };
