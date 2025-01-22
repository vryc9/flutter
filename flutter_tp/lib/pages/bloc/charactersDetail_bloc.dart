import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/character_api.dart';

abstract class CharacterDetailEvent {}

class LoadCharacterDetailEvent extends CharacterDetailEvent {
  LoadCharacterDetailEvent();
}

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc(this.characterId)
      : assert(characterId.isNotEmpty),
        super(CharacterDetailNotifierLoadingState()) {
    on<LoadCharacterDetailEvent>(_loadCharacter);
    add(LoadCharacterDetailEvent());
  }

  final String characterId;

  Future<void> _loadCharacter(
    CharacterDetailEvent event,
    Emitter<CharacterDetailState> emit,
  ) async {
    try {
      final OFFServerResponseCharacter? response =
          await OFFAPIManager().fetchCharacterById(characterId);
      emit(CharacterDetailNotifierSuccessState(response!.results));
    } catch (e) {
      emit(CharacterDetailNotifierErrorState(e));
    }
  }
}

sealed class CharacterDetailState {}

class CharacterDetailNotifierLoadingState extends CharacterDetailState {}

class CharacterDetailNotifierSuccessState extends CharacterDetailState {
  final Character? character;

  CharacterDetailNotifierSuccessState(this.character);

}

class CharacterDetailNotifierErrorState extends CharacterDetailState {
  final dynamic error;

  CharacterDetailNotifierErrorState(this.error);

}