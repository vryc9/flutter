import 'package:flutter_tp/model/image_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Episode {
  final String? episode_number;
  final String? name;
  final String? air_date;
  final ImageAPI? image;

  Episode({
    this.episode_number,
    this.name,
    this.air_date,
    this.image
  });

  // Généré automatiquement par json_serializable
  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}