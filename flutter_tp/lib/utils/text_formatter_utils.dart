String getDefaultTextForEmptyValue(String? value,
    {String defaultValue = "Non disponible"}) {
  return (value == null || value.isEmpty) ? defaultValue : value;
}

String formatMoney(String? amountStr) {
  if (amountStr == null) return "Montant Indisponible";
  int? amount = int.tryParse(amountStr);
  if (amount == null) return 'Montant Indisponible';

  if (amount >= 1000000000) {
    return '${(amount / 1000000000).toStringAsFixed(0)} milliards \$';
  } else if (amount >= 1000000) {
    return '${(amount / 1000000).toStringAsFixed(0)} millions \$';
  } else if (amount >= 1000) {
    return '${(amount / 1000).toStringAsFixed(0)}K \$';
  } else if (amount < 1000){
    return '$amount \$';
  } else {
    return "Montant indisponible";
  }
}