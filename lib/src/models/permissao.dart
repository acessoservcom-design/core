class Permissao {
  final String id;
  final String nome;
  final String descricao;
  final List<String> menusAutorizados;
  final String empresaId;
  final bool ativo;
  final DateTime criadoEm;
  final String criadoPor;

  const Permissao({
    required this.id,
    required this.nome,
    this.descricao = '',
    this.menusAutorizados = const [],
    required this.empresaId,
    this.ativo = true,
    required this.criadoEm,
    required this.criadoPor,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'menusAutorizados': menusAutorizados,
        'empresaId': empresaId,
        'ativo': ativo,
        'criadoEm': criadoEm.toIso8601String(),
        'criadoPor': criadoPor,
      };

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    if (value is DateTime) return value;
    return null;
  }

  factory Permissao.fromMap(Map<String, dynamic> map, {String? id}) {
    return Permissao(
      id: id ?? map['id'] as String,
      nome: map['nome'] as String,
      descricao: (map['descricao'] as String?) ?? '',
      menusAutorizados: (map['menusAutorizados'] as List<dynamic>?)?.cast<String>() ?? [],
      empresaId: map['empresaId'] as String,
      ativo: map['ativo'] as bool? ?? true,
      criadoEm: _parseDate(map['criadoEm']) ?? DateTime.now(),
      criadoPor: map['criadoPor'] as String,
    );
  }

  Permissao copyWith({
    String? id,
    String? nome,
    String? descricao,
    List<String>? menusAutorizados,
    String? empresaId,
    bool? ativo,
    DateTime? criadoEm,
    String? criadoPor,
  }) =>
      Permissao(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        menusAutorizados: menusAutorizados ?? this.menusAutorizados,
        empresaId: empresaId ?? this.empresaId,
        ativo: ativo ?? this.ativo,
        criadoEm: criadoEm ?? this.criadoEm,
        criadoPor: criadoPor ?? this.criadoPor,
      );
}
