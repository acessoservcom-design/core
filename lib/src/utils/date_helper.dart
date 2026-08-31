import 'package:intl/intl.dart';

/// Utilitário centralizado para formatação e parsing de datas.
/// Garante consistência de locale pt_BR em todo o projeto.
class DateHelper {
  DateHelper._();

  static final _fmt      = DateFormat('dd/MM/yyyy', 'pt_BR');
  static final _fmtHora  = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR');
  static final _fmtMes   = DateFormat('MMMM/yyyy', 'pt_BR');
  static final _fmtCurto = DateFormat('dd/MM', 'pt_BR');
  static final _fmtSemana = DateFormat('EEE, dd/MM', 'pt_BR');

  // ── Formatação ──────────────────────────────────────────────────────

  /// "13/04/2026"
  static String format(DateTime date) => _fmt.format(date);

  /// "13/04/2026 14:30"
  static String formatComHora(DateTime date) => _fmtHora.format(date);

  /// "abril/2026"
  static String formatMes(DateTime date) => _fmtMes.format(date);

  /// "13/04" — útil em gráficos e listas compactas
  static String formatCurto(DateTime date) => _fmtCurto.format(date);

  /// "seg., 13/04"
  static String formatComDiaSemana(DateTime date) =>
      _fmtSemana.format(date);

  /// Retorna rótulo relativo: "Hoje", "Ontem" ou a data formatada.
  static String formatRelativo(DateTime date) {
    final hoje = _inicioDoDia(DateTime.now());
    final d    = _inicioDoDia(date);
    final diff = hoje.difference(d).inDays;
    if (diff == 0) return 'Hoje';
    if (diff == 1) return 'Ontem';
    if (diff == -1) return 'Amanhã';
    return format(date);
  }

  // ── Parsing ─────────────────────────────────────────────────────────

  /// Tenta parsear "dd/MM/yyyy". Retorna null em caso de falha.
  static DateTime? parse(String value) {
    try {
      return _fmt.parse(value);
    } catch (_) {
      return null;
    }
  }

  /// Tenta parsear "dd/MM/yyyy HH:mm". Retorna null em caso de falha.
  static DateTime? parseComHora(String value) {
    try {
      return _fmtHora.parse(value);
    } catch (_) {
      return null;
    }
  }

  // ── Utilitários de calendário ────────────────────────────────────────

  /// Retorna DateTime zerado na meia-noite (sem horas/minutos).
  static DateTime inicioDoDia(DateTime data) => _inicioDoDia(data);

  /// Retorna o último instante do dia (23:59:59.999).
  static DateTime fimDoDia(DateTime data) =>
      DateTime(data.year, data.month, data.day, 23, 59, 59, 999);

  /// Primeiro dia do mês de [data].
  static DateTime inicioDoMes(DateTime data) =>
      DateTime(data.year, data.month, 1);

  /// Último dia do mês de [data].
  static DateTime fimDoMes(DateTime data) =>
      DateTime(data.year, data.month + 1, 0);

  /// Retorna o próximo dia útil após [data] (pula sábado e domingo).
  static DateTime proximoDiaUtil(DateTime data) {
    DateTime next = data.add(const Duration(days: 1));
    while (next.weekday == DateTime.saturday ||
        next.weekday == DateTime.sunday) {
      next = next.add(const Duration(days: 1));
    }
    return _inicioDoDia(next);
  }

  /// Verifica se [data] é fim de semana.
  static bool isFimDeSemana(DateTime data) =>
      data.weekday == DateTime.saturday || data.weekday == DateTime.sunday;

  /// Número de dias entre [inicio] e [fim] (inclusive).
  static int diasEntre(DateTime inicio, DateTime fim) =>
      fim.difference(inicio).inDays.abs() + 1;

  /// Número de dias úteis entre [inicio] e [fim].
  static int diasUteisAte(DateTime inicio, DateTime fim) {
    var count = 0;
    var d = inicio;
    while (d.isBefore(fim) || d.isAtSameMomentAs(fim)) {
      if (d.weekday != DateTime.saturday && d.weekday != DateTime.sunday) {
        count++;
      }
      d = d.add(const Duration(days: 1));
    }
    return count;
  }

  /// Retorna ISO 8601 UTC format.
  static String toIsoUtc(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}T'
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}:'
        '${date.second.toString().padLeft(2, '0')}.'
        '${date.millisecond.toString().padLeft(3, '0')}Z';
  }

  // ── Privado ──────────────────────────────────────────────────────────
  static DateTime _inicioDoDia(DateTime data) =>
      DateTime(data.year, data.month, data.day);
}
