import 'package:flutter/material.dart';
import 'package:flutter_tp/api/model/character.dart';
import 'package:flutter_tp/api/services/off_api.dart';

class CharacterDetailScreenCopy extends StatelessWidget {
  final String characterId;

  const CharacterDetailScreenCopy({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OFFAPIManager api = OFFAPIManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du Personnage"),
      ),
      body: FutureBuilder<OFFServerResponseSearchCharacter?>(
        future: characterId.isNotEmpty ? api.searchCharacter("butcher") : null,
        builder: (context, AsyncSnapshot<OFFServerResponseSearchCharacter?> snapshot) {
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
                  const SizedBox(height: 16),
                  Text(
                    character.results[0].name ?? "Nom inconnu",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Alias : ${character.results[0].aliases ?? "Non spécifié"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Éditeur : ${character.results[0].publisher ?? "Inconnu"}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Description :\n${character.results[0].description ?? "Pas de description disponible."}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  if (character.results[0].birth != null)
                    Text(
                      "Date de naissance : ${character.results[0].birth}",
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
