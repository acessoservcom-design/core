class ItemEntradaMercadoria {
  final String produtoId;
  final String? produtoNome;
  final int quantidade;
  final double precoCusto;
  final double subtotal;

  ItemEntradaMercadoria({
    required this.produtoId,
    this.produtoNome,
    required this.quantidade,
    required this.precoCusto,
    required this.subtotal,
  });

  factory ItemEntradaMercadoria.fromMap(Map<String, dynamic> map) {
    return ItemEntradaMercadoria(
      produtoId: map['produtoId'] ?? '',
      produtoNome: map['produtoNome'],
      quantidade: map['quantidade'] ?? 0,
      precoCusto: (map['precoCusto'] ?? 0).toDouble(),
      subtotal: (map['subtotal'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'produtoId': produtoId,
      'produtoNome': produtoNome,
      'quantidade': quantidade,
      'precoCusto': precoCusto,
      'subtotal': subtotal,
    };
  }

  ItemEntradaMercadoria copyWith({
    String? produtoId,
    String? produtoNome,
    int? quantidade,
    double? precoCusto,
    double? subtotal,
  }) {
    return ItemEntradaMercadoria(
      produtoId: produtoId ?? this.produtoId,
      produtoNome: produtoNome ?? this.produtoNome,
      quantidade: quantidade ?? this.quantidade,
      precoCusto: precoCusto ?? this.precoCusto,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}

class EntradaMercadoria {
  final String id;
  final String uid;
  final String lojaId;
  final String? pedidoId;
  final String? fornecedorId;
  final String? fornecedorNome;
  final String? notaFiscalId;
  final List<ItemEntradaMercadoria> itens;
  final DateTime data;
  final String status;
  final String? observacao;

  EntradaMercadoria({
    required this.id,
    required this.uid,
    required this.lojaId,
    this.pedidoId,
    this.fornecedorId,
    this.fornecedorNome,
    this.notaFiscalId,
    required this.itens,
    required this.data,
    required this.status,
    this.observacao,
  });

  factory EntradaMercadoria.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return EntradaMercadoria(
      id: id,
      uid: map['uid'] ?? '',
      lojaId: map['lojaId'] ?? '',
      pedidoId: map['pedidoId'],
      fornecedorId: map['fornecedorId'],
      fornecedorNome: map['fornecedorNome'],
      notaFiscalId: map['notaFiscalId'],
      itens: (map['itens'] as List? ?? [])
          .map((item) => ItemEntradaMercadoria.fromMap(item))
          .toList(),
      data: map['data'] is String
          ? DateTime.tryParse(map['data']) ?? DateTime.now()
          : DateTime.now(),
      status: map['status'] ?? 'aberto',
      observacao: map['observacao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lojaId': lojaId,
      'pedidoId': pedidoId,
      'fornecedorId': fornecedorId,
      'fornecedorNome': fornecedorNome,
      'notaFiscalId': notaFiscalId,
      'itens': itens.map((item) => item.toMap()).toList(),
      'data': data.toIso8601String(),
      'status': status,
      if (observacao != null) 'observacao': observacao,
    };
  }

  EntradaMercadoria copyWith({
    String? id,
    String? uid,
    String? lojaId,
    String? pedidoId,
    String? fornecedorId,
    String? fornecedorNome,
    String? notaFiscalId,
    List<ItemEntradaMercadoria>? itens,
    DateTime? data,
    String? status,
    String? observacao,
  }) {
    return EntradaMercadoria(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      pedidoId: pedidoId ?? this.pedidoId,
      fornecedorId: fornecedorId ?? this.fornecedorId,
      fornecedorNome: fornecedorNome ?? this.fornecedorNome,
      notaFiscalId: notaFiscalId ?? this.notaFiscalId,
      itens: itens ?? this.itens,
      data: data ?? this.data,
      status: status ?? this.status,
      observacao: observacao ?? this.observacao,
    );
  }
}
