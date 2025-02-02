import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/character_api.dart';

abstract class CharactersSearchListEvent {}

class LoadCharactersSearchListEvent extends CharactersSearchListEvent {
  LoadCharactersSearchListEvent();
}

class CharactersSearchListBloc extends Bloc<CharactersSearchListEvent, CharactersSearchListState> {
  CharactersSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(CharactersSearchListNotifierLoadingState()) {
    on<LoadCharactersSearchListEvent>(_loadCharacter);
    add(LoadCharactersSearchListEvent());
  }

  final String query;

  Future<void> _loadCharacter(
    CharactersSearchListEvent event,
    Emitter<CharactersSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseCharacters? response =
          await OFFAPIManager().searchCharacters(query);
      if (response != null && response.status_code == 1) {
        emit(CharactersSearchListNotifierSuccessState(response.results));
      } else {
        emit(
            CharactersSearchListNotifierErrorState(response?.error, response?.status_code));
      }
      emit(CharactersSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(CharactersSearchListNotifierErrorState(e.toString(), 0));
    }
  }
}

sealed class CharactersSearchListState {}

class CharactersSearchListNotifierLoadingState extends CharactersSearchListState {}

class CharactersSearchListNotifierSuccessState extends CharactersSearchListState {
  final List<Character?> characters;

  CharactersSearchListNotifierSuccessState(this.characters);

}

class CharactersSearchListNotifierErrorState extends CharactersSearchListState {
  final dynamic error;
  final int? statusCode;
  CharactersSearchListNotifierErrorState(this.error, this.statusCode);

}