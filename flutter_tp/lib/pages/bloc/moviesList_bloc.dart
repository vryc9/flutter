import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class MoviesListEvent {}

class LoadMoviesListEvent extends MoviesListEvent {}

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  MoviesListBloc() : super(MoviesListNotifierLoadingState()) {
    on<LoadMoviesListEvent>(_loadMoviesList);
    add(LoadMoviesListEvent());
  }

  Future<void> _loadMoviesList(
    MoviesListEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    try {
      final OFFServerResponseMovies? response =
          await OFFAPIManager().loadMoviesList();
      if (response != null && response.status_code == 1) {
          emit(MoviesListNotifierLSuccessState(response));
        } else {
          emit(
              MoviesListNotifierErrorState(response?.error, response?.status_code));
        }
    } catch (e) {
      emit(MoviesListNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class MoviesListState {}

class MoviesListNotifierLoadingState extends MoviesListState {}

class MoviesListNotifierLSuccessState extends MoviesListState {
  final OFFServerResponseMovies response;

  MoviesListNotifierLSuccessState(this.response);
}

class MoviesListNotifierErrorState extends MoviesListState {
  final dynamic message;
  final int? statusCode;

  MoviesListNotifierErrorState(this.message, this.statusCode);
}
