import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/character_api.dart';

abstract class CharacterSearchListEvent {}

class LoadCharacterSearchListEvent extends CharacterSearchListEvent {
  LoadCharacterSearchListEvent();
}

class CharacterSearchListBloc extends Bloc<CharacterSearchListEvent, CharacterSearchListState> {
  CharacterSearchListBloc(this.query)
      : assert(query.isNotEmpty),
        super(CharacterSearchListNotifierLoadingState()) {
    on<LoadCharacterSearchListEvent>(_loadCharacter);
    add(LoadCharacterSearchListEvent());
  }

  final String query;

  Future<void> _loadCharacter(
    CharacterSearchListEvent event,
    Emitter<CharacterSearchListState> emit,
  ) async {
    try {
      final OFFServerResponseSearchCharacter? response =
          await OFFAPIManager().searchCharacter(query);
      emit(CharacterSearchListNotifierSuccessState(response!.results));
    } catch (e) {
      emit(CharacterSearchListNotifierErrorState(e));
    }
  }
}

sealed class CharacterSearchListState {}

class CharacterSearchListNotifierLoadingState extends CharacterSearchListState {}

class CharacterSearchListNotifierSuccessState extends CharacterSearchListState {
  final List<Character?> characters;

  CharacterSearchListNotifierSuccessState(this.characters);

}

class CharacterSearchListNotifierErrorState extends CharacterSearchListState {
  final dynamic error;

  CharacterSearchListNotifierErrorState(this.error);

}