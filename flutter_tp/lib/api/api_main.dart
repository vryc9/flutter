import 'package:dio/dio.dart';
import 'package:flutter_tp/api/model/episodes_api.dart';
import 'package:flutter_tp/api/model/series_list_api.dart';
import 'package:retrofit/retrofit.dart';

part 'api_main.g.dart';

@RestApi()
abstract class Apimain {
  factory Apimain(Dio dio, {required String baseUrl}) = _Apimain;

  @GET(
      '/series_list?api_key=c6eabeb68c2dd781df0fc65806e8ed5ab839334c&format=json')
  Future<SerieListResponseServer> loadSeriesList();

  @GET("episodes?api_key=c6eabeb68c2dd781df0fc65806e8ed5ab839334c&format=json")
  Future<EpisodesResponseServer> loadEpisodeList(
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );
}

class OFFAPIManager {
  static OFFAPIManager? _instance;

  factory OFFAPIManager() {
    _instance ??= OFFAPIManager._();
    return _instance!;
  }

  final Apimain api;

  OFFAPIManager._()
      : api = Apimain(
          Dio(),
          baseUrl: 'https://comicvine.gamespot.com/api/',
        );

  Future<SerieListResponseServer> loadSeriesList() async {
    return api.loadSeriesList();
  }

  Future<EpisodesResponseServer> loadEpisodeList() async {
    return api.loadEpisodeList(
        'c6eabeb68c2dd781df0fc65806e8ed5ab839334c', 'json');
  }
}
