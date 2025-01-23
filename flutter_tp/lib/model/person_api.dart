import 'package:flutter_tp/model/image_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  final int? id;
  final ImageAPI? image;
  final String? name;

  Person({
    this.id,
    this.image,
    this.name,
  });

  // Généré automatiquement par json_serializable
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}