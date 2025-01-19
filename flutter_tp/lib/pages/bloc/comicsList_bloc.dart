import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/comic_api.dart';

abstract class ComicsListEvent {}

class LoadComicsListEvent extends ComicsListEvent {
  LoadComicsListEvent();
}

class ComicsListBloc extends Bloc<ComicsListEvent, ComicsListState> {
  ComicsListBloc(this.query)
      : assert(query.isNotEmpty),
        super(ComicsListNotifierLoadingState()) {
    on<LoadComicsListEvent>(_loadComics);
    add(LoadComicsListEvent());
  }

  final String query;

  Future<void> _loadComics(
    ComicsListEvent event,
    Emitter<ComicsListState> emit,
  ) async {
    try {
      final OFFServerResponseComicList? response =
          await OFFAPIManager().searchComics(query);
      emit(ComicsListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(ComicsListNotifierErrorState(e));
    }
  }
}

sealed class ComicsListState {}

class ComicsListNotifierLoadingState extends ComicsListState {}

class ComicsListNotifierSuccessState extends ComicsListState {
  final List<Comic?> Comics;

  ComicsListNotifierSuccessState(this.Comics);

}

class ComicsListNotifierErrorState extends ComicsListState {
  final dynamic error;

  ComicsListNotifierErrorState(this.error);

}