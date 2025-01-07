import 'package:flutter/material.dart';
import 'package:flutter_tp/api/model/character.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OFFAPIManager api = OFFAPIManager(); // Instanciation du service API

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Personnages"),
      ),
      body: FutureBuilder<List<Character>>(
        future: api.fetchCharacters(), // Appelle une méthode pour récupérer tous les personnages
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur : ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Aucun personnage trouvé.",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: character.image != null
                        ? Image.network(
                            character.image!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.person),
                    title: Text(character.name ?? "Nom inconnu"),
                    subtitle: Text(character.publisher ?? "Éditeur inconnu"),
                    onTap: () {
                      // Navigation vers l'écran des détails du personnage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterDetailScreen(characterId: character.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
