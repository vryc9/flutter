import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/charactersSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/serieSearchList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/widgets/horizontal_list.dart';

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
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _makeInvisible() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isFoundedCharacter = true;
      _isFoundedComic = true;
      _isFoundedSerie = true;
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
                    const Text(
                      'Recherche',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 17),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Comic, film, série...',
                        filled: true,
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 24,
                          ), 
                        fillColor: AppColors.screenBackground,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.screenBackground),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (query) {
                        setState(() {
                          _isSearching = false;
                        });
                      },
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          setState(() {
                            _isSearching = true;
                            _isFoundedCharacter = false;
                            _isFoundedComic = false;
                            _isFoundedSerie = false;
                            _query = query;
                          });
                          _makeInvisible();
                        }
                      },
                    ),
                  ],
                ),
              ),

              if (!_isSearching)
                Container(
                  margin: EdgeInsets.symmetric(vertical: marginHeight, horizontal: 8),
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
                                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                                        child: SizedBox(
                                          width: 200,
                                          child: Text(
                                            'Saisissez une recherche pour trouver un comics, film, série ou personnage.',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.textSearch,
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



              if (_isSearching) 
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CharacterSearchListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => ComicsSearchListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => SerieSearchListBloc(_query),
                    ),
                  ],
                  child: Column(
                    children: [
                      // BlocBuilder pour les personnages
                      BlocBuilder<CharacterSearchListBloc, CharacterSearchListState>(
                        builder: (context, state) {
                          if (state is CharacterSearchListNotifierSuccessState) {
                            final characters = state.characters;
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
                              title: "Personnages",
                              items: characters,
                              type: "character",
                              page: "search",
                            );
                          } else if (state is CharacterSearchListNotifierErrorState) {
                            return Text(
                              'Erreur : ${state.error}',
                              style: const TextStyle(color: Colors.red),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),

                      // BlocBuilder pour les comics
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
                                margin: const EdgeInsets.symmetric(horizontal: 40),
                                child: const Column(
                                  children: [
                                    Text(
                                      'Aucun Comic trouvé.',
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
                          } else if (state is ComicsSearchListNotifierErrorState) {
                            return Text(
                              'Erreur : ${state.error}',
                              style: const TextStyle(color: Colors.red),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),

                      // BlocBuilder pour les series
                      BlocBuilder<SerieSearchListBloc, SerieSearchListState>(
                        builder: (context, state) {
                          if (state is SerieSearchListNotifierSuccessState) {
                            final series = state.series;
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
                                    Text(
                                      'Aucune série trouvé.',
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
                              type: "series",
                              page: "search",
                            );
                          } else if (state is SerieSearchListNotifierErrorState) {
                            return Text(
                              'Erreur : ${state.error}',
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
              
              if (_isSearching)
                Visibility(
                  visible: !_isFoundedCharacter & !_isFoundedComic & !_isFoundedSerie,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: marginHeight, horizontal: 8),
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
                                      padding: EdgeInsets.only(top: 60.0, left: 120.0),
                                      child: SizedBox(
                                        width: 150,
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