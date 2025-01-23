import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/comic_api.dart';

abstract class ComicsSearchListEvent {}

class LoadComicsSearchListEvent extends ComicsSearchListEvent {
  LoadComicsSearchListEvent();
}

class ComicsSearchListBloc extends Bloc<ComicsSearchListEvent, ComicsSearchListState> {
  ComicsSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(ComicsSearchListNotifierLoadingState()) {
    on<LoadComicsSearchListEvent>(_loadComics);
    add(LoadComicsSearchListEvent());
  }

  final String query;

  Future<void> _loadComics(
    ComicsSearchListEvent event,
    Emitter<ComicsSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseComics? response =
          await OFFAPIManager().searchComics(query);
      emit(ComicsSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(ComicsSearchListNotifierErrorState(e));
    }
  }
}

sealed class ComicsSearchListState {}

class ComicsSearchListNotifierLoadingState extends ComicsSearchListState {}

class ComicsSearchListNotifierSuccessState extends ComicsSearchListState {
  final List<Comic?> comics;

  ComicsSearchListNotifierSuccessState(this.comics);

}

class ComicsSearchListNotifierErrorState extends ComicsSearchListState {
  final dynamic error;

  ComicsSearchListNotifierErrorState(this.error);

}