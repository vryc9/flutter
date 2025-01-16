// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publisher _$PublisherFromJson(Map<String, dynamic> json) => Publisher(
      json['api_detail_url'] as String,
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$PublisherToJson(Publisher instance) => <String, dynamic>{
      'api_detail_url': instance.api_detail_url,
      'id': instance.id,
      'name': instance.name,
    };
