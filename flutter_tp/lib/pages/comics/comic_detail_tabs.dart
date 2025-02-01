import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';

import '../../model/comic_api.dart';
import '../../widgets/histoire_detail.dart';
import '../bloc/charactersDetail_bloc.dart';

class ComicDetailTabs extends StatelessWidget {
  final Comic comic;

  const ComicDetailTabs({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getDefaultTextForEmptyValue(comic.name, defaultValue: "Nom indisponible")),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Histoire"),
              Tab(text: "Auteurs"),
              Tab(text: "Personnages"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Onglet Histoire
            _buildStoryTab(),
            // Onglet Auteurs
            _buildAuthorsTab(),
            // Onglet Personnages
            _buildCharactersTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: HistoireDetailWidget(
          content: getDefaultTextForEmptyValue(comic.description,
              defaultValue: "Description indisponible")),
    );
  }

  Widget _buildAuthorsTab() {
    return ListView.builder(
      itemCount: comic.person_credits?.length,
      itemBuilder: (context, index) {
        final personId = comic.person_credits?[index]?.id;

        // Déclenche le chargement d'un personnage si nécessaire
        return BlocProvider(
            create: (context) => CharacterDetailBloc(personId.toString()),
            child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
              builder: (context, state) {
                if (state is CharacterDetailNotifierLoadingState) {
                  return const ListTile(
                    leading: CircularProgressIndicator(),
                    title: Text('Chargement...'),
                  );
                } else if (state is CharacterDetailNotifierSuccessState) {
                  final character = state.character!;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(character.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible")),
                  );
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

    return ListView.builder(
      itemCount: comic.person_credits?.length,
      itemBuilder: (context, index) {
        final author = comic.person_credits?[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(author!.image!.icon_url!),
          ),
          title: Text(author.name!),
          //subtitle: Text(author.role),
        );
      },
    );
  }

  Widget _buildCharactersTab() {
    return ListView.builder(
      itemCount: comic.character_credits?.length,
      itemBuilder: (context, index) {
        final characterId = comic.character_credits?[index]?.id;

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
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(character.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible")),
                  );
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
  }
}
