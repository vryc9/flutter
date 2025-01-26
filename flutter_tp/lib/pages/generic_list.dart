import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/movie_api.dart';
import 'package:flutter_tp/model/serie_api.dart';
import 'package:flutter_tp/pages/bloc/comicList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';

class GenericListScreen extends StatelessWidget {
  final String type;

  const GenericListScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: const Color(0xFF1A1A2E),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Liste des $type',
              style: const TextStyle(fontSize: 24, color: Colors.white),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (type == 'serie') {
      return BlocProvider(
        create: (context) => SeriesListBloc(),
        child: BlocBuilder<SeriesListBloc, SeriesListState>(
          builder: (context, state) {
            if (state is SeriesListNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SeriesListNotifierLSuccessState) {
              final items = state.response.results ?? [];
              return _buildList(items);
            } else if (state is SeriesListNotifierErrorState) {
              return Center(
                child: Text(
                  'Erreur : ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
    } else if (type == 'comic') {
      return BlocProvider(
        create: (context) => ComicListBloc(),
        child: BlocBuilder<ComicListBloc, ComicListState>(
          builder: (context, state) {
            if (state is ComicListNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComicListNotifierLSuccessState) {
              final items = state.response.results ?? [];
              return _buildList(items);
            } else if (state is ComicListNotifierErrorState) {
              return Center(
                child: Text(
                  'Erreur : ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
    } else if (type == 'movie') {
      return BlocProvider(
        create: (context) => MoviesListBloc(),
        child: BlocBuilder<MoviesListBloc, MoviesListState>(
          builder: (context, state) {
            if (state is MoviesListNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviesListNotifierLSuccessState) {
              final items = state.response.results ?? [];
              return _buildList(items);
            } else if (state is MoviesListNotifierErrorState) {
              return Center(
                child: Text(
                  'Erreur : ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
    } else {
      return const Center(
        child: Text('Type non pris en charge',
            style: TextStyle(color: Colors.white)),
      );
    }
  }

  Widget _buildList(List<dynamic> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Aucune donnée disponible',
            style: TextStyle(color: Colors.white)),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is Serie) {
          return _buildSerieCard(item, index);
        } else if (item is Comic) {
          return _buildComicCard(item, index, context);
        } else if (item is Movie) {
          return _buildMovieCard(item, index);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildSerieCard(Serie serie, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1F3243),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                serie.image?.icon_url ?? '',
                fit: BoxFit.cover,
                width: 132.62,
                height: 155,
              ),
            ),
            Positioned(
              top: -15,
              left: -5,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8100),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.21, bottom: 11.67),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 191,
                      child: Text(
                        serie.name ?? 'Série inconnue',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppVectorialImages.icPublisherBicolor,
                          height: 18.0,
                          colorFilter: const ColorFilter.mode(
                              Colors.white70, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          serie.publisher?.name ?? 'Éditeur inconnu',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white70,
                          size: 18,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          serie.start_year ?? '',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.tv,
                          color: Colors.white70,
                          size: 18,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${serie.count_of_episodes ?? 0} épisodes',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComicCard(Comic comic, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1F3243),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                comic.image?.icon_url ?? '',
                fit: BoxFit.cover,
                width: 128.86,
                height: 163,
              ),
            ),
            Positioned(
              top: -15,
              left: -5,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA41B),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 7.0, bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      comic.volume?.name ?? 'Comic inconnu',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 191,
                      child: Text(
                        comic.name ?? 'Comic inconnu',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppVectorialImages.icBooksBicolor,
                          height: 18.0,
                          colorFilter: const ColorFilter.mode(
                              Colors.white70, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'N°${comic.issue_number ?? 'Non défini'}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppVectorialImages.icCalendarBicolor,
                          height: 18.0,
                          colorFilter: const ColorFilter.mode(
                              Colors.white70, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          formatDate(comic.store_date) ?? 'Date inconnue',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMovieCard(Movie movie, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F3243),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              movie.image?.icon_url ?? '',
              fit: BoxFit.cover,
              width: 132.62,
              height: 128.86,
            ),
          ),
          Positioned(
            top: -15,
            left: -5,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA41B),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  '#${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 150,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.21, bottom: 11.67),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 191,
                    child: Text(
                      movie.name ?? 'Film inconnue',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.movie,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${movie.runtime ?? 'Inconnu'} minutes',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7.6),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        movie.release_date ?? 'Date inconnue',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
