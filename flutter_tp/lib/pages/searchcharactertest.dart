import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/characterList_bloc.dart';
import 'package:flutter_tp/res/app_svg.dart';

class SearchpageTest extends StatelessWidget {
  const SearchpageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => CharacterListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RECHERCHE'),
          centerTitle: false,
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

                      return Expanded(
                        child: ListView.builder(
                          itemCount: characters.length,
                          itemBuilder: (context, index) {
                            final character = characters[index];
                            return ListTile(
                              leading: character.image!.icon_url != null
                                  ? Image.network(character.image!.icon_url)
                                  : const Icon(Icons.image_not_supported),
                              title: Text(character.name ?? 'Nom non disponible'),
                              subtitle: Text(
                                character.publisher?.name ?? 'Éditeur inconnu',
                              ),
                            );
                          },
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
