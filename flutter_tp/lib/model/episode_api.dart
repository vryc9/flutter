import 'package:json_annotation/json_annotation.dart';

part 'episode_api.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodesResponse {
  final int? episode_number;
  final String? name;
  final String? air_date;

  EpisodesResponse({
    required this.episode_number,
    required this.name,
    required this.air_date,
  });

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EpisodesResponseServer {
  final List<EpisodesResponse> results;

  final dynamic error;

  EpisodesResponseServer({
    required this.results,
    required this.error,
  });

  // Généré automatiquement par json_serializable
  factory EpisodesResponseServer.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseServerFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$EpisodesResponseServerToJson(this);
}
