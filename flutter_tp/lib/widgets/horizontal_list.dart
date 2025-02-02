import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tp/res/app_colors.dart';
import 'package:flutter_tp/utils/text_formatter_utils.dart';

// Widget de liste horizontale (accueil et recherche).
class HorizontalListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  // Peut être 'character', 'comic', 'movie', 'serie'
  final String type;
  // Peut être 'home', 'search'
  final String page;

  const HorizontalListWidget({
    super.key,
    required this.title,
    required this.items,
    required this.type,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Si on est sur la page home et que le type passé n'est pas character, on affiche le bouton voir plus et on le relie à la bonne liste en fonction du type.
                if (page == 'home' && type != "character")
                  TextButton(
                    onPressed: () {
                      switch (type) {
                        case 'comic':
                          Navigator.pushNamed(
                            context,
                            '/comicList',
                            arguments: {
                              'type': "comic",
                            },
                          );
                          break;
                        case 'movie':
                          Navigator.pushNamed(
                            context,
                            '/movieList',
                            arguments: {
                              'type': "movie",
                            },
                          );
                          break;
                        case 'serie':
                          Navigator.pushNamed(
                            context,
                            '/serieList',
                            arguments: {
                              'type': "serie",
                            },
                          );
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Type inconnu pour le bouton Voir plus'),
                            ),
                          );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.seeMoreBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Voir plus",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: page == 'home' ? min(items.length, 5) : items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  // On relie le clic sur la card en fonction du type passé pourqu'il renvoie sur le bon écran de détail.
                  switch (type) {
                    case 'character':
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/characterDetail',
                            arguments: {
                              'itemId': item.id.toString(),
                            },
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'comic':
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/comicDetail',
                            arguments: {
                              'itemId': item.id.toString(),
                            },
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'movie':
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/movieDetail',
                            arguments: {
                              'itemId': item.id.toString(),
                            },
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'serie':
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/serieDetail',
                            arguments: {
                              'itemId': item.id.toString(),
                            },
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    default:
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Type inconnu: ${item.name}')),
                          );
                        },
                        child: _buildCard(context, item),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, dynamic item) {
    return Container(
      width: 180,
      height: 270,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: AppColors.cardElementBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image avec broken_image si erreur.
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                item.image.original_url!,
                height: 178,
                width: 180,
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
            const SizedBox(height: 12),
            // Nom.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                getDefaultTextForEmptyValue(item.name, defaultValue: "Nom indisponible"),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
