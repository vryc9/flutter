import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  final String? aliases;
  final String? birth;
  final List<Person>? creators;
  final String? description;
  final int? gender;
  final int? id;
  final ImageAPI? image;
  final List<Comic>? issues_died_in;
  final String? name;
  final Person? publisher; 
  final String? real_name;

  Character(
      {this.aliases,
      this.birth,
      this.creators,
      this.description,
      this.gender,
      this.id,
      this.image,
      this.issues_died_in,
      this.name,
      this.publisher,
      this.real_name,});

  // Généré automatiquement par json_serializable
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
