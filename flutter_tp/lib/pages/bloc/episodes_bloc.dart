import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class EpisodesEvent {}

class LoadEpisodesEvent extends EpisodesEvent {}

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesNotifierLoadingState()) {
    on<LoadEpisodesEvent>(_loadEpisodes);
    add(LoadEpisodesEvent());
  }

  Future<void> _loadEpisodes(
    EpisodesEvent event,
    Emitter<EpisodesState> emit,
  ) async {
    try {
      final EpisodesResponseServer response =
          await OFFAPIManager().loadEpisodeList('1');
      emit(EpisodesNotifierLSuccessState(response));
    } catch (e) {
      emit(EpisodesNotifierErrorState(e));
    }
  }
}

sealed class EpisodesState {}

class EpisodesNotifierLoadingState extends EpisodesState {}

class EpisodesNotifierLSuccessState extends EpisodesState {
  final EpisodesResponseServer response;

  EpisodesNotifierLSuccessState(this.response);
}

class EpisodesNotifierErrorState extends EpisodesState {
  final dynamic error;

  EpisodesNotifierErrorState(this.error);
}
