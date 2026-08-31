import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Utilitário centralizado para formatação e parsing de valores monetários.
/// Garante consistência de locale pt_BR em todo o projeto.
class CurrencyFormatter {
  CurrencyFormatter._();

  static final _fmt =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  static final _compact = NumberFormat.compactCurrency(
      locale: 'pt_BR', symbol: 'R\$', decimalDigits: 1);
  static final _decimalFmt = NumberFormat('#,##0.00', 'pt_BR');
  static final _percentFmt = NumberFormat('#,##0.00', 'pt_BR');

  // ── Formatação ──────────────────────────────────────────────────────

  /// Formata como moeda completa: "R$ 1.234,56"
  static String format(double value) =>
      _fmt.format(value).replaceAll('\u00A0', ' ');

  /// Formata de forma compacta: "R$ 1,2 mil" / "R$ 2 M"
  static String formatCompact(double value) => _compact.format(value);

  /// Apenas o número decimal sem símbolo: "1.234,56"
  static String formatDecimal(double value) => _decimalFmt.format(value);

  /// Número decimal com [casas] configuráveis: "1.234,5" / "1.234,567"
  static String formatNumero(double value, {int casas = 2}) =>
      NumberFormat('#,##0.${'0' * casas}', 'pt_BR').format(value);

  /// Formata como percentual: "1,86%"
  static String formatPercent(double value) =>
      '${_percentFmt.format(value)}%';

  /// Formata diferença com sinal: "+R$ 100,00" / "-R$ 50,00"
  static String formatSigned(double value) {
    final prefix = value >= 0 ? '+' : '';
    return '$prefix${format(value)}';
  }

  // ── Parsing ─────────────────────────────────────────────────────────

  /// Converte string do usuário em double.
  /// Aceita "R$ 1.234,56", "1.234,56" ou "1234.56".
  static double parse(String value) {
    final clean = value
        .replaceAll('R\$', '')
        .replaceAll('\u00A0', ' ')
        .trim();
    if (clean.isEmpty) return 0.0;

    final hasComma = clean.contains(',');
    final hasDot = clean.contains('.');
    if (hasComma && hasDot) {
      final n = double.tryParse(
        clean.replaceAll('.', '').replaceAll(',', '.'),
      );
      if (n != null) return n;
    }
    return double.tryParse(clean.replaceAll(',', '.')) ?? 0.0;
  }

  /// Converte percentual digitado ("1,86" ou "1.86") em double.
  static double parsePercent(String value) {
    final clean = value.replaceAll('%', '').replaceAll(',', '.').trim();
    return double.tryParse(clean) ?? 0.0;
  }

  // ── Cálculos de taxa ────────────────────────────────────────────────

  /// Retorna o valor líquido após aplicar [taxaPercent].
  static double aplicarTaxa(double valor, double taxaPercent) =>
      valor * (1 - taxaPercent / 100);

  /// Retorna apenas o valor da taxa sobre [valor].
  static double calcularTaxa(double valor, double taxaPercent) =>
      valor * taxaPercent / 100;

  /// Retorna a taxa percentual implícita entre bruto e líquido.
  static double taxaImplicita(double bruto, double liquido) {
    if (bruto == 0) return 0;
    return (1 - liquido / bruto) * 100;
  }
}

/// Formata digitação de valores monetários com máscara em tempo real.
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.isEmpty) return const TextEditingValue(text: '');

    final cents = int.parse(digits);
    final value = cents / 100;

    final formatted = CurrencyFormatter.formatDecimal(value);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
