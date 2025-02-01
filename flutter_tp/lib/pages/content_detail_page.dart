import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsDetail_bloc.dart';
import 'package:flutter_tp/pages/characters/character_detail_tabs.dart';
import 'package:flutter_tp/widgets/error_widget.dart';

import 'comics/comic_detail_tabs.dart';

class ContentDetailPage extends StatelessWidget {
  // Peut être 'serie', 'movie' ou 'comic'
  final String type;

  const ContentDetailPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final itemId = args['itemId'];

    return Scaffold(
      body: _buildBody(itemId),
    );
  }

  Widget _buildBody(itemId) {
    if (type == 'comic') {
      return BlocProvider(
        create: (context) => ComicDetailBloc(itemId),
        child: BlocBuilder<ComicDetailBloc, ComicDetailState>(
          builder: (context, state) {
            if (state is ComicDetailNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComicDetailNotifierSuccessState) {
              final comic = state.comic!;
              return ComicDetailTabs(comic: comic);
            } else if (state is ComicDetailNotifierErrorState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
    } else if (type == 'character') {
      return BlocProvider(
        create: (context) => CharacterDetailBloc(itemId),
        child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
          builder: (context, state) {
            if (state is CharacterDetailNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterDetailNotifierSuccessState) {
              final character = state.character!;
              return CharacterDetailTabs(character: character);
            } else if (state is CharacterDetailNotifierErrorState) {
              return ErrorDisplayWidget(
                message: 'La récupération du personnage a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.', 
                onRetry: () { context.read<CharacterDetailBloc>().add(LoadCharacterDetailEvent()); },
                title: "Personnage : ",
              );
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
    } else {
      return const Center(child: Text('Données non reconnue.'));
    }
  }
}
