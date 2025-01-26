import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class ComicListEvent {}

class LoadComicListEvent extends ComicListEvent {}

class ComicListBloc extends Bloc<ComicListEvent, ComicListState> {
  ComicListBloc() : super(ComicListNotifierLoadingState()) {
    on<LoadComicListEvent>(_loadComicsList);
    add(LoadComicListEvent());
  }

  Future<void> _loadComicsList(
    ComicListEvent event,
    Emitter<ComicListState> emit,
  ) async {
    try {
      final OFFServerResponseComics? response =
          await OFFAPIManager().loadComicsList();
      emit(ComicListNotifierLSuccessState(response!));
    } catch (e) {
      emit(ComicListNotifierErrorState(e));
    }
  }
}

sealed class ComicListState {}

class ComicListNotifierLoadingState extends ComicListState {}

class ComicListNotifierLSuccessState extends ComicListState {
  final OFFServerResponseComics response;

  ComicListNotifierLSuccessState(this.response);
}

class ComicListNotifierErrorState extends ComicListState {
  final dynamic message;

  ComicListNotifierErrorState(this.message);
}
