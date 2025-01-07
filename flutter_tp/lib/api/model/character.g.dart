// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      aliases: json['aliases'] as String?,
      apiDetailUrl: json['apiDetailUrl'] as String?,
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      characterEnemies: (json['characterEnemies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      characterFriends: (json['characterFriends'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countOfIssueAppearances:
          (json['countOfIssueAppearances'] as num?)?.toInt(),
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dateAdded: json['dateAdded'] == null
          ? null
          : DateTime.parse(json['dateAdded'] as String),
      dateLastUpdated: json['dateLastUpdated'] == null
          ? null
          : DateTime.parse(json['dateLastUpdated'] as String),
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      firstAppearedInIssue: json['firstAppearedInIssue'] as String?,
      gender: json['gender'] as String?,
      id: json['id'] as String,
      image: json['image'] as String?,
      issueCredits: (json['issueCredits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      issuesDiedIn: (json['issuesDiedIn'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      movies:
          (json['movies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      origin: json['origin'] as String?,
      powers:
          (json['powers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      realName: json['realName'] as String?,
      siteDetailUrl: json['siteDetailUrl'] as String?,
      storyArcCredits: (json['storyArcCredits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      teamEnemies: (json['teamEnemies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      teamFriends: (json['teamFriends'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      teams:
          (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
      volumeCredits: (json['volumeCredits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'apiDetailUrl': instance.apiDetailUrl,
      'birth': instance.birth?.toIso8601String(),
      'characterEnemies': instance.characterEnemies,
      'characterFriends': instance.characterFriends,
      'countOfIssueAppearances': instance.countOfIssueAppearances,
      'creators': instance.creators,
      'dateAdded': instance.dateAdded?.toIso8601String(),
      'dateLastUpdated': instance.dateLastUpdated?.toIso8601String(),
      'deck': instance.deck,
      'description': instance.description,
      'firstAppearedInIssue': instance.firstAppearedInIssue,
      'gender': instance.gender,
      'id': instance.id,
      'image': instance.image,
      'issueCredits': instance.issueCredits,
      'issuesDiedIn': instance.issuesDiedIn,
      'movies': instance.movies,
      'name': instance.name,
      'origin': instance.origin,
      'powers': instance.powers,
      'publisher': instance.publisher,
      'realName': instance.realName,
      'siteDetailUrl': instance.siteDetailUrl,
      'storyArcCredits': instance.storyArcCredits,
      'teamEnemies': instance.teamEnemies,
      'teamFriends': instance.teamFriends,
      'teams': instance.teams,
      'volumeCredits': instance.volumeCredits,
    };
