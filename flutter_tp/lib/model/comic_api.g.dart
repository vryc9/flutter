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
      store_date: json['store_date'] as String?,
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'image': instance.image?.toJson(),
      'issue_number': instance.issue_number,
      'name': instance.name,
      'store_date': instance.store_date,
      'volume': instance.volume?.toJson(),
    };
