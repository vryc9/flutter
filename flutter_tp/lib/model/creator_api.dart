import 'package:json_annotation/json_annotation.dart';

part 'creator_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Creator {
  final String api_detail_url;
  final int id;
  final String name;
  final String site_detail_url;

  Creator(this.api_detail_url, this.id, this.name, this.site_detail_url);

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}