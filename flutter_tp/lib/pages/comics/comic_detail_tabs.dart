import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/model/comic_api.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/pages/bloc/personsDetail_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/histoire_detail.dart';
import 'package:flutter_tp/widgets/tab_character_detail.dart';

import '../../widgets/error_widget.dart';

// Détail tab de comic
class ComicDetailTabs extends StatelessWidget {
  final Comic comic;

  const ComicDetailTabs({super.key, required this.comic});

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
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Image.network(
                  comic.image!.original_url!,
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
                        // Volume.
                        title: Text(
                          getDefaultTextForEmptyValue(comic.volume?.name,
                              defaultValue: "Volume indisponible"),
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
                                            child: Image.network(
                                              comic.image!.original_url!,
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
                                                // Nom.
                                                Text(
                                                  getDefaultTextForEmptyValue(
                                                      comic.name,
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
                                                //  Numéro du comic.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages
                                                          .icBooksBicolor,
                                                      height: 15.0,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      'N°${getDefaultTextForEmptyValue(comic.issue_number, defaultValue: "Indisponible")}',
                                                      style: const TextStyle(
                                                        color: Colors.white60,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10.0),
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
                                                          formatDateDayMonthYear(
                                                              comic
                                                                  .cover_date)),
                                                      style: const TextStyle(
                                                        color: Colors.white60,
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
                        // Onglets
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
                            Tab(text: "Auteurs"),
                            Tab(text: "Personnages"),
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
                            // Contenu de l'onglet Auteurs.
                            _buildAuthorsTab(),
                            // Contenu de l'onglet Personnages.
                            TabCharacterDetailWidget(
                                character_credits: comic.character_credits),
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
          content: getDefaultTextForEmptyValue(comic.description,
              defaultValue: "Description indisponible")),
    );
  }

  // Contenu de l'onglet Auteur.
  Widget _buildAuthorsTab() {
    return ListView.builder(
      itemCount: comic.person_credits?.length,
      itemBuilder: (context, index) {
        final personId = comic.person_credits?[index]?.id;

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
                    // Image.
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(person.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.broken_image_rounded),
                    ),
                    // Nom.
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(person.name,
                            defaultValue: "Nom indisponible")),
                    // Rôle.
                    subtitle: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(
                            comic.person_credits?[index]?.role,
                            defaultValue: "Rôle indisponible")),
                  );
                } else if (state is CharacterDetailNotifierErrorState) {
                  return ErrorDisplayWidget(
                    message:
                        'La récupération de l\'auteur a échoué. Veuillez réessayer après avoir vérifié votre connexion internet.',
                    onRetry: () {
                      context
                          .read<PersonDetailBloc>()
                          .add(LoadPersonDetailEvent());
                    },
                    title: "Auteur : ",
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ));
      },
    );
  }
}
