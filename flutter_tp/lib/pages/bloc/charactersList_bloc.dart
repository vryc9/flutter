import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

abstract class CharactersListEvent {}

class LoadCharactersListEvent extends CharactersListEvent {}

class CharactersListBloc extends Bloc<CharactersListEvent, CharactersListState> {
  CharactersListBloc() : super(CharactersListNotifierLoadingState()) {
    on<LoadCharactersListEvent>(_loadCharactersList);
    add(LoadCharactersListEvent());
  }

  Future<void> _loadCharactersList(
    CharactersListEvent event,
    Emitter<CharactersListState> emit,
  ) async {
    try {
      final OFFServerResponseCharacters? response =
          await OFFAPIManager().loadCharactersList();
      emit(CharactersListNotifierLSuccessState(response!));
    } catch (e) {
      emit(CharactersListNotifierErrorState(e));
    }
  }
}

sealed class CharactersListState {}

class CharactersListNotifierLoadingState extends CharactersListState {}

class CharactersListNotifierLSuccessState extends CharactersListState {
  final OFFServerResponseCharacters response;

  CharactersListNotifierLSuccessState(this.response);
}

class CharactersListNotifierErrorState extends CharactersListState {
  final dynamic message;

  CharactersListNotifierErrorState(this.message);
}
