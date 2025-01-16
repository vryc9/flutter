import 'package:flutter_tp/api/model/character_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_api.g.dart';

@JsonSerializable(explicitToJson: true)
class OFFServerResponseComic {
  final Comic results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code;// Volume auquel appartient l'issue

  OFFServerResponseComic(this.results, this.error, this.limit, this.number_of_page_results, this.number_of_total_results, this.offset, this.status_code);


  factory OFFServerResponseComic.fromJson(Map<String, dynamic> json) =>
        _$OFFServerResponseComicFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseComicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Comic {
  final List<String>? characterCredits; // Liste des personnages présents
  final DateTime? coverDate; // Date de publication sur la couverture
  final String description; // Description détaillée
  final String id; // ID unique de l'issue
  final ImageAPI? image; // Image principale de l'issue
  final String? issueNumber; // Numéro de l'issue
  final String name; // Nom de l'issue
  final List<Person>? personCredits; // Personnes ayant travaillé sur l'issue
  final DateTime? storeDate; // Date de sortie en magasin
  final String? volume; // Volume auquel appartient l'issue

  Comic({
    this.coverDate,
    required this.description,
    required this.id,
    this.image,
    this.issueNumber,
    required this.name,
    this.characterCredits,
    this.personCredits,
    this.storeDate,
    this.volume,
  });

  // Généré automatiquement par json_serializable
  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$ComicToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Person {
  final String id; // ID unique de l'issue
  final ImageAPI? image; // Image principale de l'issue
  final String name; // Nom de l'issue

  Person({
    required this.id,
    this.image,
    required this.name,
  });

  // Généré automatiquement par json_serializable
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$PersonFromJson(this);
}