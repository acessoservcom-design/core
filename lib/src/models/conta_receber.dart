class ContaReceber {
  final String id;
  final String uid;
  final String lojaId;
  final String? clienteId;
  final String? clienteNome;
  final DateTime vencimento;
  final double valor;
  final String status;
  final String? vendaId;
  final DateTime? dataRecebimento;

  ContaReceber({
    required this.id,
    required this.uid,
    required this.lojaId,
    this.clienteId,
    this.clienteNome,
    required this.vencimento,
    required this.valor,
    required this.status,
    this.vendaId,
    this.dataRecebimento,
  });

  factory ContaReceber.fromJson(Map<String, dynamic> json) {
    return ContaReceber(
      id: json['id'] ?? '',
      uid: json['uid'] ?? '',
      lojaId: json['lojaId'] ?? '',
      clienteId: json['clienteId'],
      clienteNome: json['clienteNome'],
      vencimento: json['vencimento'] != null
          ? DateTime.parse(json['vencimento'])
          : DateTime.now(),
      valor: (json['valor'] ?? 0).toDouble(),
      status: json['status'] ?? 'aberto',
      vendaId: json['vendaId'],
      dataRecebimento: json['dataRecebimento'] != null
          ? DateTime.parse(json['dataRecebimento'])
          : null,
    );
  }

  factory ContaReceber.fromMap(Map<String, dynamic> map, {String? id}) {
    return ContaReceber.fromJson({...map, if (id != null) 'id': id});
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'lojaId': lojaId,
      'clienteId': clienteId,
      'clienteNome': clienteNome,
      'vencimento': vencimento.toIso8601String(),
      'valor': valor,
      'status': status,
      'vendaId': vendaId,
      'dataRecebimento': dataRecebimento?.toIso8601String(),
    };
  }

  Map<String, dynamic> toMap() => toJson();

  ContaReceber copyWith({
    String? id,
    String? uid,
    String? lojaId,
    String? clienteId,
    String? clienteNome,
    DateTime? vencimento,
    double? valor,
    String? status,
    String? vendaId,
    DateTime? dataRecebimento,
  }) {
    return ContaReceber(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      lojaId: lojaId ?? this.lojaId,
      clienteId: clienteId ?? this.clienteId,
      clienteNome: clienteNome ?? this.clienteNome,
      vencimento: vencimento ?? this.vencimento,
      valor: valor ?? this.valor,
      status: status ?? this.status,
      vendaId: vendaId ?? this.vendaId,
      dataRecebimento: dataRecebimento ?? this.dataRecebimento,
    );
  }
}
