// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      cover_date: json['cover_date'] == null
          ? null
          : DateTime.parse(json['cover_date'] as String),
      description: json['description'] as String?,
      id: (json['id'] as num).toInt(),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      issue_number: json['issue_number'] as String?,
      name: json['name'] as String,
      character_credits: (json['character_credits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      person_credits: (json['person_credits'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      store_date: json['store_date'] == null
          ? null
          : DateTime.parse(json['store_date'] as String),
      volume: json['volume'] as String?,
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'character_credits': instance.character_credits,
      'cover_date': instance.cover_date?.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issue_number': instance.issue_number,
      'name': instance.name,
      'person_credits':
          instance.person_credits?.map((e) => e.toJson()).toList(),
      'store_date': instance.store_date?.toIso8601String(),
      'volume': instance.volume,
    };
