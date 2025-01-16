// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      coverDate: json['coverDate'] == null
          ? null
          : DateTime.parse(json['coverDate'] as String),
      description: json['description'] as String,
      id: json['id'] as String,
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      issueNumber: json['issueNumber'] as String?,
      name: json['name'] as String,
      characterCredits: (json['characterCredits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      personCredits: (json['personCredits'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeDate: json['storeDate'] == null
          ? null
          : DateTime.parse(json['storeDate'] as String),
      volume: json['volume'] as String?,
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'characterCredits': instance.characterCredits,
      'coverDate': instance.coverDate?.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issueNumber': instance.issueNumber,
      'name': instance.name,
      'personCredits': instance.personCredits?.map((e) => e.toJson()).toList(),
      'storeDate': instance.storeDate?.toIso8601String(),
      'volume': instance.volume,
    };
