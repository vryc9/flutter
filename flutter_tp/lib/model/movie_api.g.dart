// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      name: Movie._stringFromJson(json['name']),
      image: json['image'] == null
          ? null
          : ImageAPI.fromJson(json['image'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      box_office_revenue: Movie._stringFromJson(json['box_office_revenue']),
      budget: Movie._stringFromJson(json['budget']),
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: Movie._stringFromJson(json['description']),
      distributor: Movie._stringFromJson(json['distributor']),
      producers: Movie._stringFromJson(json['producers']),
      rating: Movie._stringFromJson(json['rating']),
      date_added: Movie._stringFromJson(json['date_added']),
      runtime: Movie._stringFromJson(json['runtime']),
      studios: (json['studios'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_revenue: Movie._stringFromJson(json['total_revenue']),
      writers: (json['writers'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image?.toJson(),
      'id': instance.id,
      'description': instance.description,
      'characters': instance.characters?.map((e) => e.toJson()).toList(),
      'runtime': instance.runtime,
      'box_office_revenue': instance.box_office_revenue,
      'producers': instance.producers,
      'rating': instance.rating,
      'date_added': instance.date_added,
      'studios': instance.studios?.map((e) => e.toJson()).toList(),
      'total_revenue': instance.total_revenue,
      'writers': instance.writers?.map((e) => e.toJson()).toList(),
      'budget': instance.budget,
      'distributor': instance.distributor,
    };
