import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:flutter_tp/model/volume_api.dart';
import 'package:json_annotation/json_annotation.dart';

import 'character_api.dart';

part 'comic_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Comic {
  final List<Character?>? character_credits; 
  final String? description;
  final int? id;
  final ImageAPI? image;
  final String? issue_number;
  final String? name;
  final List<Person?>? person_credits;
  @JsonKey(fromJson: _stringFromJson)
  final String? cover_date;
  final Volume? volume;

  Comic(
      {this.description,
      this.id,
      this.image,
      this.issue_number,
      this.name,
      this.cover_date,
      this.volume,
      this.character_credits,
      this.person_credits});

  // Généré automatiquement par json_serializable
  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$ComicToJson(this);

  //Convertit n'importe quelle valeur en string ou empty string si null
  static String _stringFromJson(dynamic value) {
    return value?.toString() ?? '';
  }
}
