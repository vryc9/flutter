import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/tab_character_detail.dart';

import '../../model/movie_api.dart';
import '../../widgets/histoire_detail.dart';

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
            Positioned.fill(
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
                                                      '${getDefaultTextForEmptyValue(movie.rating, defaultValue: "Indisponible")} minutes',
                                                      style: const TextStyle(
                                                        color: Colors.white60,
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
                                                              movie
                                                                  .date_added)),
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
                                character_credits: movie.characters),
                            _buildAuthorsTab(),
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
          content: getDefaultTextForEmptyValue(movie.description,
              defaultValue: "Description indisponible")),
    );
  }

  Widget _buildAuthorsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(color: Colors.transparent),
          children: [
            _buildTableRow(
                "Classification",
                getDefaultTextForEmptyValue(movie.rating,
                    defaultValue: "Classification indisponible")),
            _buildTableRow(
                "Réalisateur",
                getDefaultTextForEmptyValue(
                    movie.writers
                            ?.where((person) => person.role == "realisateur")
                            .map((person) => person.name)
                            .firstOrNull ??
                        "",
                    defaultValue: "Réalisateur indisponible")),
            _buildTableRow(
                "Scénaristes",
                (movie.writers != null && movie.writers!.isNotEmpty)
                    ? movie.writers!
                        .where((person) => person.role == "scenariste")
                        .map((creator) => creator.name)
                        .join(", ")
                    : "Inconnus"),
            _buildTableRow(
                "Producteurs",
                (movie.writers != null && movie.writers!.isNotEmpty)
                    ? movie.writers!
                        .where((person) => person.role == "producteur")
                        .map((creator) => creator.name)
                        .join(", ")
                    : "Inconnus"),
            _buildTableRow(
                "Studios",
                (movie.studios != null && movie.studios!.isNotEmpty)
                    ? movie.studios!.map((studio) => studio.name).join(", ")
                    : "Inconnus"),
            _buildTableRow(
                "Budget",
                getDefaultTextForEmptyValue(movie.budget,
                    defaultValue: "Budget indisponible")),
            _buildTableRow(
                "Recettes au box-office",
                getDefaultTextForEmptyValue(movie.box_office_revenue,
                    defaultValue: "Recette indisponible")),
            _buildTableRow(
                "Recettes brutes totales",
                getDefaultTextForEmptyValue(movie.total_revenue,
                    defaultValue: "Recette indisponible")),
          ],
        ),
      ),
    );
  }

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
