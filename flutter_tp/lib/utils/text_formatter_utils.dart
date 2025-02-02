// Formateur de texte.
String getDefaultTextForEmptyValue(String? value,
    {String defaultValue = "Non disponible"}) {
  return (value == null || value.isEmpty) ? defaultValue : value;
}

// Formateur de l'argent.
String formatMoney(String? amountStr) {
  if (amountStr == null) return "Montant indisponible";
  int? amount = int.tryParse(amountStr);
  if (amount == null) return 'Montant indisponible';

  if (amount >= 1000000000) {
    return '${(amount / 1000000000).toStringAsFixed(0)} milliards \$';
  } else if (amount >= 1000000) {
    return '${(amount / 1000000).toStringAsFixed(0)} millions \$';
  } else if (amount >= 1000) {
    return '${(amount / 1000).toStringAsFixed(0)}K \$';
  } else {
    return '$amount \$';
  }
}

String formatErreurMessage(int statusCode, String message) {
  switch (statusCode) {
    case 102: 
      return "$message Requête invalide : La requête envoyée est incorrecte.";
    case 400: 
      return "$message Requête invalide : La requête envoyée est incorrecte.";
    case 401: 
      return "$message Non autorisé : Votre API key est erronée.";
    case 100: 
      return "$message Non autorisé : Votre API key est erronée.";
    case 403: 
      return "$message Accès refusé : Votre clé d'API est bloquée.";
    case 404: 
      return "$message Introuvable : La ressource demandée n'existe pas.";
    case 101: 
      return "$message Introuvable : La ressource demandée n'existe pas.";
    case 420: 
      return "$message Ralentissez : Trop de requête en une seconde.";
    case 107: 
      return "$message Ralentissez : Trop de requête en une seconde.";
    case 500: 
      return "$message Erreur serveur : Une erreur interne s'est produite. Réessayez plus tard.";
    case 503: 
      return "$message Service indisponible : Le service est temporairement indisponible.";
    default:
      return "$message Problème de connexion internet : Veuillez réessayer après avoir vérifié votre connexion internet.";
  }
}