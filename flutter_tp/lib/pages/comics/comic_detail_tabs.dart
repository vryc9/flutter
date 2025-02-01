import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/res/app_svg.dart';
import 'package:flutter_tp/utils/date_format.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';

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
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
            getDefaultTextForEmptyValue(comic.name, defaultValue: "Nom indisponible"), 
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          comic.image!.original_url!,
                          height: 127,
                          width: 94.87, 
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
                      ],
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 191,
                          child: Text(
                            getDefaultTextForEmptyValue(comic.volume?.name, defaultValue: "Volume indisponible"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: 191,
                          child: Text(
                            getDefaultTextForEmptyValue(comic.name, defaultValue: "Nom indisponible"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 22.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppVectorialImages.icBooksBicolor,
                              height: 15.0,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.iconsList, BlendMode.srcIn),
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
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppVectorialImages.icCalendarBicolor,
                              height: 15.0,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.iconsList, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              getDefaultTextForEmptyValue(formatDateDayMonthYear(comic.cover_date)),
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottom: const TabBar(
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
              Tab(text: "Personnages")
            ],
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
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
            Positioned.fill(
              child: Container(
                color: AppColors.screenBackground.withOpacity(0.7),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: kToolbarHeight + kTextTabBarHeight),
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
                          _buildStoryTab(),
                          _buildAuthorsTab(),
                          _buildCharactersTab(),
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
