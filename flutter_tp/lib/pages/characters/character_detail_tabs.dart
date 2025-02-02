import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';

import '../../model/character_api.dart';
import '../../widgets/histoire_detail.dart';

// Détail tab de character.
class CharacterDetailTabs extends StatelessWidget {
  final Character character;

  const CharacterDetailTabs({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Bouton retour vers la page précédente.
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
            getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible"), 
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kTextTabBarHeight),
            // Opacité derrière les onglets.
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 6,
                  ),
                ],
              ),
              // Onglets.
              child: const TabBar(
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
                  Tab(text: "Infos"),
                ],
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              // Image en fond avec broken_image en cas de problème.
              child: Image.network(
                character.image!.original_url!,
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
            // Filtre sombre par dessus l'image.
            Positioned.fill(
              child: Container(
                color: AppColors.screenBackground.withOpacity(0.7),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: kToolbarHeight + kTextTabBarHeight),
                Expanded(
                  // Contenu de onglets.
                  child: ClipRRect(
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
                          // Contenu de l'onglet Infos.
                          _buildInfoTab(),
                        ],
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
          content: getDefaultTextForEmptyValue(character.description,
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
              "Nom de super-héros",
              getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible")
            ),
            _buildTableRow(
              "Nom réel",
              getDefaultTextForEmptyValue(character.real_name, defaultValue: "Nom réel indisponible")
            ),
            _buildTableRow(
              "Alias",
              getDefaultTextForEmptyValue(character.aliases, defaultValue: "Alias indisponible")
            ),
            _buildTableRow(
              "Éditeur",
              getDefaultTextForEmptyValue(character.publisher?.name, defaultValue: "Éditeur indisponible")
            ),
            // Créateurs : on récupère le nom de chaque créateurs pour les afficher dans la 2ème colonne du tableau.
            _buildTableRow(
              "Créateurs",
                (character.creators != null && character.creators!.isNotEmpty)
                    ? character.creators!.map((creator) => creator.name).join(", ")
                    : "Inconnus",
            ),
            // Genre : Homme = 1, Femme = 2.
            _buildTableRow(
              "Genre",
              (character.gender != null && character.gender! == 1)
                  ? "Masculin"
                  : "Feminin",
            ),
            _buildTableRow(
              "Date de naissance", getDefaultTextForEmptyValue(formatDateDayMonthYear(character.birth)),
            ),
            // Décès : on récupère le nom de chaque comic dans lequel le personnage est mort.
            _buildTableRow(
              "Décès",
                (character.issues_died_in != null && character.issues_died_in!.isNotEmpty)
                    ? character.issues_died_in!.map((issue) => issue.name).join(", ")
                    : "N/A",
            ),
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
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
