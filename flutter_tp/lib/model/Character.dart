class Character {
  final String? aliases; // Alias du personnage (séparés par \n)
  final String? apiDetailUrl; // URL vers les détails du personnage
  final DateTime? birth; // Date de naissance (si disponible, sinon null)
  final List<String>? characterEnemies; // Liste des ennemis du personnage
  final List<String>? characterFriends; // Liste des amis du personnage
  final int?
      countOfIssueAppearances; // Nombre d'apparitions dans les numéros de comics
  final List<String>? creators; // Liste des créateurs du personnage
  final DateTime? dateAdded; // Date d'ajout du personnage
  final DateTime? dateLastUpdated; // Date de dernière mise à jour
  final String? deck; // Résumé bref du personnage
  final String? description; // Description complète du personnage
  final String?
      firstAppearedInIssue; // Premier numéro où le personnage apparaît
  final String? gender; // Sexe (Male, Female, Other)
  final String id; // ID unique du personnage
  final String? image; // Image principale du personnage
  final List<String>?
      issueCredits; // Liste des numéros où le personnage apparaît
  final List<String>? issuesDiedIn; // Liste des numéros où le personnage meurt
  final List<String>? movies; // Films où apparaît le personnage
  final String? name; // Nom du personnage
  final String? origin; // Origine (ex: Humain, Alien, Robot, etc.)
  final List<String>? powers; // Liste des pouvoirs du personnage
  final String? publisher; // Éditeur principal du personnage
  final String? realName; // Nom réel du personnage
  final String? siteDetailUrl; // URL vers les détails sur Giant Bomb
  final List<String>?
      storyArcCredits; // Arcs narratifs où le personnage apparaît
  final List<String>? teamEnemies; // Équipes ennemies du personnage
  final List<String>? teamFriends; // Équipes alliées du personnage
  final List<String>? teams; // Équipes dont le personnage fait partie
  final List<String>? volumeCredits; // Volumes où le personnage apparaît

  Character({
    this.aliases,
    this.apiDetailUrl,
    this.birth,
    this.characterEnemies,
    this.characterFriends,
    this.countOfIssueAppearances,
    this.creators,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearedInIssue,
    this.gender,
    required this.id,
    this.image,
    this.issueCredits,
    this.issuesDiedIn,
    this.movies,
    this.name,
    this.origin,
    this.powers,
    this.publisher,
    this.realName,
    this.siteDetailUrl,
    this.storyArcCredits,
    this.teamEnemies,
    this.teamFriends,
    this.teams,
    this.volumeCredits,
  });
}
