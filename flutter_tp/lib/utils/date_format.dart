String formatDateMonthYear(String? date) {
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
    final monthName = mois[int.parse(parts[1]) - 1];
    return "$monthName $year";
  } catch (_) {
    return "Date invalide";
  }
}

String formatDateYear(String? date) {
  if (date == null) {
    return "Date inconnue";
  }

  try {
    final parts = date.split('-');
    final year = parts[0];
    return year;
  } catch (_) {
    return "Date invalide";
  }
}

String formatDateDayMonthYear(String? date) {
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
    final monthName = mois[int.parse(parts[1]) - 1];
    final day = parts[2];
    return "$day $monthName $year";
  } catch (_) {
    return "Date invalide";
  }
}

