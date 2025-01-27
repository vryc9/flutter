import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/model/movie_api.dart';
import 'package:flutter_tp/model/serie_api.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/widgets/error_widget.dart';

class GenericListScreen extends StatelessWidget {
  //serie, movie ou comic
  final String type;

  const GenericListScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Container(
          color: AppColors.screenBackground,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left:24, top: 34, bottom: 21),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              type == 'comic'
                  ? 'Comics les plus populaires'
                  : type == 'movie'
                      ? 'Films les plus populaires'
                      : type == 'serie'
                          ? 'Séries les plus populaires'
                          : 'Type inconnu',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.left,
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
              final items = state.response.results;
              return _buildList(items);
            } else if (state is SeriesListNotifierErrorState) {
              return ErrorDisplayWidget(
                message: 'La récupération de la liste des séries a échoué. Veuillez réessayer.', 
                onRetry: () { context.read<SeriesListBloc>().add(LoadSeriesListEvent()); },
                title: "Séries : ",
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
    } else if (type == 'comic') {
      return BlocProvider(
        create: (context) => ComicsListBloc(),
        child: BlocBuilder<ComicsListBloc, ComicsListState>(
          builder: (context, state) {
            if (state is ComicsListNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComicsListNotifierLSuccessState) {
              final items = state.response.results;
              return _buildList(items);
            } else if (state is ComicsListNotifierErrorState) {
              return ErrorDisplayWidget(
                message: 'La récupération de la liste des comics a échoué. Veuillez réessayer.', 
                onRetry: () { context.read<ComicsListBloc>().add(LoadComicsListEvent()); },
                title: "Comics : ",
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
              final items = state.response.results;
              return _buildList(items);
            } else if (state is MoviesListNotifierErrorState) {
              return ErrorDisplayWidget(
                message: 'La récupération de la liste des films a échoué. Veuillez réessayer.', 
                onRetry: () { context.read<MoviesListBloc>().add(LoadMoviesListEvent()); },
                title: "Films : ",
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
        height: 164,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                serie.image!.original_url!,
                height: 132.62,
                width: 128.86,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: AppColors.cardElementBackground,
                      size: 40,
                    ),
                  );
                },
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
                    color: AppColors.orange,
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
                        serie.name as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
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
                          height: 12.0,
                          colorFilter: const ColorFilter.mode(
                              AppColors.bottomBarTextUnselected, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          serie.publisher?.name ?? 'Éditeur inconnu',
                          style: const TextStyle(
                            color: AppColors.bottomBarTextUnselected,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.tv,
                            color: AppColors.bottomBarTextUnselected,
                          size: 15,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${serie.count_of_episodes ?? 0} épisodes',
                          style: const TextStyle(
                            color: AppColors.bottomBarTextUnselected,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                            color: AppColors.bottomBarTextUnselected,
                          size: 15,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          serie.start_year ?? '',
                          style: const TextStyle(
                            color: AppColors.bottomBarTextUnselected,
                            fontSize: 12.0,
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
        height: 196,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                comic.image!.original_url!,
                height: 163,
                width: 128.86,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: AppColors.cardElementBackground,
                      size: 40,
                    ),
                  );
                },
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
                    color: AppColors.orange,
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
                    SizedBox(
                      width: 191,
                      child: Text(
                        comic.volume!.name ?? 'Volume inconnu',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 191,
                      child: Text(
                        comic.name ?? 'Comic inconnu',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
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
                          height: 15.0,
                          colorFilter: const ColorFilter.mode(
                              AppColors.bottomBarTextUnselected, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'N°${comic.issue_number ?? 'Non défini'}',
                          style: const TextStyle(
                            color: AppColors.bottomBarTextUnselected,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppVectorialImages.icCalendarBicolor,
                          height: 15.0,
                          colorFilter: const ColorFilter.mode(
                              AppColors.bottomBarTextUnselected, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          formatDateMonthYear(comic.cover_date),
                          style: const TextStyle(
                            color: AppColors.bottomBarTextUnselected,
                            fontSize: 12.0,
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
      height: 153,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                movie.image!.original_url!,
                height: 118,
                width: 128.86,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: AppColors.cardElementBackground,
                      size: 40,
                    ),
                  );
                },
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
                  color: AppColors.orange,
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
                        fontSize: 17.0,
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
                        color: AppColors.bottomBarTextUnselected,
                        size: 15,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${movie.runtime ?? 'Inconnu'} minutes',
                        style: const TextStyle(
                          color: AppColors.bottomBarTextUnselected,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7.6),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: AppColors.bottomBarTextUnselected,
                        size: 15,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        formatDateYear(movie.date_added),
                        style: const TextStyle(
                          color: AppColors.bottomBarTextUnselected,
                          fontSize: 12.0,
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
