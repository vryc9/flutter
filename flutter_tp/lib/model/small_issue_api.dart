import 'package:json_annotation/json_annotation.dart';

part 'small_issue_api.g.dart';
@JsonSerializable(explicitToJson: true)
class SmallIssue {
  final String api_detail_url;
  final int id;
  final String name;
  final String site_detail_url;

  SmallIssue(this.api_detail_url, this.id, this.name, this.site_detail_url);

  factory SmallIssue.fromJson(Map<String, dynamic> json) => _$SmallIssueFromJson(json);

  Map<String, dynamic> toJson() => _$SmallIssueToJson(this);
}
