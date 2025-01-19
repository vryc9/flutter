// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      id: (json['id'] as num).toInt(),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image?.toJson(),
      'name': instance.name,
    };
