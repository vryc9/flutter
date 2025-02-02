import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class EpisodesEvent {}

class LoadEpisodesEvent extends EpisodesEvent {
  final String id;

  LoadEpisodesEvent(this.id);
}

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesNotifierLoadingState()) {
    on<LoadEpisodesEvent>(_loadEpisodes);
  }

  Future<void> _loadEpisodes(
    LoadEpisodesEvent event,
    Emitter<EpisodesState> emit,
  ) async {
    try {
      final OFFServerResponseEpisodes? response =
          await OFFAPIManager().loadEpisodeList(event.id);

      if (response != null && response.status_code == 1) {
        emit(EpisodesNotifierLSuccessState(response));
      } else {
        emit(
            EpisodesNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(EpisodesNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class EpisodesState {}

class EpisodesNotifierLoadingState extends EpisodesState {}

class EpisodesNotifierLSuccessState extends EpisodesState {
  final OFFServerResponseEpisodes response;

  EpisodesNotifierLSuccessState(this.response);
}

class EpisodesNotifierErrorState extends EpisodesState {
  final dynamic error;
  final int? statusCode;

  EpisodesNotifierErrorState(this.error, this.statusCode);
}
