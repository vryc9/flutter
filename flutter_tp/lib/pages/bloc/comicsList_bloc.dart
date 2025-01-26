import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class ComicsListEvent {}

class LoadComicsListEvent extends ComicsListEvent {}

class ComicsListBloc extends Bloc<ComicsListEvent, ComicsListState> {
  ComicsListBloc() : super(ComicsListNotifierLoadingState()) {
    on<LoadComicsListEvent>(_loadComicssList);
    add(LoadComicsListEvent());
  }

  Future<void> _loadComicssList(
    ComicsListEvent event,
    Emitter<ComicsListState> emit,
  ) async {
    try {
      final OFFServerResponseComics? response =
          await OFFAPIManager().loadComicsList();
      emit(ComicsListNotifierLSuccessState(response!));
    } catch (e) {
      emit(ComicsListNotifierErrorState(e));
    }
  }
}

sealed class ComicsListState {}

class ComicsListNotifierLoadingState extends ComicsListState {}

class ComicsListNotifierLSuccessState extends ComicsListState {
  final OFFServerResponseComics response;

  ComicsListNotifierLSuccessState(this.response);
}

class ComicsListNotifierErrorState extends ComicsListState {
  final dynamic message;

  ComicsListNotifierErrorState(this.message);
}
