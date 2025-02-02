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