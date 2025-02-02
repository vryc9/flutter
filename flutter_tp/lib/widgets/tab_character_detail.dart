import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/model/character_api.dart';

import '../pages/bloc/charactersDetail_bloc.dart';
import '../utils/text_formatter_utils.dart';

// Contenu de l'onglet Personnages
class TabCharacterDetailWidget extends StatelessWidget {
  final List<Character?>? character_credits;

  const TabCharacterDetailWidget({
    super.key,
    required this.character_credits,
  });

  @override
  Widget build(BuildContext context) {
    if (character_credits != null) {
      return ListView.builder(
        itemCount: character_credits?.length,
        itemBuilder: (context, index) {
          final characterId = character_credits?[index]?.id;

          // Déclenche le chargement d'un personnage si nécessaire
          return BlocProvider(
              create: (context) => CharacterDetailBloc(characterId.toString()),
              child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
                builder: (context, state) {
                  if (state is CharacterDetailNotifierLoadingState) {
                    return const ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text('Chargement...'),
                    );
                  } else if (state is CharacterDetailNotifierSuccessState) {
                    final character = state.character!;
                    return GestureDetector(
                      // On relie le clic de la tile au détail de character.
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/characterDetail',
                          arguments: {
                            'itemId': character.id.toString(),
                          },
                        );
                      },
                      child: ListTile(
                        // Image.
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(character.image!.thumb_url!),
                          onBackgroundImageError: (_, __) =>
                              const Icon(Icons.broken_image_rounded),
                        ),
                        // Nom.
                        title: Text(
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            getDefaultTextForEmptyValue(character.name,
                                defaultValue: "Nom indisponible")),
                      ),
                    );
                  // Tile d'erreur affichée en cas de problème.
                  } else if (state is CharacterDetailNotifierErrorState) {
                    return const ListTile(
                      leading: Icon(Icons.error),
                      title: Text('Erreur de chargement'),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ));
        },
      );
    } else {
      return const Center(
        child: Text(
          'Aucun personnage disponible',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }
  }
}
