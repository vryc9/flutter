import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/character_api.dart';

abstract class CharacterListEvent {}

class LoadCharacterListEvent extends CharacterListEvent {
  LoadCharacterListEvent();
}

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc(this.query)
      : assert(query.isNotEmpty),
        super(CharacterListNotifierLoadingState()) {
    on<LoadCharacterListEvent>(_loadCharacter);
    add(LoadCharacterListEvent());
  }

  final String query;

  Future<void> _loadCharacter(
    CharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    try {
      final OFFServerResponseSearchCharacter? response =
          await OFFAPIManager().searchCharacter(query);
      emit(CharacterListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(CharacterListNotifierErrorState(e));
    }
  }
}

sealed class CharacterListState {}

class CharacterListNotifierLoadingState extends CharacterListState {}

class CharacterListNotifierSuccessState extends CharacterListState {
  final List<Character?> characters;

  CharacterListNotifierSuccessState(this.characters);

}

class CharacterListNotifierErrorState extends CharacterListState {
  final dynamic error;

  CharacterListNotifierErrorState(this.error);

}