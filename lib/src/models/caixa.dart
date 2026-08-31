enum CaixaTurnoStatus { aberto, fechado }

class CaixaTurno {
  final String id;
  final String lojaId;
  final String empresaId;
  final String operadorId;
  final String? operadorNome;
  final String? terminalId;
  final DateTime dataAbertura;
  final DateTime? dataFechamento;
  final double saldoInicial;
  final double? saldoFinal;
  final double? totalDinheiro;
  final double? totalCartao;
  final double? totalPix;
  final double? totalOutros;
  final double? diferenca;
  final String? observacao;
  final CaixaTurnoStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CaixaTurno({
    required this.id,
    required this.lojaId,
    this.empresaId = '',
    required this.operadorId,
    this.operadorNome,
    this.terminalId,
    required this.dataAbertura,
    this.dataFechamento,
    required this.saldoInicial,
    this.saldoFinal,
    this.totalDinheiro,
    this.totalCartao,
    this.totalPix,
    this.totalOutros,
    this.diferenca,
    this.observacao,
    this.status = CaixaTurnoStatus.aberto,
    required this.createdAt,
    required this.updatedAt,
  });

  CaixaTurno copyWith({
    String? id,
    String? lojaId,
    String? empresaId,
    String? operadorId,
    String? operadorNome,
    String? terminalId,
    DateTime? dataAbertura,
    DateTime? dataFechamento,
    double? saldoInicial,
    double? saldoFinal,
    double? totalDinheiro,
    double? totalCartao,
    double? totalPix,
    double? totalOutros,
    double? diferenca,
    String? observacao,
    CaixaTurnoStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CaixaTurno(
      id: id ?? this.id,
      lojaId: lojaId ?? this.lojaId,
      empresaId: empresaId ?? this.empresaId,
      operadorId: operadorId ?? this.operadorId,
      operadorNome: operadorNome ?? this.operadorNome,
      terminalId: terminalId ?? this.terminalId,
      dataAbertura: dataAbertura ?? this.dataAbertura,
      dataFechamento: dataFechamento ?? this.dataFechamento,
      saldoInicial: saldoInicial ?? this.saldoInicial,
      saldoFinal: saldoFinal ?? this.saldoFinal,
      totalDinheiro: totalDinheiro ?? this.totalDinheiro,
      totalCartao: totalCartao ?? this.totalCartao,
      totalPix: totalPix ?? this.totalPix,
      totalOutros: totalOutros ?? this.totalOutros,
      diferenca: diferenca ?? this.diferenca,
      observacao: observacao ?? this.observacao,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'lojaId': lojaId,
      'empresaId': empresaId,
      'operadorId': operadorId,
      if (operadorNome != null) 'operadorNome': operadorNome,
      'terminalId': terminalId,
      'dataAbertura': _toIsoUtc(dataAbertura),
      'dataFechamento': dataFechamento != null ? _toIsoUtc(dataFechamento!) : null,
      'saldoInicial': saldoInicial,
      'saldoFinal': saldoFinal,
      'totalDinheiro': totalDinheiro,
      'totalCartao': totalCartao,
      'totalPix': totalPix,
      'totalOutros': totalOutros,
      'diferenca': diferenca,
      'observacao': observacao,
      'status': status.name,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
  }

  factory CaixaTurno.fromJson(Map<String, dynamic> json) {
    return CaixaTurno(
      id: json['id'] as String,
      lojaId: json['lojaId'] as String,
      empresaId: json['empresaId'] as String? ?? '',
      operadorId: json['operadorId'] as String,
      operadorNome: json['operadorNome'] as String?,
      terminalId: json['terminalId'] as String?,
      dataAbertura: DateTime.parse(json['dataAbertura'] as String).toUtc(),
      dataFechamento: json['dataFechamento'] != null
          ? DateTime.parse(json['dataFechamento'] as String).toUtc()
          : null,
      saldoInicial: (json['saldoInicial'] as num).toDouble(),
      saldoFinal: (json['saldoFinal'] as num?)?.toDouble(),
      totalDinheiro: (json['totalDinheiro'] as num?)?.toDouble(),
      totalCartao: (json['totalCartao'] as num?)?.toDouble(),
      totalPix: (json['totalPix'] as num?)?.toDouble(),
      totalOutros: (json['totalOutros'] as num?)?.toDouble(),
      diferenca: (json['diferenca'] as num?)?.toDouble(),
      observacao: json['observacao'] as String?,
      status: CaixaTurnoStatus.values.firstWhere((s) => s.name == json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String).toUtc(),
      updatedAt: DateTime.parse(json['updatedAt'] as String).toUtc(),
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaixaTurno &&
          runtimeType == other.runtimeType &&
          id == other.id;

  Map<String, dynamic> toMap() => toJson();

  factory CaixaTurno.fromMap(Map<String, dynamic> map, {String? id}) {
    return CaixaTurno.fromJson({
      'id': id ?? map['id'] as String? ?? '',
      ...map,
    });
  }

  @override
  int get hashCode => id.hashCode;
}

enum CaixaMovimentoTipo {
  entrada, saida, sangria, suprimento, recebimento, troco
}

class CaixaMovimento {
  final String id;
  final String turnoId;
  final String empresaId;
  final CaixaMovimentoTipo tipo;
  final double valor;
  final String formaPagamento;
  final String? referenciaId;
  final String? descricao;
  final DateTime createdAt;

  const CaixaMovimento({
    required this.id,
    required this.turnoId,
    this.empresaId = '',
    required this.tipo,
    required this.valor,
    this.formaPagamento = 'dinheiro',
    this.referenciaId,
    this.descricao,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'turnoId': turnoId,
      'empresaId': empresaId,
      'tipo': tipo.name,
      'valor': valor,
      'formaPagamento': formaPagamento,
      'referenciaId': referenciaId,
      'descricao': descricao,
      'createdAt': _toIsoUtc(createdAt),
    };
  }

  factory CaixaMovimento.fromJson(Map<String, dynamic> json) {
    return CaixaMovimento(
      id: json['id'] as String,
      turnoId: json['turnoId'] as String,
      empresaId: json['empresaId'] as String? ?? '',
      tipo: CaixaMovimentoTipo.values.firstWhere((t) => t.name == json['tipo']),
      valor: (json['valor'] as num).toDouble(),
      formaPagamento: json['formaPagamento'] as String? ?? 'dinheiro',
      referenciaId: json['referenciaId'] as String?,
      descricao: json['descricao'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String).toUtc(),
    );
  }

  Map<String, dynamic> toMap() => toJson();

  factory CaixaMovimento.fromMap(Map<String, dynamic> map, {String? id}) {
    return CaixaMovimento.fromJson({
      'id': id ?? map['id'] as String? ?? '',
      ...map,
    });
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
