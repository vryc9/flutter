import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/model/serie_list_api.dart';
import 'package:flutter_tp/pages/bloc/seriesList_bloc.dart';

class SeriesListScreen extends StatelessWidget {
  const SeriesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: const Color(0xFF1A1A2E),
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Liste des séries les plus populaires',
              style: TextStyle(fontSize: 24, color: Colors.white),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF1A1A2E),
        child: BlocBuilder<SeriesListBloc, SeriesListState>(
          builder: (context, state) {
            if (state is SeriesListNotifierLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SeriesListNotifierErrorState) {
              return Center(
                child: Text(
                  'Erreur : ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is SeriesListNotifierLSuccessState) {
              final series = state.response.results ?? [];

              return ListView.builder(
                itemCount: series.length,
                itemBuilder: (context, index) {
                  final SerieListResponse serie = series[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F3243),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              serie.image?.icon_url ?? '',
                              fit: BoxFit.cover,
                              width: 132.62,
                              height: 128.86,
                            ),
                          ),
                          Positioned(
                            top: -15,
                            left: -5,
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFA41B),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '#${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  serie.name ?? 'Série inconnue',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_tree,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      serie.publisher?.name ?? 'Non défini',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '${serie.start_year ?? ''}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.tv,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '${serie.count_of_episodes ?? 0} épisodes',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.0,
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
                  );
                },
              );
            }
            return const Center(
              child: Text('Aucune donnée disponible'),
            );
          },
        ),
      ),
    );
  }
}
