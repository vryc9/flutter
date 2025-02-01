import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/services/off_api.dart';
import '../../model/character_api.dart';

abstract class CharacterDetailEvent {}

class LoadCharacterDetailEvent extends CharacterDetailEvent {
  final String characterId;

  LoadCharacterDetailEvent(this.characterId);
}

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, Map<String, CharacterDetailState>> {
  CharacterDetailBloc() : super({}) {
    on<LoadCharacterDetailEvent>(_loadCharacterDetail);
  }

  Future<void> _loadCharacterDetail(
    LoadCharacterDetailEvent event,
    Emitter<Map<String, CharacterDetailState>> emit,
  ) async {
    final characterId = event.characterId;

    // Vérifiez si le personnage est déjà dans l'état
    if (state.containsKey(characterId)) return;

    // Ajouter l'état de chargement pour ce personnage
    final loadingState = Map<String, CharacterDetailState>.from(state)
      ..[characterId] = CharacterDetailNotifierLoadingState(characterId);
    emit(loadingState);

    try {
      // Appel à l'API pour récupérer les détails du personnage
      final response = await OFFAPIManager().fetchCharacterById(characterId);
      final character =
          Character.fromJson(response!.results as Map<String, dynamic>);

      // Ajouter l'état de succès pour ce personnage
      final successState = Map<String, CharacterDetailState>.from(state)
        ..[characterId] =
            CharacterDetailNotifierSuccessState(characterId, character);
      emit(successState);
    } catch (error) {
      // Ajouter l'état d'erreur pour ce personnage
      final errorState = Map<String, CharacterDetailState>.from(state)
        ..[characterId] = CharacterDetailNotifierErrorState(characterId, error);
      emit(errorState);
    }
  }
}

sealed class CharacterDetailState {}

class CharacterDetailNotifierLoadingState extends CharacterDetailState {
  final String characterId;

  CharacterDetailNotifierLoadingState(this.characterId);
}

class CharacterDetailNotifierSuccessState extends CharacterDetailState {
  final String characterId;
  final Character character;

  CharacterDetailNotifierSuccessState(this.characterId, this.character);
}

class CharacterDetailNotifierErrorState extends CharacterDetailState {
  final String characterId;
  final dynamic error;

  CharacterDetailNotifierErrorState(this.characterId, this.error);
}
