class Movie {
  final String? apiDetailUrl; // URL pour accéder aux détails du film
  final int? boxOfficeRevenue; // Revenus au box-office
  final int? budget; // Budget du film
  final List<String>? characters; // Personnages liés au film
  final List<String>? concepts; // Concepts liés au film
  final DateTime? dateAdded; // Date d'ajout du film
  final DateTime? dateLastUpdated; // Date de dernière mise à jour
  final String? deck; // Résumé bref du film
  final String description; // Description détaillée
  final String? distributor; // Distributeur du film
  final bool? hasStaffReview; // Indique si le film a une critique officielle
  final String id; // Identifiant unique du film
  final String? image; // Image principale du film
  final List<String>? locations; // Lieux liés au film
  final String name; // Nom du film
  final List<String>? producers; // Producteurs du film
  final double? rating; // Note/Évaluation du film
  final DateTime? releaseDate; // Date de sortie
  final int? runtime; // Durée du film (en minutes)
  final String? siteDetailUrl; // URL des détails du film sur Giant Bomb
  final List<String>? studios; // Studios liés au film
  final List<String>? teams; // Équipes associées au film
  final List<String>? things; // Objets trouvés dans le film
  final int? totalRevenue; // Revenus totaux générés
  final List<String>? writers; // Scénaristes du film

  Movie({
    this.apiDetailUrl,
    this.boxOfficeRevenue,
    this.budget,
    this.characters,
    this.concepts,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    required this.description,
    this.distributor,
    this.hasStaffReview,
    required this.id,
    this.image,
    this.locations,
    required this.name,
    this.producers,
    this.rating,
    this.releaseDate,
    this.runtime,
    this.siteDetailUrl,
    this.studios,
    this.teams,
    this.things,
    this.totalRevenue,
    this.writers,
  });
}
