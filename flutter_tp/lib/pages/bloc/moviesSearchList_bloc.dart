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
      emit(MoviesSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(MoviesSearchListNotifierErrorState(e));
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

  MoviesSearchListNotifierErrorState(this.error);

}