import 'acbr_config.dart';
import 'emitente_config.dart';

class Loja {
  final String id;
  final String empresaId;
  final String nome;
  final String? empresaNome;
  final String? cnpj;
  final String? ie;
  final String? email;
  final String? telefone;
  final String? logradouro;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? cep;
  final bool matriz;
  final bool ativo;
  final List<String> modulos;
  final AcbrConfig nfce;
  final EmitenteConfig emitente;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Loja({
    required this.id,
    required this.empresaId,
    required this.nome,
    this.empresaNome,
    this.cnpj,
    this.ie,
    this.email,
    this.telefone,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.matriz = false,
    this.ativo = true,
    this.modulos = const [],
    this.nfce = const AcbrConfig(),
    this.emitente = const EmitenteConfig(),
    required this.createdAt,
    required this.updatedAt,
  });

  bool temModulo(String modulo) => modulos.contains(modulo);

  Loja copyWith({
    String? id,
    String? empresaId,
    String? nome,
    String? empresaNome,
    String? cnpj,
    String? ie,
    String? email,
    String? telefone,
    String? logradouro,
    String? numero,
    String? bairro,
    String? cidade,
    String? estado,
    String? cep,
    bool? matriz,
    bool? ativo,
    List<String>? modulos,
    AcbrConfig? nfce,
    EmitenteConfig? emitente,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Loja(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      nome: nome ?? this.nome,
      empresaNome: empresaNome ?? this.empresaNome,
      cnpj: cnpj ?? this.cnpj,
      ie: ie ?? this.ie,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
      matriz: matriz ?? this.matriz,
      ativo: ativo ?? this.ativo,
      modulos: modulos ?? this.modulos,
      nfce: nfce ?? this.nfce,
      emitente: emitente ?? this.emitente,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'nome': nome,
      'ativo': ativo,
      'modulos': modulos,
      ...nfce.toMap(),
      ...emitente.toMap(),
    };
    if (empresaNome != null && empresaNome!.isNotEmpty) {
      map['empresaNome'] = empresaNome;
    }
    if (cnpj != null && cnpj!.isNotEmpty) map['cnpj'] = cnpj;
    if (ie != null && ie!.isNotEmpty) map['ie'] = ie;
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
    return map;
  }

  factory Loja.fromMap(Map<String, dynamic> map, {String? docId}) {
    return Loja(
      id: map['id'] as String? ?? docId ?? '',
      empresaId: map['empresaId'] as String? ?? '',
      nome: map['nome'] as String? ?? '(sem nome)',
      empresaNome: map['empresaNome'] as String?,
      cnpj: map['cnpj'] as String?,
      ie: map['ie'] as String?,
      email: map['email'] as String?,
      telefone: map['telefone'] as String?,
      logradouro: map['logradouro'] as String?,
      numero: map['numero'] as String?,
      bairro: map['bairro'] as String?,
      cidade: map['cidade'] as String?,
      estado: map['estado'] as String?,
      cep: map['cep'] as String?,
      matriz: map['matriz'] as bool? ?? false,
      ativo: map['ativo'] as bool? ?? map['ativa'] as bool? ?? true,
      modulos: (map['modulos'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      nfce: AcbrConfig.fromMap(map),
      emitente: EmitenteConfig.fromMap(map),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Loja &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}