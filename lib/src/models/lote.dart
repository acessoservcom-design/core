class Lote {
  final String id;
  final String uid;
  final String lojaId;
  final String produtoId;
  final String numeroLote;
  final DateTime validade;
  final int quantidade;
  final int utilizado;

  Lote({
    required this.id,
    required this.uid,
    required this.lojaId,
    required this.produtoId,
    required this.numeroLote,
    required this.validade,
    required this.quantidade,
    required this.utilizado,
  });

  factory Lote.fromMap(Map<String, dynamic> map, {String? id}) {
    return Lote(
      id: id ?? map['id'] as String? ?? '',
      uid: map['uid'] ?? '',
      lojaId: map['lojaId'] ?? '',
      produtoId: map['produtoId'] ?? '',
      numeroLote: map['numeroLote'] ?? '',
      validade: map['validade'] is String
          ? DateTime.parse(map['validade'] as String)
          : map['validade'] is DateTime
              ? map['validade'] as DateTime
              : DateTime.now(),
      quantidade: map['quantidade'] ?? 0,
      utilizado: map['utilizado'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lojaId': lojaId,
      'produtoId': produtoId,
      'numeroLote': numeroLote,
      'validade': validade.toIso8601String(),
      'quantidade': quantidade,
      'utilizado': utilizado,
    };
  }

  int get saldo => quantidade - utilizado;

  Lote copyWith({
    String? id,
    String? uid,
    String? lojaId,
    String? produtoId,
    String? numeroLote,
    DateTime? validade,
    int? quantidade,
    int? utilizado,
  }) {
    return Lote(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      produtoId: produtoId ?? this.produtoId,
      numeroLote: numeroLote ?? this.numeroLote,
      validade: validade ?? this.validade,
      quantidade: quantidade ?? this.quantidade,
      utilizado: utilizado ?? this.utilizado,
    );
  }
}
