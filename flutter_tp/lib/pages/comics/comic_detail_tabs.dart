import 'package:flutter/material.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';

import '../../model/comic_api.dart';

class ComicDetailTabs extends StatelessWidget {
  final Comic comic;

  const ComicDetailTabs({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(text: 'Histoire'),
            Tab(text: 'Auteurs'),
            Tab(text: 'Personnages'),
          ]),
          Expanded(
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(getDefaultTextForEmptyValue(comic.description,
                    defaultValue: "Aucune description trouvé.")),
              ),
              ListView(
                children: comic.person_credits!.isNotEmpty
                    ? comic.person_credits!
                        .map((author) => ListTile(title: Text(author!.name)))
                        .toList()
                    : [Text('Aucun auteur trouvé.')],
              ),
              ListView(
                children: comic.character_credits!.isNotEmpty
                    ? comic.character_credits!
                        .map((character) =>
                            ListTile(title: Text(character!.name!)))
                        .toList()
                    : [Text('Aucun personnage trouvé.')],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
