import 'package:flutter_tp/model/character_api.dart';
import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/episode_api.dart';
import 'package:flutter_tp/model/movie_api.dart';
import 'package:flutter_tp/model/person_api.dart';
import 'package:flutter_tp/model/serie_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api.g.dart';

//liste de comic
@JsonSerializable(explicitToJson: true)
class OFFServerResponseComics {
  final List<Comic> results;
  final String error;

  OFFServerResponseComics(this.results, this.error);

  factory OFFServerResponseComics.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseComicsFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseComicsToJson(this);
}

//liste de serie
@JsonSerializable(explicitToJson: true)
class OFFServerResponseSeries {
  final List<Serie> results;
  final String error;

  OFFServerResponseSeries(this.results, this.error);

  factory OFFServerResponseSeries.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSeriesToJson(this);
}

//liste d'episode
@JsonSerializable(explicitToJson: true)
class OFFServerResponseEpisodes {
  final List<Episode> results;
  final String error;

  OFFServerResponseEpisodes(this.results, this.error);

  factory OFFServerResponseEpisodes.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseEpisodesToJson(this);
}

//liste de movie
@JsonSerializable(explicitToJson: true)
class OFFServerResponseMovies {
  final List<Movie> results;
  final String error;

  OFFServerResponseMovies(this.results, this.error);

  factory OFFServerResponseMovies.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseMoviesToJson(this);
}

//liste de character
@JsonSerializable(explicitToJson: true)
class OFFServerResponseCharacters {
  final List<Character> results;
  final String error;

  OFFServerResponseCharacters(this.results, this.error);

  factory OFFServerResponseCharacters.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseCharactersFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseCharactersToJson(this);
}

//comic
@JsonSerializable(explicitToJson: true)
class OFFServerResponseComic {
  final Comic results;
  final String error;

  OFFServerResponseComic(this.results, this.error);

  factory OFFServerResponseComic.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseComicFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseComicToJson(this);
}

//character
@JsonSerializable(explicitToJson: true)
class OFFServerResponseCharacter {
  final Character results;
  final String error;

  OFFServerResponseCharacter(this.results, this.error);

  factory OFFServerResponseCharacter.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseCharacterToJson(this);
}

//serie
@JsonSerializable(explicitToJson: true)
class OFFServerResponseSerie {
  final Serie results;
  final String error;

  OFFServerResponseSerie(
    this.results,
    this.error,
  );

  factory OFFServerResponseSerie.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSerieFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSerieToJson(this);
}

//movie
@JsonSerializable(explicitToJson: true)
class OFFServerResponseMovie {
  final Movie results;
  final String error;

  OFFServerResponseMovie(
    this.results,
    this.error,
  );

  factory OFFServerResponseMovie.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseMovieFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseMovieToJson(this);
}

//person
@JsonSerializable(explicitToJson: true)
class OFFServerResponsePerson {
  final Person results;
  final String error;

  OFFServerResponsePerson(
    this.results,
    this.error,
  );

  factory OFFServerResponsePerson.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponsePersonFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponsePersonToJson(this);
}
