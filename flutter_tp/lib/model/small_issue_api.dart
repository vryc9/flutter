import 'package:json_annotation/json_annotation.dart';

part 'small_issue_api.g.dart';
@JsonSerializable(explicitToJson: true)
class Issue {
  final String api_detail_url;
  final int id;
  final String name;
  final String site_detail_url;

  Issue(this.api_detail_url, this.id, this.name, this.site_detail_url);

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  Map<String, dynamic> toJson() => _$IssueToJson(this);
}
