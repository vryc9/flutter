import 'package:flutter/material.dart';
import 'package:flutter_tp/api/model/character.dart';
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
      body: FutureBuilder<Character?>(
        future: characterId.isNotEmpty ? api.fetchCharacterById(characterId) : null,
        builder: (context, AsyncSnapshot<Character?> snapshot) {
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
                  if (character.image != null)
                    Center(
                      child: Image.network(
                        character.image!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    character.name ?? "Nom inconnu",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Alias : ${character.aliases ?? "Non spécifié"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Éditeur : ${character.publisher ?? "Inconnu"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Description :\n${character.description ?? "Pas de description disponible."}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  if (character.birth != null)
                    Text(
                      "Date de naissance : ${character.birth}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 8),
                  if (character.firstAppearedInIssue != null)
                    Text(
                      "Première apparition : ${character.firstAppearedInIssue}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 8),
                  if (character.powers != null && character.powers!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pouvoirs :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...character.powers!.map((power) => Text("• $power")),
                      ],
                    ),
                ],
              ),
            );
          }
        },
      ),

    );
  }
}
