import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/characterList_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';

class SearchpageTest extends StatelessWidget {
  const SearchpageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => CharacterListBloc(),
      child: Scaffold(
        backgroundColor: AppColors.screenBackground,
        appBar: AppBar(
          title: const Text('RECHERCHE'),
          centerTitle: false,
          backgroundColor: AppColors.screenBackground,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppVectorialImages.astronaut),
                SizedBox(height: height * 0.1),
                BlocBuilder<CharacterListBloc, CharacterListState>(
                  builder: (context, state) {
                    if (state is CharacterListNotifierLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is CharacterListNotifierLSuccessState) {
                      final characters = state.response.results;
                      if (characters == null || characters.isEmpty) {
                        return const Text(
                          'Aucun résultat trouvé.',
                          textAlign: TextAlign.center,
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(16), // Coins arrondis
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.bottomBarBackgroundSelected.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4), // Ombre
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Titre de la section
                              Row(
                                children: [
                                  // Petit cercle orange
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: AppColors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8), // Espacement
                                  const Text(
                                    "Personnages",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 202, // Longueur de chaque carte
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal, // Orientation horizontale
                                  itemCount: characters.length,
                                  itemBuilder: (context, index) {
                                    final character = characters[index];
                                    return Container(
                                      width: 150, // Largeur de chaque carte
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Card(
                                        color: AppColors.cardElementBackground,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16), // Coins arrondis
                                        ),
                                        elevation: 4, // Ombre de la carte
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
                                                character.image!.screen_large_url,
                                                height: 150, // Hauteur de l'image
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return const SizedBox(
                                                    height: 100,
                                                    child: Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) {
                                                  return const SizedBox(
                                                    height: 100,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.broken_image,
                                                        color: AppColors.cardElementBackground,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            // Nom
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text(
                                                character.name!,
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

                      
                    } else if (state is CharacterListNotifierErrorState) {
                      return Text(
                        'Erreur : ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      );
                    }

                    return const Text(
                      'Saisissez une recherche pour trouver un comics, film, série ou personnage.',
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
    );
  }
}
