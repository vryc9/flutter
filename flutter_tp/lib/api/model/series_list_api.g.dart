// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieListResponse _$SerieListResponseFromJson(Map<String, dynamic> json) =>
    SerieListResponse(
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      countOfEpisodes: (json['countOfEpisodes'] as num?)?.toInt(),
      startYear: (json['startYear'] as num?)?.toInt(),
      publisher: json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerieListResponseToJson(SerieListResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image?.toJson(),
      'countOfEpisodes': instance.countOfEpisodes,
      'startYear': instance.startYear,
      'publisher': instance.publisher?.toJson(),
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      iconUrl: json['iconUrl'] as String?,
      mediumUrl: json['mediumUrl'] as String?,
      screenUrl: json['screenUrl'] as String?,
      screenLargeUrl: json['screenLargeUrl'] as String?,
      smallUrl: json['smallUrl'] as String?,
      superUrl: json['superUrl'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      tinyUrl: json['tinyUrl'] as String?,
      originalUrl: json['originalUrl'] as String?,
      imageTags: json['imageTags'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'iconUrl': instance.iconUrl,
      'mediumUrl': instance.mediumUrl,
      'screenUrl': instance.screenUrl,
      'screenLargeUrl': instance.screenLargeUrl,
      'smallUrl': instance.smallUrl,
      'superUrl': instance.superUrl,
      'thumbUrl': instance.thumbUrl,
      'tinyUrl': instance.tinyUrl,
      'originalUrl': instance.originalUrl,
      'imageTags': instance.imageTags,
    };

Publisher _$PublisherFromJson(Map<String, dynamic> json) => Publisher(
      apiDetailUrl: json['apiDetailUrl'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PublisherToJson(Publisher instance) => <String, dynamic>{
      'apiDetailUrl': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
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
