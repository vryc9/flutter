import 'package:flutter_tp/model/image_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_api.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieResponse {
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  final String? api_detail_url; // URL de l'image
  final ImageAPI image;
  @JsonKey(fromJson: _stringFromJson)
  final String id;

  MovieResponse({
    required this.name,
    this.api_detail_url,
    required this.image,
    required this.id
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  static String _stringFromJson(dynamic value) {
    return value?.toString() ?? ''; // Convert any value to a string or return an empty string if null
  }
}

