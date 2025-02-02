import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/widgets/error_widget.dart';
import 'package:flutter_tp/widgets/horizontal_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 32,
            child: Text(
              'Bienvenue !',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: width * 0.65,
            child: SvgPicture.asset(
              AppVectorialImages.astronaut,
              height: 150,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 110),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => SeriesListBloc(),
                      ),
                    ],
                    child: Container(
                      color: AppColors.screenBackground,
                      child: Column(
                        children: [
                          // BlocBuilder pour les séries
                          BlocBuilder<SeriesListBloc, SeriesListState>(
                            builder: (context, state) {
                              if (state is SeriesListNotifierLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is SeriesListNotifierLSuccessState) {
                                final series = state.response.results;
                                if (series.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Aucune série trouvée.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return HorizontalListWidget(
                                  title: "Séries populaires",
                                  items: series,
                                  type: "serie",
                                  page: "home",
                                );
                              }  else if (state is SeriesListNotifierErrorState) {
                                return ErrorDisplayWidget(
                                  message: 'La récupération de la liste des séries a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.', 
                                  onRetry: () { context.read<SeriesListBloc>().add(LoadSeriesListEvent()); },
                                  title: "Séries : ",
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 5),

                          // BlocBuilder pour les comics
                          BlocBuilder<ComicsListBloc, ComicsListState>(
                            builder: (context, state) {
                              if (state is ComicsListNotifierLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is ComicsListNotifierLSuccessState) {
                                final comics = state.response.results;
                                if (comics.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Aucun comic trouvé.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),  
                                      ],
                                    ),
                                  );
                                }
                                return HorizontalListWidget(
                                  title: "Comics populaires",
                                  items: comics,
                                  type: "comic",
                                  page: "home",
                                );
                              } else if (state is ComicsListNotifierErrorState) {
                                return ErrorDisplayWidget(
                                  message: 'La récupération de la liste des comics a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.', 
                                  onRetry: () { context.read<ComicsListBloc>().add(LoadComicsListEvent()); },
                                  title: "Comics : ",
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 5),

                          // BlocBuilder pour les films
                          BlocBuilder<MoviesListBloc, MoviesListState>(
                            builder: (context, state) {
                              if (state is MoviesListNotifierLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is MoviesListNotifierLSuccessState) {
                                final movies = state.response.results;
                                if (movies.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Aucun film trouvé.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),  
                                      ],
                                    ),
                                  );
                                }
                                return HorizontalListWidget(
                                  title: "Films populaires",
                                  items: movies,
                                  type: "movie",
                                  page: "home",
                                );
                              } else if (state is MoviesListNotifierErrorState) {
                                return ErrorDisplayWidget(
                                  message: 'La récupération de la liste des films a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.', 
                                  onRetry: () { context.read<MoviesListBloc>().add(LoadMoviesListEvent()); },
                                  title: "Films : ",
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 5),

                          // BlocBuilder pour les Characters
                          BlocBuilder<CharactersListBloc, CharactersListState>(
                            builder: (context, state) {
                              if (state is CharactersListNotifierLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is CharactersListNotifierLSuccessState) {
                                final characters = state.response.results;
                                if (characters.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Aucun personnage trouvé.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),  
                                      ],
                                    ),
                                  );
                                }
                                return HorizontalListWidget(
                                  title: "Personnages populaires",
                                  items: characters,
                                  type: "character",
                                  page: "home",
                                );
                              } else if (state is CharactersListNotifierErrorState) {
                                return ErrorDisplayWidget(
                                  message: 'La récupération de la liste des personnages a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.', 
                                  onRetry: () { context.read<CharactersListBloc>().add(LoadCharactersListEvent()); },
                                  title: "Personnages : ",
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        
                          SizedBox(height: height * 0.08),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
