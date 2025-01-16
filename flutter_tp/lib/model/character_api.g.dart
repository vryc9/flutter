// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      aliases: json['aliases'] as String?,
      apiDetailUrl: json['apiDetailUrl'] as String?,
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      issuesDiedIn: (json['issuesDiedIn'] as List<dynamic>?)
          ?.map((e) => SmallIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      publisher: json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
      realName: json['realName'] as String?,
      siteDetailUrl: json['siteDetailUrl'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'apiDetailUrl': instance.apiDetailUrl,
      'birth': instance.birth?.toIso8601String(),
      'creators': instance.creators?.map((e) => e.toJson()).toList(),
      'deck': instance.deck,
      'description': instance.description,
      'gender': instance.gender,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issuesDiedIn': instance.issuesDiedIn?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'publisher': instance.publisher?.toJson(),
      'realName': instance.realName,
      'siteDetailUrl': instance.siteDetailUrl,
    };
