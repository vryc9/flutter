import 'package:flutter_tp/model/character_api.dart';
import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serie_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Serie {
  final String? name;
  final ImageAPI? image;
  final int? count_of_episodes;
  final String? start_year;
  final Person? publisher;
  final List<Character>? characters;
  final String? description;
  final int? id;
  
  Serie({
    this.name,
    this.image,
    this.count_of_episodes,
    this.start_year,
    this.publisher,
    this.characters,
    this.description,
    this.id,
  });

  // Généré automatiquement par json_serializable
  factory Serie.fromJson(Map<String, dynamic> json) =>
      _$SerieFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$SerieToJson(this);
}

