class LogAcao {
  final String id;
  final String empresaId;
  final String? funcionarioId;
  final String? terminalId;
  final String acao;
  final String entidadeTipo;
  final String? entidadeId;
  final Map<String, dynamic>? detalhes;
  final String? ip;
  final DateTime createdAt;

  const LogAcao({
    required this.id,
    required this.empresaId,
    this.funcionarioId,
    this.terminalId,
    required this.acao,
    required this.entidadeTipo,
    this.entidadeId,
    this.detalhes,
    this.ip,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'acao': acao,
      'entidadeTipo': entidadeTipo,
      'createdAt': _toIsoUtc(createdAt),
    };
    if (funcionarioId != null) map['funcionarioId'] = funcionarioId;
    if (terminalId != null) map['terminalId'] = terminalId;
    if (entidadeId != null) map['entidadeId'] = entidadeId;
    if (detalhes != null) map['detalhes'] = detalhes;
    if (ip != null) map['ip'] = ip;
    return map;
  }

  factory LogAcao.fromJson(Map<String, dynamic> json) {
    return LogAcao(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      funcionarioId: json['funcionarioId'] as String?,
      terminalId: json['terminalId'] as String?,
      acao: json['acao'] as String,
      entidadeTipo: json['entidadeTipo'] as String,
      entidadeId: json['entidadeId'] as String?,
      detalhes: json['detalhes'] as Map<String, dynamic>?,
      ip: json['ip'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String).toUtc(),
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
}
