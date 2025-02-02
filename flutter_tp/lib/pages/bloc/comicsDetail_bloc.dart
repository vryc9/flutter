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
      if (response != null && response.status_code == 1) {
        emit(ComicDetailNotifierSuccessState(response.results));
      } else {
        emit(
            ComicDetailNotifierErrorState(response?.error, response?.status_code));
      }
      emit(ComicDetailNotifierSuccessState(response!.results));
    } catch (e) {
      emit(ComicDetailNotifierErrorState(e.toString(), 0));
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
  final int? status_code;
  ComicDetailNotifierErrorState(this.error, this.status_code);
}
