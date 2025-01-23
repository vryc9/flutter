import 'package:dio/dio.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:retrofit/retrofit.dart';

part 'off_api.g.dart';

@RestApi(baseUrl: "https://comicvine.gamespot.com/api")
abstract class OFFAPI {
  factory OFFAPI(Dio dio, {required String baseUrl}) = _OFFAPI;

  @GET("/character/4005-{characterId}/")
  Future<OFFServerResponseCharacter?> getCharacterById(
    @Path("characterId") String characterId,
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/series/4075-{seriesId}/")
  Future<SerieResponseServer> getSerieById(@Path("seriesId") String seriesId,
      @Query("api_key") String apiKey, @Query("format") String format);

  @GET("/search/")
  Future<OFFServerResponseSearchCharacter?> searchCharacter(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

  @GET("/search/")
  Future<SerieListResponseServer?> searchSerie(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );

  @GET('/series_list/')
  Future<SerieListResponseServer> loadSeriesList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

  @GET("/episodes/")
  Future<EpisodesResponseServer> loadEpisodeList(
    @Path('seriesId') String seriesId,
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET("/issues/")
  Future<OFFServerResponseComicList> getAllComics(
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/issue/")
  Future<OFFServerResponseComic?> getComicById(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("id") String id,
  );

  @GET("/search/")
  Future<OFFServerResponseComicList?> searchComic(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("query") String query,
    @Query('limit') String limit,
    @Query("resources") String resources,
  );
}

class OFFAPIManager {
  static OFFAPIManager? _instance;

  //Singleton
  factory OFFAPIManager() {
    _instance ??= OFFAPIManager._();
    return _instance!;
  }

  final OFFAPI api;
  //léane
  final String _apiKey = "8d2e74d3727e2c7edc9f8d43e96ba96a0ab6afaa";

  OFFAPIManager._()
      : api = OFFAPI(
            Dio(BaseOptions(
              headers: {
                'Content-Type': 'application/json',
              },
            )),
            baseUrl: "https://comicvine.gamespot.com/api");

  //Méthode pour récupérer un personnage par ID
  Future<OFFServerResponseCharacter?> fetchCharacterById(
      String characterId) async {
    try {
      return await api.getCharacterById(characterId, _apiKey, "json");
    } catch (e) {
      print("Erreur lors de la récupération du personnage : $e");
      return null;
    }
  }

  //Méthode pour rechercher un personnage
  Future<OFFServerResponseSearchCharacter?> searchCharacter(
      String query) async {
    try {
      return await api.searchCharacter(_apiKey, "json", query, "100", "character");
    } catch (e) {
      print(
          "Erreur lors de la récupération de la recherche du personnage : $e");
      return null;
    }
  }
  //Méthode pour rechercher une serie
  Future<SerieListResponseServer?> searchSerie(
      String query) async {
    try {
      return await api.searchSerie(_apiKey, "json", query, "100", "series");
    } catch (e) {
      print(
          "Erreur lors de la récupération de la recherche de la serie : $e");
      return null;
    }
  }

  //Méthode pour rechercher un comic
  Future<OFFServerResponseComicList?> searchComics(String query) async {
    try {
      return await api.searchComic(_apiKey, "json", query, "100", "issue");
    } catch (e) {
      print("Erreur lors de la récupération de la recherche du comic : $e");
      return null;
    }
  }

  //Méthode pour récupérer une liste de série
  Future<SerieListResponseServer> loadSeriesList() async {
    return api.loadSeriesList(_apiKey, "json", "15");
  }

  //Méthode pour récupérer une série par ID
  Future<SerieResponseServer> getSerieById(String id) async {
    return api.getSerieById(id, _apiKey, "json");
  }

  //Méthode pour récupérer une liste d'épisode
  Future<EpisodesResponseServer> loadEpisodeList(String id) async {
    return api.loadEpisodeList(
        id, 'c6eabeb68c2dd781df0fc65806e8ed5ab839334c', 'json');
  }

  //Méthode pour rechercher un comic
  Future<OFFServerResponseComicList?> searchComic(String query) async {
    try {
      return await api.searchComic(_apiKey, "json", query, "100", "issue");
    } catch (e) {
      print("Erreur lors de la récupération de la recherche du comic : $e");
      return null;
    }
  }

  //Méthode pour récupérer une liste de comics
  Future<OFFServerResponseComicList> loadComicsList() async {
    return api.getAllComics(_apiKey, "json");
  }
}
