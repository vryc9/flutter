import 'package:flutter_tp/api/model/character.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

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

  @GET("/search/")
  Future<OFFServerResponseSearchCharacter?> searchCharacter( 
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query("limit") String limit,
    @Query("query") String query,
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
  final String _apiKey = "8d2e74d3727e2c7edc9f8d43e96ba96a0ab6afaa";
  
  OFFAPIManager._()
      : api = OFFAPI(
          Dio(BaseOptions(
            headers: {
              'Content-Type': 'application/json',
            },
          )),
          baseUrl: "https://comicvine.gamespot.com/api"
        );

  //Méthode pour récupérer un personnage par ID
  Future<OFFServerResponseCharacter?> fetchCharacterById(String characterId) async {
    try {
      return await api.getCharacterById(characterId, _apiKey, "json");
    } catch (e) {
      print("Erreur lors de la récupération du personnage : $e");
      return null;
    }
  }

  //Méthode pour rechercher un personnage
  Future<OFFServerResponseSearchCharacter?> searchCharacter(String query) async {
    try {
      return await api.searchCharacter(_apiKey, "json", "10", query, "character");
    } catch (e) {
      print("Erreur lors de la récupération de la recherche du personnage : $e");
      return null;
    }
  }
}