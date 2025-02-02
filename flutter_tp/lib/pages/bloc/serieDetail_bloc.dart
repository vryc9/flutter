import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/serie_api.dart';

abstract class SerieDetailEvent {}

class LoadSerieDetailEvent extends SerieDetailEvent {
  LoadSerieDetailEvent();
}

class SerieDetailBloc extends Bloc<SerieDetailEvent, SerieDetailState> {
  SerieDetailBloc(this.serieId)
      : assert(serieId.isNotEmpty),
        super(SerieDetailNotifierLoadingState()) {
    on<LoadSerieDetailEvent>(_loadSerie);
    add(LoadSerieDetailEvent());
  }

  final String serieId;

  Future<void> _loadSerie(
    SerieDetailEvent event,
    Emitter<SerieDetailState> emit,
  ) async {
    try {
      final OFFServerResponseSerie? response =
          await OFFAPIManager().fetchSerieById(serieId);

      if (response != null && response.status_code == 1) {
        emit(SerieDetailNotifierSuccessState(response.results));
      } else {
        emit(SerieDetailNotifierErrorState(
            response?.error, response?.status_code));
      }
    } catch (e) {
      emit(SerieDetailNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class SerieDetailState {}

class SerieDetailNotifierLoadingState extends SerieDetailState {}

class SerieDetailNotifierSuccessState extends SerieDetailState {
  final Serie? serie;

  SerieDetailNotifierSuccessState(this.serie);
}

class SerieDetailNotifierErrorState extends SerieDetailState {
  final dynamic error;
  final int? statusCode;

  SerieDetailNotifierErrorState(this.error, this.statusCode);
}
