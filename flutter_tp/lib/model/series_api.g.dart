// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieResponse _$SerieResponseFromJson(Map<String, dynamic> json) =>
    SerieResponse(
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      count_of_episodes: (json['count_of_episodes'] as num?)?.toInt(),
      publisher: json['publisher'] == null
          ? null
          : Person.fromJson(json['publisher'] as Map<String, dynamic>),
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      deck: json['deck'] as String?,
    );

Map<String, dynamic> _$SerieResponseToJson(SerieResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image?.toJson(),
      'count_of_episodes': instance.count_of_episodes,
      'publisher': instance.publisher?.toJson(),
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'deck': instance.deck,
    };
