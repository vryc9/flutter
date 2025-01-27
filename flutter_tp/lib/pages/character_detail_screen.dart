import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/pages/bloc/charactersDetail_bloc.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/widgets/error_widget.dart';
import 'package:flutter_tp/widgets/header_detail.dart';
import 'package:flutter_tp/widgets/histoire_detail.dart';

class CharacterDetailScreen extends StatelessWidget {

  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final characterId = args['characterId'];

    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: BlocProvider(
        create: (context) => CharacterDetailBloc(characterId),
        child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
          builder: (context, state) {
            if (state is CharacterDetailNotifierLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterDetailNotifierSuccessState) {
              final character = state.character!;

              return DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Positioned.fill(
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
                    Positioned.fill(
                      child: Container(
                        color: AppColors.screenBackground.withOpacity(0.7),
                      ),
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Stack(
                            children: [
                              HeaderWidget(title: character.name ?? "Inconnu"),
                            ],
                          ),
                        ),

                        SliverFillRemaining(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        blurRadius: 16,
                                        spreadRadius: 4,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
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
                                      Tab(text: "Histoire",),
                                      Tab(text: "Infos"),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Container(
                                      color: AppColors.cardBackground,
                                      child: TabBarView(
                                        children: [
                                          HistoireDetailWidget(content: character.description ?? "Histoire inconnue"),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: SingleChildScrollView(
                                              child: Table(
                                                border: TableBorder.all(color: Colors.transparent),
                                                children: [
                                                  _buildTableRow(
                                                    "Nom de super-héros",
                                                    (character.name != null && character.name!.isNotEmpty)
                                                        ? character.name!
                                                        : "Inconnu",
                                                  ),
                                                  _buildTableRow(
                                                    "Nom réel",
                                                    (character.real_name != null && character.real_name!.isNotEmpty)
                                                        ? character.real_name!
                                                        : "Inconnu",
                                                  ),
                                                  _buildTableRow(
                                                    "Alias",
                                                    (character.aliases != null && character.aliases!.isNotEmpty)
                                                        ? character.aliases!
                                                        : "Inconnu",
                                                  ),
                                                  _buildTableRow(
                                                    "Éditeur",
                                                    (character.publisher != null &&
                                                            character.publisher!.name != null &&
                                                            character.publisher!.name!.isNotEmpty)
                                                        ? character.publisher!.name!
                                                        : "Inconnu",
                                                  ),
                                                  _buildTableRow(
                                                    "Créateurs",
                                                      (character.creators != null && character.creators!.isNotEmpty)
                                                          ? character.creators!.map((creator) => creator.name).join(", ")
                                                          : "Inconnus",
                                                  ),
                                                  _buildTableRow(
                                                    "Genre",
                                                    (character.gender != null && character.gender! == 1)
                                                        ? "Masculin"
                                                        : "Feminin",
                                                  ),
                                                  _buildTableRow(
                                                    "Date de naissance", formatDateDayMonthYear(character.birth),
                                                  ),
                                                  _buildTableRow(
                                                    "Mort dans",
                                                      (character.issues_died_in != null && character.issues_died_in!.isNotEmpty)
                                                          ? character.issues_died_in!.map((issue) => issue.name).join(", ")
                                                          : "N/A",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              );
            } else if (state is CharacterDetailNotifierErrorState) {
              return ErrorDisplayWidget(
                message: 'La récupération du personnage a échoué. Veuillez réessayer.', 
                onRetry: () { context.read<CharacterDetailBloc>().add(LoadCharacterDetailEvent()); },
                title: "Personnage : ",
              );
            }
            return const Center(
              child: Text('Aucune donnée disponible.'),
            );
          },
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
