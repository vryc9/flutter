import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  final String? aliases; // Alias du personnage (séparés par \n)
  final String? api_detail_url; // URL vers les détails du personnage
  final DateTime? birth; // Date de naissance (si disponible, sinon null)
  final List<Person>? creators; // Liste des créateurs du personnage
  final String? deck; // Résumé bref du personnage
  final String? description; // Description complète du personnage
  final int? gender; // Sexe (Male, Female, Other)
  final int id; // ID unique du personnage
  final ImageAPI? image; // Image principale du personnage
  final List<Comic>? issues_died_in; // Liste des numéros où le personnage meurt
  final String? name; // Nom du personnage
  final Person? publisher; // Éditeur principal du personnage
  final String? real_name; // Nom réel du personnage
  final String? site_detail_url; // URL vers les détails sur Giant Bomb

  Character(
      {this.aliases,
      this.api_detail_url,
      this.birth,
      this.creators,
      this.deck,
      this.description,
      this.gender,
      required this.id,
      this.image,
      this.issues_died_in,
      this.name,
      this.publisher,
      this.real_name,
      this.site_detail_url});

  //Méthode pour la sérialisation JSON
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
