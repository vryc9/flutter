import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/serieDetail_bloc.dart';
import 'package:flutter_tp/pages/characters/character_detail_tabs.dart';
import 'package:flutter_tp/pages/comics/comic_detail_tabs.dart';
import 'package:flutter_tp/pages/films/movie_detail_tabs.dart';
import 'package:flutter_tp/pages/serie/serie_detail_tabs.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/error_widget.dart';

//Page générique de détail. En fonction du type passé, appelle le bon bloc et affiche le résultat dans le detail_tab associé.
class ContentDetailPage extends StatelessWidget {
  // Peut être 'serie', 'movie', 'character' ou 'comic'
  final String type;

  const ContentDetailPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    // Récupère l'id de l'élément dans la route
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final itemId = args['itemId'];

    return Scaffold(
      body: _buildBody(itemId),
    );
  }

  Widget _buildBody(itemId) {
    // Cas type = comic
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
              return ErrorDisplayWidget(
                message: formatErreurMessage(
                    state.status_code!, "La récupération du comic a échoué"),
                onRetry: () {
                  context.read<ComicDetailBloc>().add(LoadComicDetailEvent());
                },
                title: "Comic : ",
              );
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
      // Cas type = character
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
                message: formatErreurMessage(state.status_code!,
                    "La récupération du personnage a échoué"),
                onRetry: () {
                  context
                      .read<CharacterDetailBloc>()
                      .add(LoadCharacterDetailEvent());
                },
                title: "Personnage : ",
              );
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
      // Cas type = movie
    } else if (type == 'movie') {
      return BlocProvider(
          create: (context) => MovieDetailBloc(itemId),
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
              if (state is MovieDetailNotifierLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieDetailNotifierSuccessState) {
                final movie = state.movie!;
                return MovieDetailTabs(movie: movie);
              } else if (state is MovieDetailNotifierErrorState) {
                return ErrorDisplayWidget(
                  message: formatErreurMessage(
                      state.statusCode!, "La récupération du film a échoué"),
                  onRetry: () {
                    context.read<MovieDetailBloc>().add(LoadMovieDetailEvent());
                  },
                  title: "Film : ",
                );
              } else {
                return const Center(child: Text('Aucune donnée disponible.'));
              }
            },
          ));
      // Cas type = serie
    } else if (type == 'serie') {
      return BlocProvider(
        create: (context) => SerieDetailBloc(itemId),
        child: BlocBuilder<SerieDetailBloc, SerieDetailState>(
          builder: (context, state) {
            if (state is SerieDetailNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SerieDetailNotifierSuccessState) {
              final serie = state.serie!;
              return SerieDetailTabs(serie: serie);
            } else if (state is SerieDetailNotifierErrorState) {
              return ErrorDisplayWidget(
                message: formatErreurMessage(
                    state.statusCode!, "La récupération de la série a échoué"),
                onRetry: () {
                  context.read<SerieDetailBloc>().add(LoadSerieDetailEvent());
                },
                title: "Série : ",
              );
            } else {
              return const Center(child: Text('Aucune donnée disponible.'));
            }
          },
        ),
      );
      // Cas type = autre que comic, serie, character ou movie
    } else {
      return const Center(child: Text('Données non reconnues.'));
    }
  }
}
