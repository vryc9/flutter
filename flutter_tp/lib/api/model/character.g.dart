// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseCharacter _$OFFServerResponseCharacterFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseCharacter(
      Character.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseCharacterToJson(
        OFFServerResponseCharacter instance) =>
    <String, dynamic>{
      'results': instance.results.toJson(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

OFFServerResponseSearchCharacter _$OFFServerResponseSearchCharacterFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSearchCharacter(
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
      (json['limit'] as num).toInt(),
      (json['number_of_page_results'] as num).toInt(),
      (json['number_of_total_results'] as num).toInt(),
      (json['offset'] as num).toInt(),
      (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$OFFServerResponseSearchCharacterToJson(
        OFFServerResponseSearchCharacter instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.number_of_page_results,
      'number_of_total_results': instance.number_of_total_results,
      'status_code': instance.status_code,
    };

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
          ?.map((e) => Issue.fromJson(e as Map<String, dynamic>))
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

Issue _$IssueFromJson(Map<String, dynamic> json) => Issue(
      json['api_detail_url'] as String,
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['site_detail_url'] as String,
    );

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'api_detail_url': instance.api_detail_url,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.site_detail_url,
    };

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
