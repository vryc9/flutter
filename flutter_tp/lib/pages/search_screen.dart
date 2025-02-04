import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/charactersSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/moviesSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/seriesSearchList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/error_widget.dart';
import 'package:flutter_tp/widgets/horizontal_list.dart';

// Page de recherche.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _isFoundedCharacter = false;
  bool _isFoundedComic = false;
  bool _isFoundedSerie = false;
  bool _isFoundedMovie = false;
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  // Méthode pour dire que les listes sont trouvées.
  Future<void> _makeInvisible() async {
    // Attends 5 secondes avant de s'activer.
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isFoundedCharacter = true;
      _isFoundedComic = true;
      _isFoundedSerie = true;
      _isFoundedMovie = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double marginHeight = height / 4;

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  children: [
                    const SizedBox(height: 17),
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        // Titre.
                        child: Text(
                          'Recherche',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    // Barre de recherche.
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Comic, film, série, personnage...',
                        filled: true,
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            AppVectorialImages.navbarSearch,
                            color: AppColors.iconSearch,
                            width: 12,
                            height: 12,
                          ),
                        ),
                        fillColor: AppColors.screenBackground,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppColors.screenBackground),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      // Quand un élément change dans la barre de rechercher, on dit que la recherche n'est pas lancée.
                      onChanged: (query) {
                        setState(() {
                          _isSearching = false;
                        });
                      },
                      // Quand la touche entrée est enfoncée, on dit que la recherche est lancée et que les listes ne sont pas trouvées.
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          setState(() {
                            _isSearching = true;
                            _isFoundedCharacter = false;
                            _isFoundedComic = false;
                            _isFoundedSerie = false;
                            _isFoundedMovie = false;
                            _query = query;
                          });
                          // Appelé pour dire que les listes sont trouvées car nous n'avons pas réussi à le relié aux listes.
                          _makeInvisible();
                        }
                      },
                    ),
                  ],
                ),
              ),

              // Quand la recherche n'est pas lancée, affiche le texte d'invitation à faire une recherche et un petit astronaute.
              if (!_isSearching)
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: marginHeight, horizontal: 8),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 141,
                        width: 360,
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(23.0),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 16.0, bottom: 16.0),
                                        child: SizedBox(
                                          width: 200,
                                          // Texte avec les mots comics, film, série et personnage en gras.
                                          child: Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.textSearch,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        'Saisissez une recherche pour trouver un '),
                                                TextSpan(
                                                  text: 'comics',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(text: ', '),
                                                TextSpan(
                                                  text: 'film',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(text: ', '),
                                                TextSpan(
                                                  text: 'série',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(text: ' ou '),
                                                TextSpan(
                                                  text: 'personnage',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(text: '.'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Astronaute.
                      Positioned(
                        top: -35,
                        right: 15,
                        child: SvgPicture.asset(
                          AppVectorialImages.astronaut,
                          height: 125,
                        ),
                      ),
                    ],
                  ),
                ),

              // Quand la recherche est lancée, affiche les listes de résultats quand elles sont trouvées.
              if (_isSearching)
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CharactersSearchListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => ComicsSearchListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => SeriesSearchListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => MoviesSearchListBloc(_query),
                    ),
                  ],
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      // BlocBuilder pour les series. Appelle la liste générique horizontal list.
                      BlocBuilder<SeriesSearchListBloc, SeriesSearchListState>(
                        builder: (context, state) {
                          if (state is SeriesSearchListNotifierSuccessState) {
                            final series = state.series;
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
                                      'Aucun résultat trouvé pour les séries.',
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
                              title: "Series",
                              items: series!,
                              type: "serie",
                              page: "search",
                            );
                          } else if (state
                              is SeriesSearchListNotifierErrorState) {
                            return ErrorDisplayWidget(
                              message: formatErreurMessage(state.statusCode!,
                                  "La récupération de la liste des séries a échoué"),
                              onRetry: () {
                                context
                                    .read<SeriesSearchListBloc>()
                                    .add(LoadSeriesSearchListEvent());
                              },
                              title: "Séries : ",
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),

                      // BlocBuilder pour les comics. Appelle la liste générique horizontal list.
                      BlocBuilder<ComicsSearchListBloc, ComicsSearchListState>(
                        builder: (context, state) {
                          if (state is ComicsSearchListNotifierSuccessState) {
                            final comics = state.comics;
                            if (comics.isEmpty) {
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
                                      'Aucun résultat trouvé pour les comics.',
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
                              title: "Comics",
                              items: comics,
                              type: "comic",
                              page: "search",
                            );
                          } else if (state
                              is ComicsSearchListNotifierErrorState) {
                            return ErrorDisplayWidget(
                              message: formatErreurMessage(state.statusCode!,
                                  "La récupération de la liste des comics a échoué"),
                              onRetry: () {
                                context
                                    .read<ComicsSearchListBloc>()
                                    .add(LoadComicsSearchListEvent());
                              },
                              title: "Comics : ",
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),

                      // BlocBuilder pour les movies. Appelle la liste générique horizontal list.
                      BlocBuilder<MoviesSearchListBloc, MoviesSearchListState>(
                        builder: (context, state) {
                          if (state is MoviesSearchListNotifierSuccessState) {
                            final movies = state.movies;
                            if (movies.isEmpty) {
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
                                      'Aucun résultat trouvé pour les films.',
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
                              title: "Films",
                              items: movies,
                              type: "movie",
                              page: "search",
                            );
                          } else if (state
                              is MoviesSearchListNotifierErrorState) {
                            return ErrorDisplayWidget(
                              message: formatErreurMessage(state.statusCode!,
                                  "La récupération de la liste des films a échoué"),
                              onRetry: () {
                                context
                                    .read<MoviesSearchListBloc>()
                                    .add(LoadMoviesSearchListEvent());
                              },
                              title: "Films : ",
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),

                      // BlocBuilder pour les personnages. Appelle la liste générique horizontal list.
                      BlocBuilder<CharactersSearchListBloc,
                          CharactersSearchListState>(
                        builder: (context, state) {
                          if (state
                              is CharactersSearchListNotifierSuccessState) {
                            final characters = state.characters;
                            if (characters.isEmpty) {
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
                                      'Aucun résultat trouvé pour les personnages.',
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
                              title: "Personnages",
                              items: characters,
                              type: "character",
                              page: "search",
                            );
                          } else if (state
                              is CharactersSearchListNotifierErrorState) {
                            return ErrorDisplayWidget(
                              message: formatErreurMessage(state.statusCode!,
                                  "La récupération de la liste des personnages a échoué"),
                              onRetry: () {
                                context
                                    .read<CharactersSearchListBloc>()
                                    .add(LoadCharactersSearchListEvent());
                              },
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

              // Quand la recherche est lancée, affiche le petit astronaute avec le texte de recherche en cours. N'est affiché que si les listes ne sont pas trouvées.
              if (_isSearching)
                Visibility(
                  visible: !_isFoundedCharacter &
                      !_isFoundedComic &
                      !_isFoundedSerie &
                      !_isFoundedMovie,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: marginHeight, horizontal: 8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 141,
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60.0, left: 120.0),
                                      child: SizedBox(
                                        width: 150,
                                        // Texte.
                                        child: Text(
                                          'Recherche en cours, Merci de patienter...',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.textSearch,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Astronaute.
                        Positioned(
                          top: -150,
                          right: 125,
                          child: SvgPicture.asset(
                            AppVectorialImages.astronaut,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
