enum PapelFuncionario { admin, gerente, vendedor, caixa, fiscal, estoque }

class Funcionario {
  final String id;
  final String empresaId;
  final String? lojaId;
  final String nome;
  final String email;
  final String? celular;
  final String pinHash;
  final PapelFuncionario papel;
  final List<String> permissoesIds;
  final double comissaoPercentual;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Funcionario({
    required this.id,
    required this.empresaId,
    this.lojaId,
    required this.nome,
    required this.email,
    this.celular,
    required this.pinHash,
    this.papel = PapelFuncionario.vendedor,
    this.permissoesIds = const [],
    this.comissaoPercentual = 0.0,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Funcionario copyWith({
    String? id,
    String? empresaId,
    String? lojaId,
    String? nome,
    String? email,
    String? celular,
    String? pinHash,
    PapelFuncionario? papel,
    List<String>? permissoesIds,
    double? comissaoPercentual,
    bool? ativo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Funcionario(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      lojaId: lojaId ?? this.lojaId,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      celular: celular ?? this.celular,
      pinHash: pinHash ?? this.pinHash,
      papel: papel ?? this.papel,
      permissoesIds: permissoesIds ?? this.permissoesIds,
      comissaoPercentual: comissaoPercentual ?? this.comissaoPercentual,
      ativo: ativo ?? this.ativo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'lojaId': lojaId,
      'nome': nome,
      'email': email,
      'celular': celular,
      'pinHash': pinHash,
      'papel': papel.name,
      'permissoesIds': permissoesIds,
      'comissaoPercentual': comissaoPercentual,
      'ativo': ativo,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
  }

  factory Funcionario.fromJson(Map<String, dynamic> json) {
    return Funcionario(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      lojaId: json['lojaId'] as String?,
      nome: json['nome'] as String,
      email: json['email'] as String,
      celular: json['celular'] as String?,
      pinHash: json['pinHash'] as String,
      papel: PapelFuncionario.values.firstWhere((p) => p.name == json['papel']),
      permissoesIds: (json['permissoesIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      comissaoPercentual: (json['comissaoPercentual'] as num?)?.toDouble() ?? 0.0,
      ativo: json['ativo'] as bool? ?? true,
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
      other is Funcionario &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
