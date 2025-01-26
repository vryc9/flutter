// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      description: json['description'] as String?,
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      issue_number: json['issue_number'] as String?,
      name: json['name'] as String?,
      cover_date: Comic._stringFromJson(json['cover_date']),
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
      character_credits: (json['character_credits'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      person_credits: (json['person_credits'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'character_credits':
          instance.character_credits?.map((e) => e?.toJson()).toList(),
      'description': instance.description,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issue_number': instance.issue_number,
      'name': instance.name,
      'person_credits':
          instance.person_credits?.map((e) => e?.toJson()).toList(),
      'cover_date': instance.cover_date,
      'volume': instance.volume?.toJson(),
    };
