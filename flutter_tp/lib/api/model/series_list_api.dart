import 'package:json_annotation/json_annotation.dart';

part 'series_list_api.g.dart';

@JsonSerializable(explicitToJson: true)
class SerieListResponse {
  final String name;
  final Image? image;
  final int? countOfEpisodes;
  final int? startYear;
  final Publisher? publisher;
  SerieListResponse({
    required this.name,
    required this.image,
    required this.countOfEpisodes,
    required this.startYear,
    required this.publisher,
  });

  factory SerieListResponse.fromJson(Map<String, dynamic> json) =>
      _$SerieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SerieListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Image {
  final String? iconUrl;
  final String? mediumUrl;
  final String? screenUrl;
  final String? screenLargeUrl;
  final String? smallUrl;
  final String? superUrl;
  final String? thumbUrl;
  final String? tinyUrl;
  final String? originalUrl;
  final String? imageTags;

  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Publisher {
  final String? apiDetailUrl;
  final int? id;
  final String? name;

  Publisher({
    this.apiDetailUrl,
    this.id,
    this.name,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherToJson(this);
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
