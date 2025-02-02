import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:retrofit/retrofit.dart';

part 'off_api.g.dart';

@RestApi(baseUrl: "https://comicvine.gamespot.com/api")
abstract class OFFAPI {
  factory OFFAPI(Dio dio, {required String baseUrl}) = _OFFAPI;

//search
  @GET("/search/")
  Future<OFFServerResponseCharacters?> searchCharacters(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

  @GET("/search/")
  Future<OFFServerResponseSeries?> searchSeries(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

  @GET("/search/")
  Future<OFFServerResponseMovies?> searchMovies(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

  @GET("/search/")
  Future<OFFServerResponseComics?> searchComics(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

//lists
  @GET('/series_list/')
  Future<OFFServerResponseSeries?> loadSeriesList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

  @GET('/movies/')
  Future<OFFServerResponseMovies?> loadMoviesList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

  @GET("/episodes/")
  Future<OFFServerResponseEpisodes?> loadEpisodesListById(
    @Query('api_key') String apiKey,
    @Query('format') String format,
    @Query('filter') String filter,
  );

  @GET("/issues/")
  Future<OFFServerResponseComics?> loadComicsList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

  @GET("/characters/")
  Future<OFFServerResponseCharacters?> loadCharactersList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

//by id
  @GET("/issue/4000-{comicId}/")
  Future<OFFServerResponseComic?> getComicById(
    @Path("comicId") String comicId,
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/character/4005-{characterId}/")
  Future<OFFServerResponseCharacter?> getCharacterById(
    @Path("characterId") String characterId,
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/series/4075-{serieId}/")
  Future<OFFServerResponseSerie?> getSerieById(@Path("serieId") String serieId,
      @Query("api_key") String apiKey, @Query("format") String format);

  @GET("/movie/4025-{movieId}/")
  Future<OFFServerResponseMovie?> getMovieById(@Path("movieId") String movieId,
      @Query("api_key") String apiKey, @Query("format") String format);

  @GET("/person/4040-{personId}/")
  Future<OFFServerResponsePerson?> getPersonById(
      @Path("personId") String personId,
      @Query("api_key") String apiKey,
      @Query("format") String format);
}

class OFFAPIManager {
  static OFFAPIManager? _instance;

  //Singleton
  factory OFFAPIManager() {
    _instance ??= OFFAPIManager._();
    return _instance!;
  }

  final OFFAPI api;

  //Léane
  final String _apiKey = "8d2e74d3727e2c7edc9f8d43e96ba96a0ab6afaa";
  //Enzo
  //final String _apiKey = "c6eabeb68c2dd781df0fc65806e8ed5ab839334c";
  //Quentin
  //final String _apiKey = "c59a60b10940ab69ff1eb977eee60abe38d1f936";
  //Romain
  //final String _apiKey = "9c4f2dc1521fcc94e7bf5bfc8d03cf8887eeacae";

  OFFAPIManager._()
      : api = OFFAPI(
            Dio(BaseOptions(
              headers: {
                'Content-Type': 'application/json',
              },
            )),
            baseUrl: "https://comicvine.gamespot.com/api");

  //Méthode pour rechercher des personnages
  Future<OFFServerResponseCharacters?> searchCharacters(String query) async {
    try {
      return await api.searchCharacters(
          _apiKey, "json", query, "100", "character");
    } catch (e) {
      if (kDebugMode) {
        print(
            "Erreur lors de la récupération de la recherche du personnage : $e");
      }
      return null;
    }
  }

  //Méthode pour rechercher des séries
  Future<OFFServerResponseSeries?> searchSeries(String query) async {
    try {
      return await api.searchSeries(
          _apiKeyLeane, "json", query, "100", "series");
    } catch (e) {
      if (kDebugMode) {
        print(
            "Erreur lors de la récupération de la recherche de la series : $e");
      }
      return null;
    }
  }

  //Méthode pour rechercher des films
  Future<OFFServerResponseMovies?> searchMovies(String query) async {
    try {
      return await api.searchMovies(
          _apiKeyLeane, "json", query, "100", "movie");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération de la recherche des movies : $e");
      }
      return null;
    }
  }

  //Méthode pour rechercher des comics
  Future<OFFServerResponseComics?> searchComics(String query) async {
    try {
      return await api.searchComics(
          _apiKeyLeane, "json", query, "100", "issue");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération de la recherche des comics : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une liste de séries
  Future<OFFServerResponseSeries?> loadSeriesList() async {
    try {
      return await api.loadSeriesList(_apiKey, "json", "50");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération des series : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une liste de films
  Future<OFFServerResponseMovies?> loadMoviesList() async {
    try {
      return await api.loadMoviesList(_apiKey, "json", "50");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération des movies : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une liste d'épisodes par ID de la série associée
  Future<OFFServerResponseEpisodes?> loadEpisodeList(String id) async {
    try {
      return await api.loadEpisodesListById(_apiKeyLeane, "json", "series:$id");
    } on DioException catch (e) {
      if (kDebugMode) {
        print(
            "Erreur lors de la récupération des episodes : ${e.response?.statusCode}");
      }
      return OFFServerResponseEpisodes(
          [], e.message ?? "Erreur inconnue", e.response?.statusCode ?? 0);
    }
  }

  //Méthode pour récupérer une liste de comics
  Future<OFFServerResponseComics?> loadComicsList() async {
    try {
      return await api.loadComicsList(_apiKey, "json", "50");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération des comics : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une liste de personnages
  Future<OFFServerResponseCharacters?> loadCharactersList() async {
    try {
      return await api.loadCharactersList(_apiKey, "json", "50");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération des characters : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer un comic par ID
  Future<OFFServerResponseComic?> fetchComicById(String comicId) async {
    try {
      return await api.getComicById(comicId, _apiKey, "json");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération du comic : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer un personnage par ID
  Future<OFFServerResponseCharacter?> fetchCharacterById(
      String characterId) async {
    try {
      return await api.getCharacterById(characterId, _apiKey, "json");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération du personnage : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une série par ID
  Future<OFFServerResponseSerie?> fetchSerieById(String serieId) async {
    try {
      return await api.getSerieById(serieId, _apiKey, "json");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération de la serie : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer un film par ID
  Future<OFFServerResponseMovie?> fetchMovieById(String movieId) async {
    try {
      return await api.getMovieById(movieId, _apiKey, "json");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération du movie : $e");
      }
      return null;
    }
  }

  //Méthode pour récupérer une personne par ID
  Future<OFFServerResponsePerson?> fetchPersonById(String personId) async {
    try {
      return await api.getPersonById(personId, _apiKey, "json");
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération de la personne : $e");
      }
      return null;
    }
  }
}
