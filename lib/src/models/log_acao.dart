import 'safe_cast.dart';

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
      id: safeStr(json['id']),
      empresaId: safeStr(json['empresaId']),
      funcionarioId: safeStr(json['funcionarioId']),
      terminalId: safeStr(json['terminalId']),
      acao: safeStr(json['acao']),
      entidadeTipo: safeStr(json['entidadeTipo']),
      entidadeId: safeStr(json['entidadeId']),
      detalhes: json['detalhes'] as Map<String, dynamic>?,
      ip: safeStr(json['ip']),
      createdAt: safeDate(json['createdAt']) ?? DateTime.now().toUtc(),
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

  Map<String, dynamic> toMap() => toJson();

  factory LogAcao.fromMap(Map<String, dynamic> map, {String? id}) {
    return LogAcao.fromJson({
      'id': id ?? map['id'] as String? ?? '',
      ...map,
    });
  }
}
