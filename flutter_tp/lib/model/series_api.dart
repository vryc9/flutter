import 'package:flutter_tp/model/character_api.dart';
import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_api.g.dart';

@JsonSerializable(explicitToJson: true)
class SerieResponse {
  final String? name;
  final ImageAPI? image;
  final int? count_of_episodes;
  final Person? publisher;
  final List<Character>? characters;
  final String? deck;

  SerieResponse(
      {required this.name,
      required this.image,
      required this.count_of_episodes,
      required this.publisher,
      required this.characters,
      required this.deck});

  // Généré automatiquement par json_serializable
  factory SerieResponse.fromJson(Map<String, dynamic> json) =>
      _$SerieResponseFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$SerieResponseToJson(this);
}
