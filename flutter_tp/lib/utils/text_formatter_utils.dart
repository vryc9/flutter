String getDefaultTextForEmptyValue(String? value,
    {String defaultValue = "Non disponible"}) {
  return (value == null || value.isEmpty) ? defaultValue : value;
}
