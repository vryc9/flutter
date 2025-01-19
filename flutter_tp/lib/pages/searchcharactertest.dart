import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/charactersList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';

class SearchpageTest extends StatefulWidget {
  const SearchpageTest({super.key});

  @override
  _SearchpageTestState createState() => _SearchpageTestState();
}

class _SearchpageTestState extends State<SearchpageTest> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _isFounded = false;
  String _query = "";

  @override
  void initState() {
    super.initState();
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
              // Partie barre de recherche
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
                        labelText: "Rechercher un personnage",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (query) {
                        // Cette fonction est appelée chaque fois que l'utilisateur tape quelque chose
                        if (query.isEmpty) {
                          setState(() {
                            _isSearching = false;
                          });
                        }
                      },
                      onSubmitted: (query) {
                        if (query.isNotEmpty) {
                          setState(() {
                            _isSearching = true;
                            _isFounded = false;
                            _query = query;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Partie centrale en attendant la recherche (avant que la recherche commence)
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

              // Partie après réception des résultats de l'API
              if (_isSearching) 
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CharacterListBloc(_query),
                    ),
                    BlocProvider(
                      create: (context) => ComicsListBloc(_query),
                    ),
                  ],
                  child: Column(
                    children: [
                      // BlocBuilder pour les personnages
                      BlocBuilder<CharacterListBloc, CharacterListState>(
                        builder: (context, state) {
                          if (state is CharacterListNotifierSuccessState) {
                            _isFounded = true;
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
                            return _buildSection(
                              title: "Personnages",
                              items: characters,
                              context: context,
                            );
                          } else if (state is CharacterListNotifierErrorState) {
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
                      BlocBuilder<ComicsListBloc, ComicsListState>(
                        builder: (context, state) {
                          if (state is ComicsListNotifierSuccessState) {
                            _isFounded = true;
                            final comics = state.Comics;
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
                            return _buildSection(
                              title: "Comics",
                              items: comics,
                              context: context,
                            );
                          } else if (state is ComicsListNotifierErrorState) {
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

              // Partie quand la recherche est lancée (durant la recherche)
              if (_isSearching) 
                if(!_isFounded)
                  Container(
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

            ],
          ),
        ),
      ),
    );
  }

  // Widget des listes (Personnages ou Comics)
  Widget _buildSection({
    required String title,
    required List<dynamic> items,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      color: AppColors.cardElementBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              item.image.screen_large_url!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
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
                          const SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item.name ?? "Nom inconnu",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}