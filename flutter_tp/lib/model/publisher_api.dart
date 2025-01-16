import 'package:json_annotation/json_annotation.dart';

part 'publisher_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Publisher {
  final String api_detail_url;
  final int id;
  final String name;

  Publisher(this.api_detail_url, this.id, this.name);

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherToJson(this);
}