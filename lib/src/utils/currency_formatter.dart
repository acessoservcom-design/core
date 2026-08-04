class CurrencyFormatter {
  CurrencyFormatter._();

  static String format(double? value) {
    if (value == null) return 'R\$ 0,00';
    final fixed = value.toStringAsFixed(2).replaceAll('.', ',');
    return 'R\$ $fixed';
  }

  static String formatCompact(double value) {
    if (value >= 1000000) return 'R\$ ${(value / 1000000).toStringAsFixed(1).replaceAll('.', ',')}M';
    if (value >= 1000) return 'R\$ ${(value / 1000).toStringAsFixed(1).replaceAll('.', ',')}K';
    return format(value);
  }

  static String formatDecimal(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  static double parse(String? value) {
    if (value == null || value.isEmpty) return 0.0;
    final cleaned = value
        .replaceAll('R\$ ', '')
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .replaceAll(RegExp(r'[^\d.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }
}
