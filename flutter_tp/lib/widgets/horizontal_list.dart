import 'package:flutter/material.dart';
import 'package:flutter_tp/res/app_colors.dart';

class HorizontalListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  // Peut être 'character', 'comic', 'movie', 'serie'
  final String type;

  const HorizontalListWidget({
    Key? key,
    required this.title,
    required this.items,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  switch (type) {
                    case 'character':
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/characterDetail',
                            arguments: {
                              'characterId': item.id.toString(),
                            },
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'comic':
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Comic sélectionné: ${item.name}')),
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'movie':
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Film sélectionné: ${item.name}')),
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    case 'serie':
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Série sélectionnée: ${item.name}')),
                          );
                        },
                        child: _buildCard(context, item),
                      );
                    default:
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Type inconnu: ${item.name}')),
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

  // Fonction pour construire la carte (extraction de la logique de carte dans une fonction séparée)
  Widget _buildCard(BuildContext context, dynamic item) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: AppColors.cardElementBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                item.image.screen_large_url!,
                height: 150,
                width: double.infinity,
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.name ?? "Nom inconnu",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
