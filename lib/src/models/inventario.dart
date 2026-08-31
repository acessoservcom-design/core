class InventarioItem {
  final String produtoId;
  final int qtdSistema;
  final int qtdFisica;
  final int diferenca;

  InventarioItem({
    required this.produtoId,
    required this.qtdSistema,
    required this.qtdFisica,
    required this.diferenca,
  });

  factory InventarioItem.fromMap(Map<String, dynamic> map) {
    return InventarioItem(
      produtoId: map['produtoId'] ?? '',
      qtdSistema: map['qtdSistema'] ?? 0,
      qtdFisica: map['qtdFisica'] ?? 0,
      diferenca: map['diferenca'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'produtoId': produtoId,
      'qtdSistema': qtdSistema,
      'qtdFisica': qtdFisica,
      'diferenca': diferenca,
    };
  }
}

class Inventario {
  final String id;
  final String uid;
  final String lojaId;
  final DateTime data;
  final String status;
  final List<InventarioItem> itens;

  Inventario({
    required this.id,
    required this.uid,
    required this.lojaId,
    required this.data,
    required this.status,
    required this.itens,
  });

  factory Inventario.fromMap(Map<String, dynamic> map, {String? id}) {
    return Inventario(
      id: id ?? map['id'] as String? ?? '',
      uid: map['uid'] ?? '',
      lojaId: map['lojaId'] ?? '',
      data: map['data'] is String
          ? DateTime.parse(map['data'] as String)
          : map['data'] is DateTime
              ? map['data'] as DateTime
              : DateTime.now(),
      status: map['status'] ?? 'aberto',
      itens: (map['itens'] as List? ?? [])
          .map((item) => InventarioItem.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lojaId': lojaId,
      'data': data.toIso8601String(),
      'status': status,
      'itens': itens.map((item) => item.toMap()).toList(),
    };
  }

  Inventario copyWith({
    String? id,
    String? uid,
    String? lojaId,
    DateTime? data,
    String? status,
    List<InventarioItem>? itens,
  }) {
    return Inventario(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      data: data ?? this.data,
      status: status ?? this.status,
      itens: itens ?? this.itens,
    );
  }
}
