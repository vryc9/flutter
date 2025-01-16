import 'package:json_annotation/json_annotation.dart';

part '../../model/generated/Image.g.dart';

@JsonSerializable(explicitToJson: true)
class Image {
  final String icon_url;
  final String medium_url;
  final String screen_url;
  final String screen_large_url;
  final String small_url;
  final String super_url;
  final String thumb_url;
  final String tiny_url;
  final String original_url;
  final String image_tags;

  Image(this.icon_url, this.medium_url, this.screen_url, this.screen_large_url, this.image_tags, this.original_url, this.small_url, this.super_url, this.thumb_url, this.tiny_url);

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}