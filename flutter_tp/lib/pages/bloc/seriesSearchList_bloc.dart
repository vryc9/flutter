import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/serie_api.dart';

abstract class SerieSearchListEvent {}

class LoadSerieSearchListEvent extends SerieSearchListEvent {
  LoadSerieSearchListEvent();
}

class SerieSearchListBloc extends Bloc<SerieSearchListEvent, SerieSearchListState> {
  SerieSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(SerieSearchListNotifierLoadingState()) {
    on<LoadSerieSearchListEvent>(_loadSerie);
    add(LoadSerieSearchListEvent());
  }

  final String query;

  Future<void> _loadSerie(
    SerieSearchListEvent event,
    Emitter<SerieSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseSeries? response =
          await OFFAPIManager().searchSeries(query);
      emit(SerieSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(SerieSearchListNotifierErrorState(e));
    }
  }
}

sealed class SerieSearchListState {}

class SerieSearchListNotifierLoadingState extends SerieSearchListState {}

class SerieSearchListNotifierSuccessState extends SerieSearchListState {
  final List<Serie>? series;

  SerieSearchListNotifierSuccessState(this.series);

}

class SerieSearchListNotifierErrorState extends SerieSearchListState {
  final dynamic error;

  SerieSearchListNotifierErrorState(this.error);

}