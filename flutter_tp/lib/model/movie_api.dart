import 'package:flutter_tp/model/character_api.dart';
import 'package:flutter_tp/model/image_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  @JsonKey(fromJson: _stringFromJson)
  final String? name;
  final ImageAPI? image;
  final int? id;
  @JsonKey(fromJson: _stringFromJson)
  final String? description;
  final List<Character>? characters;
  @JsonKey(fromJson: _stringFromJson)
  final String? runtime;
  @JsonKey(fromJson: _stringFromJson)
  final String? box_office_revenue;
  final List<Person>? producers;
  @JsonKey(fromJson: _stringFromJson)
  final String? rating;
  @JsonKey(fromJson: _stringFromJson)
  final String? date_added;
  final List<Person>? studios;
  @JsonKey(fromJson: _stringFromJson)
  final String? total_revenue;
  final List<Person>? writers;
  @JsonKey(fromJson: _stringFromJson)
  final String? budget;
  final String? distributor;

  Movie({
    this.name,
    this.image,
    this.id,
    this.box_office_revenue,
    this.budget,
    this.characters,
    this.description,
    this.distributor,
    this.producers,
    this.rating,
    this.date_added,
    this.runtime,
    this.studios,
    this.total_revenue,
    this.writers,
  });

  // Généré automatiquement par json_serializable
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  //Convertit n'importe quelle valeur en string ou empty string si null
  static String _stringFromJson(dynamic value) {
    return value?.toString() ?? '';
  }
}

