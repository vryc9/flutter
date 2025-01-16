// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      json['api_detail_url'] as String,
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['site_detail_url'] as String,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'api_detail_url': instance.api_detail_url,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.site_detail_url,
    };
