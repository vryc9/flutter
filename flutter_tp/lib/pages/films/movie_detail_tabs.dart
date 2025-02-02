import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/model/movie_api.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/histoire_detail.dart';
import 'package:flutter_tp/widgets/tab_character_detail.dart';

// Détail tab de movie.
class MovieDetailTabs extends StatelessWidget {
  final Movie movie;

  const MovieDetailTabs({super.key, required this.movie});

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
                  movie.image!.original_url!,
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
                          getDefaultTextForEmptyValue(movie.name,
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
                                            child: Image.network(
                                              movie.image!.original_url!,
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
                                                const SizedBox(height: 22.0),
                                                // Durée.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages.navbarMovies,
                                                      height: 12.0,
                                                      colorFilter: const ColorFilter.mode(
                                                          Colors.white, BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      '${getDefaultTextForEmptyValue(movie.runtime, defaultValue: "Durée indisponible")} minutes',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 7.6),
                                                // Date.
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppVectorialImages.icCalendarBicolor,
                                                      height: 15.0,
                                                      colorFilter: const ColorFilter.mode(
                                                          Colors.white, BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      getDefaultTextForEmptyValue(formatDateYear(movie.date_added)),
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
                            Tab(text: "Synopsis"),
                            Tab(text: "Personnages"),
                            Tab(text: "Infos"),
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
                                character_credits: movie.characters),
                            // Contenu de l'onglet Infos.
                            _buildInfoTab(),
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
          content: getDefaultTextForEmptyValue(movie.description,
              defaultValue: "Description indisponible")),
    );
  }

  // Contenu de l'onglet Infos.
  Widget _buildInfoTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Cet onglet est un tableau. Chaque ligne est construite par _buildTableRow à qui on donne le contenu de chaque colonne.
        child: Table(
          border: TableBorder.all(color: Colors.transparent),
          children: [
            _buildTableRow(
                "Classification",
                getDefaultTextForEmptyValue(movie.rating,
                    defaultValue: "Classification indisponible")),
            _buildTableRow(
                "Réalisateur",
                getDefaultTextForEmptyValue(movie.distributor,
                    defaultValue: "Réalisateur indisponible")),
            // Scénaristes : on récupère le nom de chaque scénaristes pour les afficher dans la 2ème colonne du tableau.
            _buildTableRow(
                "Scénaristes",
                (movie.writers != null && movie.writers!.isNotEmpty)
                    ? movie.writers!
                        .map((writers) => writers.name)
                        .join(", ")
                    : "Inconnus"),
            // Producteurs : on récupère le nom de chaque producteurs pour les afficher dans la 2ème colonne du tableau.
            _buildTableRow(
                "Producteurs",
                (movie.producers != null && movie.producers!.isNotEmpty)
                    ? movie.producers!
                        .map((producers) => producers.name)
                        .join(", ")
                    : "Inconnus"),
            // Studios : on récupère le nom de chaque studios pour les afficher dans la 2ème colonne du tableau.
            _buildTableRow(
                "Studios",
                (movie.studios != null && movie.studios!.isNotEmpty)
                    ? movie.studios!.map((studio) => studio.name).join(", ")
                    : "Inconnus"),
            _buildTableRow(
                "Budget",
                formatMoney(movie.budget)),
            _buildTableRow(
                "Recettes au box-office",
                formatMoney(movie.box_office_revenue)),
            _buildTableRow(
                "Recettes brutes totales",
                formatMoney(movie.total_revenue)),
          ],
        ),
      ),
    );
  }

  // construit une ligne de tableau à 2 colonne.
  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
