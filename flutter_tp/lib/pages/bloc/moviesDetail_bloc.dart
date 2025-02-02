import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/movie_api.dart';

abstract class MovieDetailEvent {}

class LoadMovieDetailEvent extends MovieDetailEvent {
  LoadMovieDetailEvent();
}

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.movieId)
      : assert(movieId.isNotEmpty),
        super(MovieDetailNotifierLoadingState()) {
    on<LoadMovieDetailEvent>(_loadMovie);
    add(LoadMovieDetailEvent());
  }

  final String movieId;

  Future<void> _loadMovie(
    MovieDetailEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      final OFFServerResponseMovie? response =
          await OFFAPIManager().fetchMovieById(movieId);
      if (response != null && response.status_code == 1) {
        emit(MovieDetailNotifierSuccessState(response!.results));
      } else {
        emit(MovieDetailNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(MovieDetailNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class MovieDetailState {}

class MovieDetailNotifierLoadingState extends MovieDetailState {}

class MovieDetailNotifierSuccessState extends MovieDetailState {
  final Movie? movie;

  MovieDetailNotifierSuccessState(this.movie);
}

class MovieDetailNotifierErrorState extends MovieDetailState {
  final dynamic error;
  final int? statusCode;

  MovieDetailNotifierErrorState(this.error, this.statusCode);
}
