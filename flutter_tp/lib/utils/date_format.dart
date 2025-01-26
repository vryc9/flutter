String formatDate(String? date) {
  if (date == null) {
    return "Date inconnue";
  }

  const mois = [
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre"
  ];

  try {
    final parts = date.split('-');
    final year = parts[0];
    final monthName = mois[int.parse(parts[2]) - 1];
    return "$monthName $year";
  } catch (_) {
    return "Date invalide";
  }
}
