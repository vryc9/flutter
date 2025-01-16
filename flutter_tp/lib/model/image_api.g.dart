// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageAPI _$ImageAPIFromJson(Map<String, dynamic> json) => ImageAPI(
      json['icon_url'] as String,
      json['medium_url'] as String,
      json['screen_url'] as String,
      json['screen_large_url'] as String,
      json['image_tags'] as String,
      json['original_url'] as String,
      json['small_url'] as String,
      json['super_url'] as String,
      json['thumb_url'] as String,
      json['tiny_url'] as String,
    );

Map<String, dynamic> _$ImageAPIToJson(ImageAPI instance) => <String, dynamic>{
      'icon_url': instance.icon_url,
      'medium_url': instance.medium_url,
      'screen_url': instance.screen_url,
      'screen_large_url': instance.screen_large_url,
      'small_url': instance.small_url,
      'super_url': instance.super_url,
      'thumb_url': instance.thumb_url,
      'tiny_url': instance.tiny_url,
      'original_url': instance.original_url,
      'image_tags': instance.image_tags,
    };
