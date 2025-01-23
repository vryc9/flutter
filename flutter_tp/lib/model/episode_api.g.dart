// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      episode_number: (json['episode_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      air_date: json['air_date'] as String?,
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'episode_number': instance.episode_number,
      'name': instance.name,
      'air_date': instance.air_date,
      'image': instance.image?.toJson(),
    };
