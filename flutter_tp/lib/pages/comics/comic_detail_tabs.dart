import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';
import 'package:flutter_tp/widgets/header_detail.dart';

import '../../model/comic_api.dart';
import '../../widgets/histoire_detail.dart';
import '../bloc/charactersDetail_bloc.dart';

class ComicDetailTabs extends StatelessWidget {
  final Comic comic;

  const ComicDetailTabs({super.key, required this.comic});

  @override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
        HeaderWidget(
          title: getDefaultTextForEmptyValue(comic.name, defaultValue: "Nom indisponible"),
        ),

        Padding(
          padding: const EdgeInsets.all(12.0), 
          child: Container(
          
            color: AppColors.screenBackground, // Background color (customize as needed)
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25, // 1/4 of screen width
                  height: 250, // Fixed height (adjustable)
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    image: DecorationImage(
                      image: NetworkImage(comic.image!.original_url!), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppVectorialImages.icBooksBicolor,
                            height: 15.0,
                            colorFilter: const ColorFilter.mode(
                                AppColors.bottomBarTextUnselected, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'N°${comic.issue_number ?? 'Non défini'}',
                            style: const TextStyle(
                              color: AppColors.bottomBarTextUnselected,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4), // Space between texts
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppVectorialImages.icCalendarBicolor,
                            height: 15.0,
                            colorFilter: const ColorFilter.mode(
                                AppColors.bottomBarTextUnselected, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            formatDateMonthYear(comic.cover_date),
                            style: const TextStyle(
                              color: AppColors.bottomBarTextUnselected,
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
          ),  
        ),
        
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Histoire"),
                  Tab(text: "Auteurs"),
                  Tab(text: "Personnages"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildStoryTab(),
                _buildAuthorsTab(),
                _buildCharactersTab(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildStoryTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: HistoireDetailWidget(
          content: getDefaultTextForEmptyValue(comic.description,
              defaultValue: "Description indisponible")),
    );
  }

  Widget _buildAuthorsTab() {
    return ListView.builder(
      itemCount: comic.person_credits?.length,
      itemBuilder: (context, index) {
        final personId = comic.person_credits?[index]?.id;

        // Déclenche le chargement d'un personnage si nécessaire
        return BlocProvider(
            create: (context) => CharacterDetailBloc(personId.toString()),
            child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
              builder: (context, state) {
                if (state is CharacterDetailNotifierLoadingState) {
                  return const ListTile(
                    leading: CircularProgressIndicator(),
                    title: Text('Chargement...'),
                  );
                } else if (state is CharacterDetailNotifierSuccessState) {
                  final character = state.character!;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(character.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.broken_image_rounded),
                    ),
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible")),
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

    return ListView.builder(
      itemCount: comic.person_credits?.length,
      itemBuilder: (context, index) {
        final author = comic.person_credits?[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(author!.image!.icon_url!),
          ),
          title: Text(author.name!),
          //subtitle: Text(author.role),
        );
      },
    );
  }

  Widget _buildCharactersTab() {
    return ListView.builder(
      itemCount: comic.character_credits?.length,
      itemBuilder: (context, index) {
        final characterId = comic.character_credits?[index]?.id;

        // Déclenche le chargement d'un personnage si nécessaire
        return BlocProvider(
            create: (context) => CharacterDetailBloc(characterId.toString()),
            child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
              builder: (context, state) {
                if (state is CharacterDetailNotifierLoadingState) {
                  return const ListTile(
                    leading: CircularProgressIndicator(),
                    title: Text('Chargement...'),
                  );
                } else if (state is CharacterDetailNotifierSuccessState) {
                  final character = state.character!;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(character.image!.thumb_url!),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.broken_image_rounded),
                    ),
                    title: Text(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        getDefaultTextForEmptyValue(character.name, defaultValue: "Nom indisponible")),
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
}
