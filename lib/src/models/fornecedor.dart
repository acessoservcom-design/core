class Fornecedor {
  final String id;
  final String empresaId;
  final String nome;
  final String? cnpj;
  final String? contatoNome;
  final String? contatoTelefone;
  final String? contatoEmail;
  final String? cep;
  final String? logradouro;
  final String? numero;
  final String? complemento;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? observacao;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Fornecedor({
    required this.id,
    required this.empresaId,
    required this.nome,
    this.cnpj,
    this.contatoNome,
    this.contatoTelefone,
    this.contatoEmail,
    this.cep,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado,
    this.observacao,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Fornecedor copyWith({
    String? id,
    String? empresaId,
    String? nome,
    String? cnpj,
    String? contatoNome,
    String? contatoTelefone,
    String? contatoEmail,
    String? cep,
    String? logradouro,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? estado,
    String? observacao,
    bool? ativo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Fornecedor(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      nome: nome ?? this.nome,
      cnpj: cnpj ?? this.cnpj,
      contatoNome: contatoNome ?? this.contatoNome,
      contatoTelefone: contatoTelefone ?? this.contatoTelefone,
      contatoEmail: contatoEmail ?? this.contatoEmail,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      observacao: observacao ?? this.observacao,
      ativo: ativo ?? this.ativo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'nome': nome,
      'ativo': ativo,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
    if (cnpj != null) map['cnpj'] = cnpj;
    if (contatoNome != null) map['contatoNome'] = contatoNome;
    if (contatoTelefone != null) map['contatoTelefone'] = contatoTelefone;
    if (contatoEmail != null) map['contatoEmail'] = contatoEmail;
    if (cep != null) map['cep'] = cep;
    if (logradouro != null) map['logradouro'] = logradouro;
    if (numero != null) map['numero'] = numero;
    if (complemento != null) map['complemento'] = complemento;
    if (bairro != null) map['bairro'] = bairro;
    if (cidade != null) map['cidade'] = cidade;
    if (estado != null) map['estado'] = estado;
    if (observacao != null) map['observacao'] = observacao;
    return map;
  }

  factory Fornecedor.fromJson(Map<String, dynamic> json) {
    return Fornecedor(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      nome: json['nome'] as String,
      cnpj: json['cnpj'] as String?,
      contatoNome: json['contatoNome'] as String?,
      contatoTelefone: json['contatoTelefone'] as String?,
      contatoEmail: json['contatoEmail'] as String?,
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String?,
      numero: json['numero'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      cidade: json['cidade'] as String?,
      estado: json['estado'] as String?,
      observacao: json['observacao'] as String?,
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
      other is Fornecedor &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
