import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Comic {
  final List<String>? character_credits; // Liste des personnages présents
  final DateTime? cover_date; // Date de publication sur la couverture
  final String? description; // Description détaillée
  final int id; // ID unique de l'issue
  final ImageAPI? image; // Image principale de l'issue
  final String? issue_number; // Numéro de l'issue
  final String name; // Nom de l'issue
  final List<Person>? person_credits; // Personnes ayant travaillé sur l'issue
  final DateTime? store_date; // Date de sortie en magasin
  final String? volume; // Volume auquel appartient l'issue

  Comic({
    this.cover_date,
    required this.description,
    required this.id,
    this.image,
    this.issue_number,
    required this.name,
    this.character_credits,
    this.person_credits,
    this.store_date,
    this.volume,
  });

  // Généré automatiquement par json_serializable
  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$ComicToJson(this);
}