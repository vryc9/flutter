import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/model/serie_api.dart';
import 'package:flutter_tp/pages/bloc/episodes_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/error_widget.dart';
import 'package:flutter_tp/widgets/histoire_detail.dart';
import 'package:flutter_tp/widgets/tab_character_detail.dart';

// Détail tab de série.
class SerieDetailTabs extends StatelessWidget {
  final Serie serie;

  const SerieDetailTabs({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // Image en fond avec broken_image en cas de problème.
            Positioned.fill(
              child: 
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), 
                child: Image.network(
                  serie.image!.original_url!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
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
            ),
            // Filtre sombre par dessus l'image.
            Positioned.fill(
              child: Container(
                color: AppColors.screenBackground.withOpacity(0.7),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        expandedHeight: 240.0,
                        pinned: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        // Bouton de retour vers la page précédente.
                        leading: IconButton(
                          icon: SvgPicture.asset(
                            AppVectorialImages.icBack,
                            height: 24.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        // Nom.
                        title: Text(
                          getDefaultTextForEmptyValue(serie.name,
                              defaultValue: "Nom indisponible"),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        flexibleSpace: Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, bottom: 0.0, left: 20.0),
                          child: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 50.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // Image avec broken_image si erreur.
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: 
                                            Image.network(
                                              serie.image!.original_url!,
                                              height: 127,
                                              width: 94.87,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Center(
                                                  child: Icon(
                                                    Icons.broken_image,
                                                    color: AppColors
                                                        .cardElementBackground,
                                                    size: 40,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 12.0),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Editeur.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages
                                                          .icPublisherBicolor,
                                                      height: 12.0,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      getDefaultTextForEmptyValue(
                                                          serie.publisher?.name,
                                                          defaultValue:
                                                              "Éditeur indisponible"),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10.0),
                                                // Nombre d'épisodes.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages
                                                          .icTvBicolor,
                                                      height: 15.0,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      '${serie.count_of_episodes ?? 0} épisodes',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8.0),
                                                // Date.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages
                                                          .icCalendarBicolor,
                                                      height: 15.0,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      getDefaultTextForEmptyValue(
                                                          serie.start_year,
                                                          defaultValue:
                                                              "Année indisponible"),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                        ),
                        // Onglets.
                        bottom: const TabBar(
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColors.orange,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: [
                            Tab(text: "Histoire"),
                            Tab(text: "Personnages"),
                            Tab(text: "Épisodes"),
                          ],
                          overlayColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                    ],
                    // Contenu des onglets.
                    body: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Container(
                        color: AppColors.cardBackground,
                        child: TabBarView(
                          children: [
                            // Contenu de l'onglet Histoire.
                            _buildStoryTab(),
                            // Contenu de l'onglet Personnages.
                            TabCharacterDetailWidget(
                                character_credits: serie.characters),
                            // Contenu de l'onglet Épisodes.
                            _buildEpisodesTab(serie.id.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Contenu de l'onglet Histoire.
  Widget _buildStoryTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: HistoireDetailWidget(
          content: getDefaultTextForEmptyValue(serie.description,
              defaultValue: "Description indisponible")),
    );
  }

  // Contenu de l'onglet Épisodes.
  Widget _buildEpisodesTab(String serieId) {
    return BlocProvider(
      create: (context) => EpisodesBloc()..add(LoadEpisodesEvent(serieId)),
      child: BlocBuilder<EpisodesBloc, EpisodesState>(
        builder: (context, state) {
          if (state is EpisodesNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EpisodesNotifierLSuccessState) {
            final episodes = state.response.results;

            if (episodes.isEmpty) {
              return const Center(
                child: Text(
                  "Aucun épisode disponible",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                final episode = episodes[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Card(
                    color: AppColors.cardElementBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Image.
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: episode.image?.original_url != null
                                ? Image.network(
                                    episode.image!.original_url!,
                                    width: 126,
                                    height: 105,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      width: 126,
                                      height: 105,
                                      color: Colors.grey[800],
                                      child: const Icon(Icons.tv, color: Colors.white, size: 50),
                                    ),
                                  )
                                : Container(
                                    width: 126,
                                    height: 105,
                                    color: Colors.grey[800],
                                    child: const Icon(Icons.tv, color: Colors.white, size: 50),
                                  ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Numéro de l'épisode.
                                Text(
                                  "Episode #${getDefaultTextForEmptyValue(episode.episode_number)}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // Nom.
                                Text(
                                  getDefaultTextForEmptyValue(episode.name),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 17),
                                // Date.
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppVectorialImages.icCalendarBicolor,
                                      height: 15.0,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.iconsList,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      formatDateDayMonthYear(episode.air_date),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is EpisodesNotifierErrorState) {
            return ErrorDisplayWidget(
              message: 'La récupération de la liste des épisodes a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.',
              onRetry: () { context.read<EpisodesBloc>().add(LoadEpisodesEvent(serieId));},
              title: "Episodes : ",
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
