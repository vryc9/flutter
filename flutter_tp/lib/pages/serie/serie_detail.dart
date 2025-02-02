import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/pages/bloc/episodes_bloc.dart';
import 'package:flutter_tp/pages/bloc/personsDetail_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/error_widget.dart';
import 'package:flutter_tp/widgets/tab_character_detail.dart';

import '../../model/serie_api.dart';
import '../../widgets/histoire_detail.dart';
import '../bloc/charactersDetail_bloc.dart';

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
            Positioned.fill(
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
                        leading: IconButton(
                          icon: SvgPicture.asset(
                            AppVectorialImages.icBack,
                            height: 24.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
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
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: Image.network(
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
                                                Text(
                                                  getDefaultTextForEmptyValue(
                                                      serie.name,
                                                      defaultValue:
                                                          "Nom indisponible"),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 22.0),
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
                            Tab(text: "Episodes"),
                          ],
                          overlayColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                    ],
                    body: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Container(
                        color: AppColors.cardBackground,
                        child: TabBarView(
                          children: [
                            _buildStoryTab(),
                            TabCharacterDetailWidget(
                                character_credits: serie.characters),
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

  Widget _buildStoryTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: HistoireDetailWidget(
          content: getDefaultTextForEmptyValue(serie.description,
              defaultValue: "Description indisponible")),
    );
  }

  Widget _buildAuthorsTab() {
    return ListView.builder(
      itemCount: serie.characters?.length,
      itemBuilder: (context, index) {
        final personId = serie.characters?[index]?.id;

        return BlocProvider(
            create: (context) => PersonDetailBloc(personId.toString()),
            child: BlocBuilder<PersonDetailBloc, PersonDetailState>(
              builder: (context, state) {
                if (state is PersonDetailNotifierLoadingState) {
                  return const ListTile(
                    leading: CircularProgressIndicator(),
                    title: Text('Chargement...'),
                  );
                } else if (state is PersonDetailNotifierSuccessState) {
                  final person = state.person!;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(person.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.broken_image_rounded),
                    ),
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(person.name,
                            defaultValue: "Nom indisponible")),
                    subtitle: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(
                            serie.characters?[index]?.aliases,
                            defaultValue: "Rôle indisponible")),
                  );
                } else if (state is CharacterDetailNotifierErrorState) {
                  return const ListTile(
                    leading: Icon(Icons.error),
                    title: Text('Erreur de chargement'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ));
      },
    );
  }

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
                                      child: Icon(Icons.tv,
                                          color: Colors.white, size: 50),
                                    ),
                                  )
                                : Container(
                                    width: 126,
                                    height: 105,
                                    color: Colors.grey[800],
                                    child: Icon(Icons.tv,
                                        color: Colors.white, size: 50),
                                  ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getDefaultTextForEmptyValue(
                                      "Episode #${episode.episode_number}"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  getDefaultTextForEmptyValue(episode.name),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 17),
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
                                      style: TextStyle(
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
              message:
                  'La récupération de la liste des séries a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.',
              onRetry: () {
                context.read<EpisodesBloc>().add(LoadEpisodesEvent(serieId));
              },
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
