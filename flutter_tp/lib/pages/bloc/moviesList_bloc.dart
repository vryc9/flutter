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
      final MovieResponseServer response =
          await OFFAPIManager().loadMovieList();
      emit(MoviesListNotifierLSuccessState(response));
    } catch (e) {
      emit(MoviesListNotifierErrorState(e));
    }
  }
}

sealed class MoviesListState {}

class MoviesListNotifierLoadingState extends MoviesListState {}

class MoviesListNotifierLSuccessState extends MoviesListState {
  final MovieResponseServer response;

  MoviesListNotifierLSuccessState(this.response);
}

class MoviesListNotifierErrorState extends MoviesListState {
  final dynamic message;

  MoviesListNotifierErrorState(this.message);
}
