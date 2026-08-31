class TabelaPrecoItem {
  final String produtoId;
  final double preco;

  const TabelaPrecoItem({
    required this.produtoId,
    required this.preco,
  });

  Map<String, dynamic> toMap() => {
        'produtoId': produtoId,
        'preco': preco,
      };

  factory TabelaPrecoItem.fromMap(Map<String, dynamic> map) {
    return TabelaPrecoItem(
      produtoId: map['produtoId'] as String,
      preco: (map['preco'] as num).toDouble(),
    );
  }
}

class TabelaPreco {
  final String? id;
  final String nome;
  final String lojaId;
  final List<TabelaPrecoItem> itens;
  final List<String> clientesIds;
  final bool ativo;
  final DateTime createdAt;

  const TabelaPreco({
    this.id,
    required this.nome,
    required this.lojaId,
    this.itens = const [],
    this.clientesIds = const [],
    this.ativo = true,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'lojaId': lojaId,
        'itens': itens.map((i) => i.toMap()).toList(),
        'clientesIds': clientesIds,
        'ativo': ativo,
        'createdAt': createdAt.toIso8601String(),
      };

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    if (value is DateTime) return value;
    return null;
  }

  factory TabelaPreco.fromMap(Map<String, dynamic> map, {String? id}) {
    final itensRaw = map['itens'] as List<dynamic>? ?? [];
    final clientesRaw = map['clientesIds'] as List<dynamic>? ?? [];

    return TabelaPreco(
      id: id ?? map['id'] as String?,
      nome: map['nome'] as String,
      lojaId: map['lojaId'] as String,
      itens: itensRaw
          .map((i) => TabelaPrecoItem.fromMap(i as Map<String, dynamic>))
          .toList(),
      clientesIds: clientesRaw.map((e) => e as String).toList(),
      ativo: map['ativo'] as bool? ?? true,
      createdAt: _parseDate(map['createdAt']) ?? DateTime.now(),
    );
  }

  TabelaPreco copyWith({
    String? id,
    String? nome,
    String? lojaId,
    List<TabelaPrecoItem>? itens,
    List<String>? clientesIds,
    bool? ativo,
    DateTime? createdAt,
  }) =>
      TabelaPreco(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        lojaId: lojaId ?? this.lojaId,
        itens: itens ?? this.itens,
        clientesIds: clientesIds ?? this.clientesIds,
        ativo: ativo ?? this.ativo,
        createdAt: createdAt ?? this.createdAt,
      );
}
