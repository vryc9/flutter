import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/serie_api.dart';

abstract class SeriesSearchListEvent {}

class LoadSeriesSearchListEvent extends SeriesSearchListEvent {
  LoadSeriesSearchListEvent();
}

class SeriesSearchListBloc extends Bloc<SeriesSearchListEvent, SeriesSearchListState> {
  SeriesSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(SeriesSearchListNotifierLoadingState()) {
    on<LoadSeriesSearchListEvent>(_loadSerie);
    add(LoadSeriesSearchListEvent());
  }

  final String query;

  Future<void> _loadSerie(
    SeriesSearchListEvent event,
    Emitter<SeriesSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseSeries? response =
          await OFFAPIManager().searchSeries(query);
          if (response != null && response.status_code == 1) {
        emit(SeriesSearchListNotifierSuccessState(response.results));
      } else {
        emit(
            SeriesSearchListNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(SeriesSearchListNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class SeriesSearchListState {}

class SeriesSearchListNotifierLoadingState extends SeriesSearchListState {}

class SeriesSearchListNotifierSuccessState extends SeriesSearchListState {
  final List<Serie>? series;

  SeriesSearchListNotifierSuccessState(this.series);

}

class SeriesSearchListNotifierErrorState extends SeriesSearchListState {
  final dynamic error;
  final int? statusCode;

  SeriesSearchListNotifierErrorState(this.error, this.statusCode);

}