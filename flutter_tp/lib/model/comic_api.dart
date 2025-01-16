import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Comic {
  final List<String>? characterCredits; // Liste des personnages présents
  final DateTime? coverDate; // Date de publication sur la couverture
  final String? description; // Description détaillée
  final int id; // ID unique de l'issue
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