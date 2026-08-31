class Empresa {
  final String id;
  final String nome;
  final String? slug;
  final String? cnpj;
  final String? ie;
  final String? razaoSocial;
  final String? email;
  final String? telefone;
  final String? logradouro;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? cep;
  final String? observacao;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Empresa({
    required this.id,
    required this.nome,
    this.slug,
    this.cnpj,
    this.ie,
    this.razaoSocial,
    this.email,
    this.telefone,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.observacao,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Empresa copyWith({
    String? id,
    String? nome,
    String? slug,
    String? cnpj,
    String? ie,
    String? razaoSocial,
    String? email,
    String? telefone,
    String? logradouro,
    String? numero,
    String? bairro,
    String? cidade,
    String? estado,
    String? cep,
    String? observacao,
    bool? ativo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Empresa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      slug: slug ?? this.slug,
      cnpj: cnpj ?? this.cnpj,
      ie: ie ?? this.ie,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
      observacao: observacao ?? this.observacao,
      ativo: ativo ?? this.ativo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'ativo': ativo,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
    if (slug != null && slug!.isNotEmpty) map['slug'] = slug;
    if (cnpj != null && cnpj!.isNotEmpty) map['cnpj'] = cnpj;
    if (ie != null && ie!.isNotEmpty) map['ie'] = ie;
    if (razaoSocial != null && razaoSocial!.isNotEmpty) {
      map['razaoSocial'] = razaoSocial;
    }
    if (email != null && email!.isNotEmpty) map['email'] = email;
    if (telefone != null && telefone!.isNotEmpty) map['telefone'] = telefone;
    if (logradouro != null && logradouro!.isNotEmpty) {
      map['logradouro'] = logradouro;
    }
    if (numero != null && numero!.isNotEmpty) map['numero'] = numero;
    if (bairro != null && bairro!.isNotEmpty) map['bairro'] = bairro;
    if (cidade != null && cidade!.isNotEmpty) map['cidade'] = cidade;
    if (estado != null && estado!.isNotEmpty) map['estado'] = estado;
    if (cep != null && cep!.isNotEmpty) map['cep'] = cep;
    if (observacao != null && observacao!.isNotEmpty) {
      map['observacao'] = observacao;
    }
    return map;
  }

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      id: json['id'] as String,
      nome: json['nome'] as String? ?? '(sem nome)',
      slug: json['slug'] as String?,
      cnpj: json['cnpj'] as String?,
      ie: json['ie'] as String?,
      razaoSocial: json['razaoSocial'] as String?,
      email: json['email'] as String?,
      telefone: json['telefone'] as String?,
      logradouro: json['logradouro'] as String?,
      numero: json['numero'] as String?,
      bairro: json['bairro'] as String?,
      cidade: json['cidade'] as String?,
      estado: json['estado'] as String?,
      cep: json['cep'] as String?,
      observacao: json['observacao'] as String?,
      ativo: json['ativo'] as bool? ?? json['ativa'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] ?? json['criadaEm'] as String)
          .toUtc(),
      updatedAt: DateTime.parse(json['updatedAt'] ?? json['criadaEm'] as String)
          .toUtc(),
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
      other is Empresa &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}