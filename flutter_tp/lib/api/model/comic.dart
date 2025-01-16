import 'package:json_annotation/json_annotation.dart';

part '../../model/Comic.g.dart';

@JsonSerializable(explicitToJson: true)
class OFFServerResponseComic {
  final List<String>? characterCredits; // Liste des personnages présents
  final DateTime? coverDate; // Date de publication sur la couverture
  final String description; // Description détaillée
  final String id; // ID unique de l'issue
  final String? image; // Image principale de l'issue
  final String? issueNumber; // Numéro de l'issue
  final String name; // Nom de l'issue
  final List<String>? personCredits; // Personnes ayant travaillé sur l'issue
  final DateTime? storeDate; // Date de sortie en magasin
  final String? volume; // Volume auquel appartient l'issue

  OFFServerResponseComic(this.results, this.error, this.limit, this.number_of_page_results, this.number_of_total_results, this.offset, this.status_code);


  factory OFFServerResponseComic.fromJson(Map<String, dynamic> json) =>
        _$OFFServerResponseComicFromJson(json);

  Map<String, dynamic> toJson() => _$OOFFServerResponseComicToJson(this);
}
