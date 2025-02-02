import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/movie_api.dart';

abstract class MoviesSearchListEvent {}

class LoadMoviesSearchListEvent extends MoviesSearchListEvent {
  LoadMoviesSearchListEvent();
}

class MoviesSearchListBloc extends Bloc<MoviesSearchListEvent, MoviesSearchListState> {
  MoviesSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(MoviesSearchListNotifierLoadingState()) {
    on<LoadMoviesSearchListEvent>(_loadMovies);
    add(LoadMoviesSearchListEvent());
  }

  final String query;

  Future<void> _loadMovies(
    MoviesSearchListEvent event,
    Emitter<MoviesSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseMovies? response = await OFFAPIManager().searchMovies(query);
      if (response != null && response.status_code == 1) {
        emit(MoviesSearchListNotifierSuccessState(response.results));
      } else {
        emit(
            MoviesSearchListNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(MoviesSearchListNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class MoviesSearchListState {}

class MoviesSearchListNotifierLoadingState extends MoviesSearchListState {}

class MoviesSearchListNotifierSuccessState extends MoviesSearchListState {
  final List<Movie?> movies;

  MoviesSearchListNotifierSuccessState(this.movies);

}

class MoviesSearchListNotifierErrorState extends MoviesSearchListState {
  final dynamic error;
  final int? statusCode;

  MoviesSearchListNotifierErrorState(this.error, this.statusCode);

}