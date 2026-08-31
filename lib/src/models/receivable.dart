class Receivable {
  final double valor;
  final DateTime dataRecebimento;
  final int parcela;
  final int totalParcelas;
  final String tipo;
  final bool antecipado;

  const Receivable({
    required this.valor,
    required this.dataRecebimento,
    required this.parcela,
    required this.totalParcelas,
    required this.tipo,
    this.antecipado = false,
  });
}
