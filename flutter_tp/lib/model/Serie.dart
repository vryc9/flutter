class Series {
  final List<String>? aliases; // Liste des alias de la série
  final String? apiDetailUrl; // URL pour accéder aux détails de la série
  final List<String>?
      characterCredits; // Liste des personnages apparaissant dans la série
  final int? countOfEpisodes; // Nombre d'épisodes
  final DateTime? dateAdded; // Date d'ajout de la série
  final DateTime? dateLastUpdated; // Date de la dernière mise à jour
  final String? deck; // Résumé bref de la série
  final String description; // Description complète de la série
  final String? firstEpisode; // Le premier épisode de la série
  final String id; // Identifiant unique de la série
  final String? image; // Image principale de la série
  final String? lastEpisode; // Le dernier épisode de la série
  final List<String>?
      locationCredits; // Liste des lieux apparaissant dans la série
  final String name; // Nom de la série
  final String? publisher; // Éditeur principal de la série
  final String? siteDetailUrl; // URL pointant vers la série sur Giant Bomb
  final int? startYear; // Première année de la série

  Series({
    this.aliases,
    this.apiDetailUrl,
    this.characterCredits,
    this.countOfEpisodes,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    required this.description,
    this.firstEpisode,
    required this.id,
    this.image,
    this.lastEpisode,
    this.locationCredits,
    required this.name,
    this.publisher,
    this.siteDetailUrl,
    this.startYear,
  });
}
