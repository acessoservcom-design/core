/// Resultado da emissão NFC-e.
class NfceResult {
  final bool success;
  final String? chave;
  final String? protocolo;
  final String? xml;
  final String? erro;
  final int? numero;

  const NfceResult({
    required this.success,
    this.chave,
    this.protocolo,
    this.xml,
    this.erro,
    this.numero,
  });
}

/// Parâmetros de um item para emissão NFC-e.
class NfceItemParams {
  final String codigo;
  final int quantidade;
  final String nome;
  final String ncm;
  final String cfop;
  final String unidade;
  final double valorUnitario;
  final double valorTotal;
  final int icmsOrigem;
  final double icmsAliquota;

  const NfceItemParams({
    this.codigo = '',
    required this.quantidade,
    required this.nome,
    required this.ncm,
    required this.cfop,
    this.unidade = 'UN',
    required this.valorUnitario,
    required this.valorTotal,
    this.icmsOrigem = 0,
    this.icmsAliquota = 0,
  });
}

/// Item para emissão NFC-e (dados fiscais).
class NfceItem {
  final String nome;
  final String ncm;
  final String cest;
  final String cfop;
  final int quantidade;
  final String unidade;
  final double valorUnitario;
  final double valorTotal;
  final int icmsOrigem;
  final double icmsAliquota;

  const NfceItem({
    required this.nome,
    required this.ncm,
    required this.cest,
    required this.cfop,
    required this.quantidade,
    this.unidade = 'UN',
    required this.valorUnitario,
    required this.valorTotal,
    this.icmsOrigem = 0,
    this.icmsAliquota = 0,
  });
}