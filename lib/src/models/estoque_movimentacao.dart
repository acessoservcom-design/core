enum EstoqueMovimentacaoTipo {
  entrada, saida, transferencia_entrada, transferencia_saida, ajuste, inventario
}

class EstoqueMovimentacao {
  final String id;
  final String empresaId;
  final String lojaId;
  final String produtoId;
  final EstoqueMovimentacaoTipo tipo;
  final double quantidade;
  final double saldoAnterior;
  final double saldoPosterior;
  final String? lojaDestinoId;
  final String? observacao;
  final String? funcionarioId;
  final String? referenciaId;
  final DateTime createdAt;

  const EstoqueMovimentacao({
    required this.id,
    required this.empresaId,
    required this.lojaId,
    required this.produtoId,
    required this.tipo,
    required this.quantidade,
    required this.saldoAnterior,
    required this.saldoPosterior,
    this.lojaDestinoId,
    this.observacao,
    this.funcionarioId,
    this.referenciaId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'lojaId': lojaId,
      'produtoId': produtoId,
      'tipo': tipo.name,
      'quantidade': quantidade,
      'saldoAnterior': saldoAnterior,
      'saldoPosterior': saldoPosterior,
      'lojaDestinoId': lojaDestinoId,
      'observacao': observacao,
      'funcionarioId': funcionarioId,
      'referenciaId': referenciaId,
      'createdAt': _toIsoUtc(createdAt),
    };
  }

  factory EstoqueMovimentacao.fromJson(Map<String, dynamic> json) {
    return EstoqueMovimentacao(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      lojaId: json['lojaId'] as String,
      produtoId: json['produtoId'] as String,
      tipo: EstoqueMovimentacaoTipo.values.firstWhere((t) => t.name == json['tipo']),
      quantidade: (json['quantidade'] as num).toDouble(),
      saldoAnterior: (json['saldoAnterior'] as num).toDouble(),
      saldoPosterior: (json['saldoPosterior'] as num).toDouble(),
      lojaDestinoId: json['lojaDestinoId'] as String?,
      observacao: json['observacao'] as String?,
      funcionarioId: json['funcionarioId'] as String?,
      referenciaId: json['referenciaId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String).toUtc(),
    );
  }

  static String _toIsoUtc(DateTime dt) {
    return '${dt.year.toString().padLeft(4, '0')}-'
        '${dt.month.toString().padLeft(2, '0')}-'
        '${dt.day.toString().padLeft(2, '0')}T'
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}:'
        '${dt.second.toString().padLeft(2, '0')}.'
        '${dt.millisecond.toString().padLeft(3, '0')}Z';
  }
}
