import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/comic_api.dart';

abstract class ComicDetailEvent {}

class LoadComicDetailEvent extends ComicDetailEvent {
  LoadComicDetailEvent();
}

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicDetailState> {
  ComicDetailBloc(this.comicId)
      : assert(comicId.isNotEmpty),
        super(ComicDetailNotifierLoadingState()) {
    on<LoadComicDetailEvent>(_loadComic);
    add(LoadComicDetailEvent());
  }

  final String comicId;

  Future<void> _loadComic(
    ComicDetailEvent event,
    Emitter<ComicDetailState> emit,
  ) async {
    try {
      final OFFServerResponseComic? response =
          await OFFAPIManager().fetchComicById(comicId);
      emit(ComicDetailNotifierSuccessState(response!.results));
    } catch (e) {
      emit(ComicDetailNotifierErrorState(e));
    }
  }
}

sealed class ComicDetailState {}

class ComicDetailNotifierLoadingState extends ComicDetailState {}

class ComicDetailNotifierSuccessState extends ComicDetailState {
  final Comic? comic;

  ComicDetailNotifierSuccessState(this.comic);
}

class ComicDetailNotifierErrorState extends ComicDetailState {
  final dynamic error;

  ComicDetailNotifierErrorState(this.error);
}
