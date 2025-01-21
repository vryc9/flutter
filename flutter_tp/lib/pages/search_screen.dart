import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/charactersSearchList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsSearchList_bloc.dart';
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
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _makeInvisible() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isFoundedCharacter = true;
      _isFoundedComic = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

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
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Recherche',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Personnage, Comic...',
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.bottomBarTextUnselected),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppColors.bottomBarTextUnselected, 
                          ), 
                        fillColor: AppColors.screenBackground,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.bottomBarTextSelected),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.bottomBarTextUnselected),
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
                            _query = query;
                          });
                          _makeInvisible();
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              if (!_isSearching)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saisissez une recherche pour trouver un comic ou un personnage',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      SvgPicture.asset(AppVectorialImages.astronaut),
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
                  ],
                  child: Column(
                    children: [
                      // BlocBuilder pour les personnages
                      BlocBuilder<CharacterSearchListBloc, CharacterSearchListState>(
                        builder: (context, state) {
                          if (state is CharacterSearchListNotifierSuccessState) {
                            final characters = state.characters;
                            if (characters != null && characters.isEmpty) {
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
                            if (comics != null && comics.isEmpty) {
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
                      SizedBox(height: height * 0.08),
                    ],
                  ),
                ),
              
              if (_isSearching)
                Visibility(
                  visible: !_isFoundedCharacter & !_isFoundedComic,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        SvgPicture.asset(AppVectorialImages.astronaut),
                        const SizedBox(width: 32),
                        const Text(
                          'Recherche en cours, merci de patienter...',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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