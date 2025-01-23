import 'package:flutter_tp/model/image_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Volume {
  final int? id;
  final ImageAPI? image;
  final String? name;

  Volume({
    this.id,
    this.image,
    this.name,
  });

  // Généré automatiquement par json_serializable
  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  // Généré automatiquement par json_serializable
  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}
