import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';
import 'package:flutter_tp/res/app_svg.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => SerieslistBloc(),
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
                BlocBuilder<SerieslistBloc, SeriesListState>(
                  builder: (context, state) {
                    if (state is SeriesListNotifierLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is SeriesListNotifierLSuccessState) {
                      final series = state.response.results;
                      if (series == null || series.isEmpty) {
                        return const Text(
                          'Aucun résultat trouvé.',
                          textAlign: TextAlign.center,
                        );
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: series.length,
                          itemBuilder: (context, index) {
                            final serie = series[index];
                            return ListTile(
                              title: Text(serie.name ?? 'Nom non disponible'),
                              subtitle: Text(
                                serie.publisher?.name ?? 'Éditeur inconnu',
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is SeriesListNotifierErrorState) {
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
