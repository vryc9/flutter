import 'package:flutter_tp/api/model/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_list_api.g.dart';

@JsonSerializable(explicitToJson: true)
class SerieListResponse {
  final String name;
  final ImageAPI image;
  final int? count_of_episodes;
  final String? start_year;
  final Publisher? publisher;
  SerieListResponse({
    required this.name,
    required this.image,
    required this.count_of_episodes,
    required this.start_year,
    required this.publisher,
  });

  factory SerieListResponse.fromJson(Map<String, dynamic> json) =>
      _$SerieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SerieListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SerieListResponseServer {
  final List<SerieListResponse>? results;
  final dynamic error;

  SerieListResponseServer({
    this.results,
    this.error,
  });

  factory SerieListResponseServer.fromJson(Map<String, dynamic> json) =>
      _$SerieListResponseServerFromJson(json);

  Map<String, dynamic> toJson() => _$SerieListResponseServerToJson(this);
}
