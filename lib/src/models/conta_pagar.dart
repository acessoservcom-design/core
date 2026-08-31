class ContaPagar {
  final String id;
  final String uid;
  final String lojaId;
  final String? fornecedorId;
  final String? fornecedorNome;
  final DateTime vencimento;
  final double valor;
  final String status;
  final String categoria;
  final String? notaFiscalId;
  final String? observacao;
  final DateTime? dataPagamento;

  ContaPagar({
    required this.id,
    required this.uid,
    required this.lojaId,
    this.fornecedorId,
    this.fornecedorNome,
    required this.vencimento,
    required this.valor,
    required this.status,
    required this.categoria,
    this.notaFiscalId,
    this.observacao,
    this.dataPagamento,
  });

  factory ContaPagar.fromJson(Map<String, dynamic> json) {
    return ContaPagar(
      id: json['id'] ?? '',
      uid: json['uid'] ?? '',
      lojaId: json['lojaId'] ?? '',
      fornecedorId: json['fornecedorId'],
      fornecedorNome: json['fornecedorNome'],
      vencimento: json['vencimento'] != null
          ? DateTime.parse(json['vencimento'])
          : DateTime.now(),
      valor: (json['valor'] ?? 0).toDouble(),
      status: json['status'] ?? 'aberto',
      categoria: json['categoria'] ?? '',
      notaFiscalId: json['notaFiscalId'],
      observacao: json['observacao'],
      dataPagamento: json['dataPagamento'] != null
          ? DateTime.parse(json['dataPagamento'])
          : null,
    );
  }

  factory ContaPagar.fromMap(Map<String, dynamic> map, {String? id}) {
    return ContaPagar.fromJson({...map, if (id != null) 'id': id});
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'lojaId': lojaId,
      'fornecedorId': fornecedorId,
      'fornecedorNome': fornecedorNome,
      'vencimento': vencimento.toIso8601String(),
      'valor': valor,
      'status': status,
      'categoria': categoria,
      'notaFiscalId': notaFiscalId,
      'observacao': observacao,
      'dataPagamento': dataPagamento?.toIso8601String(),
    };
  }

  Map<String, dynamic> toMap() => toJson();

  ContaPagar copyWith({
    String? id,
    String? uid,
    String? lojaId,
    String? fornecedorId,
    String? fornecedorNome,
    DateTime? vencimento,
    double? valor,
    String? status,
    String? categoria,
    String? notaFiscalId,
    String? observacao,
    DateTime? dataPagamento,
  }) {
    return ContaPagar(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      fornecedorId: fornecedorId ?? this.fornecedorId,
      fornecedorNome: fornecedorNome ?? this.fornecedorNome,
      vencimento: vencimento ?? this.vencimento,
      valor: valor ?? this.valor,
      status: status ?? this.status,
      categoria: categoria ?? this.categoria,
      notaFiscalId: notaFiscalId ?? this.notaFiscalId,
      observacao: observacao ?? this.observacao,
      dataPagamento: dataPagamento ?? this.dataPagamento,
    );
  }
}
