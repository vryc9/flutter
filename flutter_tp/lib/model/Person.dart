import 'package:json_annotation/json_annotation.dart';

part '../../model/generated/Person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  final String id; // ID unique de l'issue
  final Image? image; // Image principale de l'issue
  final String name; // Nom de l'issue

  Person({
    required this.id,
    this.image,
    required this.name,
  });

  // Généré automatiquement par json_serializable
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$PersonFromJson(this);
}
