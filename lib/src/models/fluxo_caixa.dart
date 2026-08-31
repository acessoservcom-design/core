class FluxoCaixa {
  final String id;
  final String uid;
  final String lojaId;
  final DateTime data;
  final String tipo;
  final double valor;
  final String categoria;
  final String? referenciaId;
  final String descricao;

  FluxoCaixa({
    required this.id,
    required this.uid,
    required this.lojaId,
    required this.data,
    required this.tipo,
    required this.valor,
    required this.categoria,
    this.referenciaId,
    required this.descricao,
  });

  factory FluxoCaixa.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return FluxoCaixa(
      id: id,
      uid: map['uid'] ?? '',
      lojaId: map['lojaId'] ?? '',
      data: map['data'] is String
          ? DateTime.tryParse(map['data']) ?? DateTime.now()
          : DateTime.now(),
      tipo: map['tipo'] ?? 'entrada',
      valor: (map['valor'] ?? 0).toDouble(),
      categoria: map['categoria'] ?? '',
      referenciaId: map['referenciaId'],
      descricao: map['descricao'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lojaId': lojaId,
      'data': data.toIso8601String(),
      'tipo': tipo,
      'valor': valor,
      'categoria': categoria,
      'referenciaId': referenciaId,
      'descricao': descricao,
    };
  }

  FluxoCaixa copyWith({
    String? id,
    String? uid,
    String? lojaId,
    DateTime? data,
    String? tipo,
    double? valor,
    String? categoria,
    String? referenciaId,
    String? descricao,
  }) {
    return FluxoCaixa(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      data: data ?? this.data,
      tipo: tipo ?? this.tipo,
      valor: valor ?? this.valor,
      categoria: categoria ?? this.categoria,
      referenciaId: referenciaId ?? this.referenciaId,
      descricao: descricao ?? this.descricao,
    );
  }
}
