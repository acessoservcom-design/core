class Quittance {
  final String? id;
  final String clienteId;
  final String clienteNome;
  final String? clienteCpf;
  final double valor;
  final double debitoRestante;
  final DateTime data;
  final String operador;
  final String lojaId;
  final String uid;
  final String empresaId;
  final String? vendaId;
  final String formaPagamento;

  const Quittance({
    this.id,
    required this.clienteId,
    required this.clienteNome,
    this.clienteCpf,
    required this.valor,
    required this.debitoRestante,
    required this.data,
    required this.operador,
    required this.lojaId,
    this.uid = '',
    this.empresaId = '',
    this.vendaId,
    this.formaPagamento = 'dinheiro',
  });

  Map<String, dynamic> toMap() => {
        'clienteId': clienteId,
        'clienteNome': clienteNome,
        if (clienteCpf != null) 'clienteCpf': clienteCpf,
        'valor': valor,
        'debitoRestante': debitoRestante,
        'data': data.toIso8601String(),
        'operador': operador,
        'lojaId': lojaId,
        'uid': uid,
        'empresaId': empresaId,
        if (vendaId != null) 'vendaId': vendaId,
        'formaPagamento': formaPagamento,
      };

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    if (value is DateTime) return value;
    return null;
  }

  factory Quittance.fromMap(Map<String, dynamic> map, {String? id}) {
    return Quittance(
      id: id ?? map['id'] as String?,
      clienteId: map['clienteId'] as String,
      clienteNome: map['clienteNome'] as String,
      clienteCpf: map['clienteCpf'] as String?,
      valor: (map['valor'] as num).toDouble(),
      debitoRestante: (map['debitoRestante'] as num?)?.toDouble() ?? 0,
      data: _parseDate(map['data']) ?? DateTime.now(),
      operador: map['operador'] as String? ?? '',
      lojaId: map['lojaId'] as String,
      uid: map['uid'] as String? ?? '',
      empresaId: map['empresaId'] as String? ?? '',
      vendaId: map['vendaId'] as String?,
      formaPagamento: map['formaPagamento'] as String? ?? 'dinheiro',
    );
  }

  Quittance copyWith({
    String? id,
    String? clienteId,
    String? clienteNome,
    String? clienteCpf,
    double? valor,
    double? debitoRestante,
    DateTime? data,
    String? operador,
    String? lojaId,
    String? uid,
    String? empresaId,
    String? vendaId,
    String? formaPagamento,
  }) =>
      Quittance(
        id: id ?? this.id,
        clienteId: clienteId ?? this.clienteId,
        clienteNome: clienteNome ?? this.clienteNome,
        clienteCpf: clienteCpf ?? this.clienteCpf,
        valor: valor ?? this.valor,
        debitoRestante: debitoRestante ?? this.debitoRestante,
        data: data ?? this.data,
        operador: operador ?? this.operador,
        lojaId: lojaId ?? this.lojaId,
        uid: uid ?? this.uid,
        empresaId: empresaId ?? this.empresaId,
        vendaId: vendaId ?? this.vendaId,
        formaPagamento: formaPagamento ?? this.formaPagamento,
      );

  String get codigo {
    final d = data;
    final seq = id != null ? id!.length > 4 ? id!.substring(0, 5) : id! : '0000';
    return 'QIT-${d.year}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}-$seq';
  }
}
