import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/charactersList_bloc.dart';
import 'package:flutter_tp/pages/bloc/comicsList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';

class SearchpageTest extends StatelessWidget {
  const SearchpageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterListBloc(),
        ),
        BlocProvider(
          create: (context) => ComicsListBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.screenBackground,
        appBar: AppBar(
          title: const Text('Recherche'),
          centerTitle: false,
          backgroundColor: AppColors.screenBackground,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppVectorialImages.astronaut),
                  SizedBox(height: height * 0.1),
                  // BlocBuilder pour le premier bloc : Characters
                  BlocBuilder<CharacterListBloc, CharacterListState>(
                    builder: (context, state) {
                      if (state is CharacterListNotifierLoadingState) {
                        return const CircularProgressIndicator();
                      } else if (state is CharacterListNotifierLSuccessState) {
                        final characters = state.response.results;
                        if (characters == null || characters.isEmpty) {
                          return const Text(
                            'Aucun personnage trouvé.',
                            textAlign: TextAlign.center,
                          );
                        }
                        return _buildSection(
                          title: "Personnages",
                          items: characters,
                          context: context,
                        );
                      } else if (state is CharacterListNotifierErrorState) {
                        return Text(
                          'Erreur : ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        );
                      }

                      return const Text(
                        'Saisissez une recherche pour trouver des personnages.',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  const SizedBox(height: 32), // Espacement entre les sections
                  // BlocBuilder pour le second bloc : Comics
                  BlocBuilder<ComicsListBloc, ComicsListState>(
                    builder: (context, state) {
                      if (state is ComicsListNotifierLoadingState) {
                        return const CircularProgressIndicator();
                      } else if (state is ComicsListNotifierLSuccessState) {
                        final comics = state.response.results;
                        if (comics == null || comics.isEmpty) {
                          return const Text(
                            'Aucun comic trouvé.',
                            textAlign: TextAlign.center,
                          );
                        }
                        return _buildSection(
                          title: "Comics",
                          items: comics,
                          context: context,
                        );
                      } else if (state is ComicsListNotifierErrorState) {
                        return Text(
                          'Erreur : ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        );
                      }

                      return const Text(
                        'Saisissez une recherche pour trouver des comics.',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  SizedBox(height: height * 0.08),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
            // Titre avec un cercle orange
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
            // Liste horizontale
            SizedBox(
              height: 230, // Hauteur des cartes
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    width: 150, // Largeur de chaque carte
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
                          // Image
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
                          // Nom
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item.name ?? "Pas de nom",
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
