import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/moviesList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
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
                                if (series != null && series.isEmpty) {
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
                                  items: series!,
                                  type: "serie",
                                  page: "home",
                                );
                              } else if (state is SeriesListNotifierErrorState) {
                                return Text(
                                  'Erreur : ${state.message}',
                                  style: const TextStyle(color: Colors.red),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 20),

                          // BlocBuilder pour les comics
                          BlocBuilder<SeriesListBloc, SeriesListState>(
                            builder: (context, state) {
                              if (state is SeriesListNotifierLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is SeriesListNotifierLSuccessState) {
                                final series = state.response.results;
                                if (series != null && series.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        const Text(
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
                                  items: series!,
                                  type: "comic",
                                  page: "home",
                                );
                              } else if (state is SeriesListNotifierErrorState) {
                                return Text(
                                  'Erreur : ${state.message}',
                                  style: const TextStyle(color: Colors.red),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 32),

                          // BlocBuilder pour les films
                          BlocBuilder<MoviesListBloc, MoviesListState>(
                            builder: (context, state) {
                              if (state is MoviesListNotifierLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (state is MoviesListNotifierLSuccessState) {
                                final movies = state.response.results;
                                if (movies != null && movies.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cardBackground,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: const Column(
                                      children: [
                                        const Text(
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
                                  items: movies!,
                                  type: "movie",
                                  page: "home",
                                );
                              } else if (state is MoviesListNotifierErrorState) {
                                return Text(
                                  'Erreur : ${state.message}',
                                  style: const TextStyle(color: Colors.red),
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
