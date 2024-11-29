class ComicIssue {
  final String? aliases; // Alias de l'issue (séparés par des \n)
  final String? apiDetailUrl; // URL vers les détails de l'issue
  final List<String>? characterCredits; // Liste des personnages présents
  final List<String>? charactersDiedIn; // Personnages morts dans l'issue
  final List<String>? conceptCredits; // Concepts présents
  final DateTime? coverDate; // Date de publication sur la couverture
  final DateTime? dateAdded; // Date d'ajout de l'issue
  final DateTime? dateLastUpdated; // Date de dernière mise à jour
  final String? deck; // Résumé bref de l'issue
  final String description; // Description détaillée
  final List<String>? disbandedTeams; // Équipes dissoutes dans l'issue
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
  final bool? hasStaffReview; // Indique si l'issue a une critique officielle
  final String id; // ID unique de l'issue
  final String? image; // Image principale de l'issue
  final String? issueNumber; // Numéro de l'issue
  final List<String>? locationCredits; // Lieux présents dans l'issue
  final String name; // Nom de l'issue
  final List<String>? objectCredits; // Objets présents dans l'issue
  final List<String>? personCredits; // Personnes ayant travaillé sur l'issue
  final String? siteDetailUrl; // URL des détails sur Giant Bomb
  final DateTime? storeDate; // Date de sortie en magasin
  final List<String>? storyArcCredits; // Arcs narratifs présents dans l'issue
  final List<String>? teamCredits; // Équipes présentes dans l'issue
  final List<String>? teamsDisbandedIn; // Équipes dissoutes dans l'issue
  final String? volume; // Volume auquel appartient l'issue

  ComicIssue({
    this.aliases,
    this.apiDetailUrl,
    this.characterCredits,
    this.charactersDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    required this.description,
    this.disbandedTeams,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryArcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    required this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    required this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamsDisbandedIn,
    this.volume,
  });
}
