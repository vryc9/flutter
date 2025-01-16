import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class SeriesListEvent {}

class LoadSeriesListEvent extends SeriesListEvent {}

class SerieslistBloc extends Bloc<SeriesListEvent, SeriesListState> {
  SerieslistBloc() : super(SeriesListNotifierLoadingState()) {
    on<LoadSeriesListEvent>(_loadSeriesList);
    add(LoadSeriesListEvent());
  }

  Future<void> _loadSeriesList(
    SeriesListEvent event,
    Emitter<SeriesListState> emit,
  ) async {
    try {
      final SerieListResponseServer response =
          await OFFAPIManager().loadSeriesList();
      emit(SeriesListNotifierLSuccessState(response));
    } catch (e) {
      emit(SeriesListNotifierErrorState(e));
    }
  }
}

sealed class SeriesListState {}

class SeriesListNotifierLoadingState extends SeriesListState {}

class SeriesListNotifierLSuccessState extends SeriesListState {
  final SerieListResponseServer response;

  SeriesListNotifierLSuccessState(this.response);
}

class SeriesListNotifierErrorState extends SeriesListState {
  final dynamic message;

  SeriesListNotifierErrorState(this.message);
}
