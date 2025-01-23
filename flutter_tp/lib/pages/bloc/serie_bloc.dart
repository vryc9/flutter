import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class SeriesEvent {}

class LoadSerieEvent extends SeriesEvent {
  final String seriesId;

  LoadSerieEvent(this.seriesId);
}

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final OFFAPIManager apiManager;

  SeriesBloc({required this.apiManager}) : super(SeriesNotifierLoadingState()) {
    on<LoadSerieEvent>(_loadSerie);
  }

  Future<void> _loadSerie(
    LoadSerieEvent event,
    Emitter<SeriesState> emit,
  ) async {
    try {
      emit(SeriesNotifierLoadingState());
      final OFFServerResponseSerie? response =
          await apiManager.fetchSerieById(event.seriesId);
      emit(SeriesNotifierSuccessState(response!));
    } catch (e) {
      emit(SeriesNotifierErrorState(e));
    }
  }
}

sealed class SeriesState {}

class SeriesNotifierLoadingState extends SeriesState {}

class SeriesNotifierSuccessState extends SeriesState {
  final OFFServerResponseSerie response;

  SeriesNotifierSuccessState(this.response);
}

class SeriesNotifierErrorState extends SeriesState {
  final dynamic message;

  SeriesNotifierErrorState(this.message);
}
