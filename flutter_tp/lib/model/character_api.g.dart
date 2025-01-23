// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      aliases: json['aliases'] as String?,
      birth: json['birth'] as String?,
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      issues_died_in: (json['issues_died_in'] as List<dynamic>?)
          ?.map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      publisher: json['publisher'] == null
          ? null
          : Person.fromJson(json['publisher'] as Map<String, dynamic>),
      real_name: json['real_name'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'birth': instance.birth,
      'creators': instance.creators?.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'gender': instance.gender,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issues_died_in':
          instance.issues_died_in?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'publisher': instance.publisher?.toJson(),
      'real_name': instance.real_name,
    };
