import 'package:flutter/material.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';

class CharacterDetailScreen extends StatelessWidget {
  final String characterId;

  const CharacterDetailScreen({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OFFAPIManager api = OFFAPIManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du Personnage"),
      ),
      body: FutureBuilder<OFFServerResponseCharacter?>(
        future: characterId.isNotEmpty ? api.fetchCharacterById(characterId) : null,
        builder: (context, AsyncSnapshot<OFFServerResponseCharacter?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur : ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                "Personnage introuvable.",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            final character = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Affichage de l'image si elle est disponible
                  if (character.results.image != null)
                    Center(
                      child: Image.network(
                        character.results.image!.screen_large_url,
                        height: 200, // Hauteur personnalisée
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  // Nom du personnage
                  Text(
                    character.results.name ?? "Nom inconnu",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.results.issues_died_in!.firstOrNull!.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Alias
                  Text(
                    "Alias : ${character.results.aliases ?? "Non spécifié"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  // Éditeur
                  Text(
                    "Éditeur : ${character.results.publisher!.name ?? "Inconnu"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    "Description :\n${character.results.description ?? "Pas de description disponible."}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Date de naissance
                  if (character.results.birth != null)
                    Text(
                      "Date de naissance : ${character.results.birth}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}