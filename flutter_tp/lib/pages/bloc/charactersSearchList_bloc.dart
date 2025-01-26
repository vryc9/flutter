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
      emit(CharactersSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(CharactersSearchListNotifierErrorState(e));
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

  CharactersSearchListNotifierErrorState(this.error);

}