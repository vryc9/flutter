import 'package:flutter_tp/model/character_api.dart';
import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/episode_api.dart';
import 'package:flutter_tp/model/serie_list_api.dart';
import 'package:flutter_tp/model/series_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api.g.dart';

@JsonSerializable(explicitToJson: true)
class OFFServerResponseComicList {
  final List<Comic> results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code; // Volume auquel appartient l'issue

  OFFServerResponseComicList(
      this.results,
      this.error,
      this.limit,
      this.number_of_page_results,
      this.number_of_total_results,
      this.offset,
      this.status_code);

  factory OFFServerResponseComicList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseComicListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseComicListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OFFServerResponseComic {
  final Comic results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code; // Volume auquel appartient l'issue

  OFFServerResponseComic(
      this.results,
      this.error,
      this.limit,
      this.number_of_page_results,
      this.number_of_total_results,
      this.offset,
      this.status_code);

  factory OFFServerResponseComic.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseComicFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseComicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OFFServerResponseCharacter {
  final Character results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code;

  OFFServerResponseCharacter(
      this.results,
      this.error,
      this.limit,
      this.number_of_page_results,
      this.number_of_total_results,
      this.offset,
      this.status_code);

  factory OFFServerResponseCharacter.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseCharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OFFServerResponseSearchCharacter {
  final List<Character> results;
  final String error;
  final int limit;
  final int offset;
  final int number_of_page_results;
  final int number_of_total_results;
  final int status_code;

  OFFServerResponseSearchCharacter(
      this.results,
      this.error,
      this.limit,
      this.number_of_page_results,
      this.number_of_total_results,
      this.offset,
      this.status_code);

  factory OFFServerResponseSearchCharacter.fromJson(
          Map<String, dynamic> json) =>
      _$OFFServerResponseSearchCharacterFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OFFServerResponseSearchCharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EpisodesResponseServer {
  final List<EpisodesResponse> results;

  final dynamic error;

  EpisodesResponseServer({
    required this.results,
    required this.error,
  });

  factory EpisodesResponseServer.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseServerFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesResponseServerToJson(this);
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

@JsonSerializable(explicitToJson: true)
class SerieResponseServer {
  final SerieResponse? results;
  final dynamic error;

  SerieResponseServer({
    this.results,
    this.error,
  });

  factory SerieResponseServer.fromJson(Map<String, dynamic> json) =>
      _$SerieResponseServerFromJson(json);

  Map<String, dynamic> toJson() => _$SerieResponseServerToJson(this);
}
