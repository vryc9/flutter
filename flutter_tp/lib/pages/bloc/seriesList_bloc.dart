import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class SeriesListEvent {}

class LoadSeriesListEvent extends SeriesListEvent {}

class SeriesListBloc extends Bloc<SeriesListEvent, SeriesListState> {
  SeriesListBloc() : super(SeriesListNotifierLoadingState()) {
    on<LoadSeriesListEvent>(_loadSeriesList);
    add(LoadSeriesListEvent());
  }

  Future<void> _loadSeriesList(
    SeriesListEvent event,
    Emitter<SeriesListState> emit,
  ) async {
    try {
      final OFFServerResponseSeries? response =
          await OFFAPIManager().loadSeriesList();
      if (response != null && response.status_code == 1) {
        emit(SeriesListNotifierLSuccessState(response));
      } else {
        emit(
            SeriesListNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(SeriesListNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class SeriesListState {}

class SeriesListNotifierLoadingState extends SeriesListState {}

class SeriesListNotifierLSuccessState extends SeriesListState {
  final OFFServerResponseSeries response;

  SeriesListNotifierLSuccessState(this.response);
}

class SeriesListNotifierErrorState extends SeriesListState {
  final dynamic message;
  final int? statusCode;

  SeriesListNotifierErrorState(this.message, this.statusCode);
}
