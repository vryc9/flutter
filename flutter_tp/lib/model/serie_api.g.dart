// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Serie _$SerieFromJson(Map<String, dynamic> json) => Serie(
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      count_of_episodes: (json['count_of_episodes'] as num?)?.toInt(),
      start_year: json['start_year'] as String?,
      publisher: json['publisher'] == null
          ? null
          : Person.fromJson(json['publisher'] as Map<String, dynamic>),
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SerieToJson(Serie instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image?.toJson(),
      'count_of_episodes': instance.count_of_episodes,
      'start_year': instance.start_year,
      'publisher': instance.publisher?.toJson(),
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'description': instance.description,
    };
