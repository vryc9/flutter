class Episode {
  final String? aliases; // Alias de l'épisode (séparés par \n)
  final String? apiDetailUrl; // URL vers les détails de l'épisode
  final List<String>? characterCredits; // Liste des personnages présents
  final List<String>? charactersDiedIn; // Liste des personnages morts
  final List<String>? conceptCredits; // Concepts présents dans l'épisode
  final DateTime? airDate; // Date de diffusion de l'épisode
  final DateTime? dateAdded; // Date d'ajout de l'épisode
  final DateTime? dateLastUpdated; // Date de dernière mise à jour de l'épisode
  final String? deck; // Résumé bref de l'épisode
  final String description; // Description détaillée de l'épisode
  final List<String>?
      firstAppearanceCharacters; // Premières apparitions des personnages
  final List<String>?
      firstAppearanceConcepts; // Premières apparitions des concepts
  final List<String>?
      firstAppearanceLocations; // Premières apparitions des lieux
  final List<String>?
      firstAppearanceObjects; // Premières apparitions des objets
  final List<String>?
      firstAppearanceStoryArcs; // Premières apparitions des arcs narratifs
  final List<String>? firstAppearanceTeams; // Premières apparitions des équipes
  final bool? hasStaffReview; // Indique si l'épisode a une critique officielle
  final String id; // ID unique de l'épisode
  final String? image; // Image principale de l'épisode
  final int? episodeNumber; // Numéro de l'épisode dans la série
  final List<String>? locationCredits; // Lieux présents dans l'épisode
  final String name; // Nom de l'épisode
  final List<String>? objectCredits; // Objets présents dans l'épisode
  final List<String>? personCredits; // Personnes ayant travaillé sur l'épisode
  final String? siteDetailUrl; // URL vers les détails sur Giant Bomb
  final List<String>? storyArcCredits; // Arcs narratifs présents dans l'épisode
  final List<String>? teamCredits; // Équipes présentes dans l'épisode
  final String? series; // Série à laquelle appartient l'épisode

  // TODO Faire le lien avec les séries
  Episode({
    this.aliases,
    this.apiDetailUrl,
    this.characterCredits,
    this.charactersDiedIn,
    this.conceptCredits,
    this.airDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    required this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryArcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    required this.id,
    this.image,
    this.episodeNumber,
    this.locationCredits,
    required this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storyArcCredits,
    this.teamCredits,
    this.series,
  });
}
