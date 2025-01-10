import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: true)
class OFFServerResponseCharacter {
  final Character results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code;

  OFFServerResponseCharacter(this.results, this.error, this.limit, this.number_of_page_results, this.number_of_total_results, this.offset, this.status_code);

  factory OFFServerResponseCharacter.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseCharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OFFServerResponseSearchCharacter {
  final List<Character> results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code;

  OFFServerResponseSearchCharacter(this.results, this.error, this.limit, this.number_of_page_results, this.number_of_total_results, this.offset, this.status_code);

  factory OFFServerResponseSearchCharacter.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSearchCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSearchCharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Character {
  final String? aliases; // Alias du personnage (séparés par \n)
  final String? apiDetailUrl; // URL vers les détails du personnage
  final DateTime? birth; // Date de naissance (si disponible, sinon null)
  final List<Creator>? creators; // Liste des créateurs du personnage
  final String? deck; // Résumé bref du personnage
  final String? description; // Description complète du personnage
  final int? gender; // Sexe (Male, Female, Other)
  final int id; // ID unique du personnage
  final Image? image; // Image principale du personnage
  final List<Issue>? issuesDiedIn; // Liste des numéros où le personnage meurt
  final String? name; // Nom du personnage
  final Publisher? publisher; // Éditeur principal du personnage
  final String? realName; // Nom réel du personnage
  final String? siteDetailUrl; // URL vers les détails sur Giant Bomb

  Character({
    this.aliases,
    this.apiDetailUrl,
    this.birth,
    this.creators,
    this.deck,
    this.description,
    this.gender,
    required this.id,
    this.image,
    this.issuesDiedIn,
    this.name,
    this.publisher,
    this.realName,
    this.siteDetailUrl
  });

  //Méthode pour la sérialisation JSON
  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Creator {
  final String api_detail_url;
  final int id;
  final String name;
  final String site_detail_url;

  Creator(this.api_detail_url, this.id, this.name, this.site_detail_url);

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Image {
  final String icon_url;
  final String medium_url;
  final String screen_url;
  final String screen_large_url;
  final String small_url;
  final String super_url;
  final String thumb_url;
  final String tiny_url;
  final String original_url;
  final String image_tags;

  Image(this.icon_url, this.medium_url, this.screen_url, this.screen_large_url, this.image_tags, this.original_url, this.small_url, this.super_url, this.thumb_url, this.tiny_url);

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Issue {
  final String api_detail_url;
  final int id;
  final String name;
  final String site_detail_url;

  Issue(this.api_detail_url, this.id, this.name, this.site_detail_url);

  factory Issue.fromJson(Map<String, dynamic> json) =>
      _$IssueFromJson(json);

  Map<String, dynamic> toJson() => _$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Publisher {
  final String api_detail_url;
  final int id;
  final String name;

  Publisher(this.api_detail_url, this.id, this.name);

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherToJson(this);
}
