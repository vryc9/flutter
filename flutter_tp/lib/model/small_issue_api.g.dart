// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_issue_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
