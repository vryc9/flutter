import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/character_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class CharacterListEvent {}

class LoadCharacterListEvent extends CharacterListEvent {}

class CharacterlistBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterlistBloc() : super(CharacterListNotifierLoadingState()) {
    on<LoadCharacterListEvent>(_loadCharacterList);
    add(LoadCharacterListEvent());
  }

  Future<void> _loadCharacterList(
    CharacterListEvent event,
    Emitter<CharacterListState> emit,
  ) async {
    try {
      final OFFServerResponseSearchCharacter? response =
          await OFFAPIManager().searchCharacter("Butcher");
      emit(CharacterListNotifierLSuccessState(response!));
    } catch (e) {
      emit(CharacterListNotifierErrorState(e));
    }
  }
}

sealed class CharacterListState {}

class CharacterListNotifierLoadingState extends CharacterListState {}

class CharacterListNotifierLSuccessState extends CharacterListState {
  final OFFServerResponseSearchCharacter response;

  CharacterListNotifierLSuccessState(this.response);
}

class CharacterListNotifierErrorState extends CharacterListState {
  final dynamic message;

  CharacterListNotifierErrorState(this.message);
}
