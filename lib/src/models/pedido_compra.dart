class ItemPedidoCompra {
  final String produtoId;
  final String? produtoNome;
  final int quantidade;
  final double precoUnitario;
  final double subtotal;

  ItemPedidoCompra({
    required this.produtoId,
    this.produtoNome,
    required this.quantidade,
    required this.precoUnitario,
    required this.subtotal,
  });

  factory ItemPedidoCompra.fromMap(Map<String, dynamic> map) {
    return ItemPedidoCompra(
      produtoId: map['produtoId'] ?? '',
      produtoNome: map['produtoNome'],
      quantidade: map['quantidade'] ?? 0,
      precoUnitario: (map['precoUnitario'] ?? 0).toDouble(),
      subtotal: (map['subtotal'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'produtoId': produtoId,
      'produtoNome': produtoNome,
      'quantidade': quantidade,
      'precoUnitario': precoUnitario,
      'subtotal': subtotal,
    };
  }

  ItemPedidoCompra copyWith({
    String? produtoId,
    String? produtoNome,
    int? quantidade,
    double? precoUnitario,
    double? subtotal,
  }) {
    return ItemPedidoCompra(
      produtoId: produtoId ?? this.produtoId,
      produtoNome: produtoNome ?? this.produtoNome,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}

class PedidoCompra {
  final String id;
  final String uid;
  final String lojaId;
  final String? fornecedorId;
  final String? fornecedorNome;
  final List<ItemPedidoCompra> itens;
  final double total;
  final String status;
  final DateTime data;
  final DateTime? dataEntrega;
  final String? observacao;

  PedidoCompra({
    required this.id,
    required this.uid,
    required this.lojaId,
    this.fornecedorId,
    this.fornecedorNome,
    required this.itens,
    required this.total,
    required this.status,
    required this.data,
    this.dataEntrega,
    this.observacao,
  });

  factory PedidoCompra.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return PedidoCompra(
      id: id,
      uid: map['uid'] ?? '',
      lojaId: map['lojaId'] ?? '',
      fornecedorId: map['fornecedorId'],
      fornecedorNome: map['fornecedorNome'],
      itens: (map['itens'] as List? ?? [])
          .map((item) => ItemPedidoCompra.fromMap(item))
          .toList(),
      total: (map['total'] ?? 0).toDouble(),
      status: map['status'] ?? 'aberto',
      data: map['data'] is String
          ? DateTime.tryParse(map['data']) ?? DateTime.now()
          : DateTime.now(),
      dataEntrega: map['dataEntrega'] is String
          ? DateTime.tryParse(map['dataEntrega'])
          : null,
      observacao: map['observacao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lojaId': lojaId,
      'fornecedorId': fornecedorId,
      'fornecedorNome': fornecedorNome,
      'itens': itens.map((item) => item.toMap()).toList(),
      'total': total,
      'status': status,
      'data': data.toIso8601String(),
      if (dataEntrega != null) 'dataEntrega': dataEntrega!.toIso8601String(),
      if (observacao != null) 'observacao': observacao,
    };
  }

  PedidoCompra copyWith({
    String? id,
    String? uid,
    String? lojaId,
    String? fornecedorId,
    String? fornecedorNome,
    List<ItemPedidoCompra>? itens,
    double? total,
    String? status,
    DateTime? data,
    DateTime? dataEntrega,
    String? observacao,
  }) {
    return PedidoCompra(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      fornecedorId: fornecedorId ?? this.fornecedorId,
      fornecedorNome: fornecedorNome ?? this.fornecedorNome,
      itens: itens ?? this.itens,
      total: total ?? this.total,
      status: status ?? this.status,
      data: data ?? this.data,
      dataEntrega: dataEntrega ?? this.dataEntrega,
      observacao: observacao ?? this.observacao,
    );
  }
}
