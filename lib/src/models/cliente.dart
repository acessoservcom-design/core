import 'dart:convert';

import 'safe_cast.dart';

class Endereco {
  final String cep;
  final String logradouro;
  final String numero;
  final String? complemento;
  final String bairro;
  final String cidade;
  final String estado;

  const Endereco({
    this.cep = '',
    this.logradouro = '',
    this.numero = '',
    this.complemento,
    this.bairro = '',
    this.cidade = '',
    this.estado = '',
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
    if (complemento != null) map['complemento'] = complemento;
    return map;
  }

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      cep: json['cep'] as String? ?? '',
      logradouro: json['logradouro'] as String? ?? '',
      numero: json['numero'] as String? ?? '',
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String? ?? '',
      cidade: json['cidade'] as String? ?? '',
      estado: json['estado'] as String? ?? '',
    );
  }
}

class Cliente {
  final String id;
  final String empresaId;
  final String nome;
  final String? cpfCnpj;
  final String? rg;
  final String? email;
  final String? telefone;
  final String? celular;
  final Endereco endereco;
  final double? limiteCredito;
  final String? tabelaPrecoId;
  final double debito;
  final List<String> lojaIds;
  final String? observacao;
  final DateTime? ultimaCompra;
  final int? pontos;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Cliente({
    required this.id,
    required this.empresaId,
    required this.nome,
    this.cpfCnpj,
    this.rg,
    this.email,
    this.telefone,
    this.celular,
    this.endereco = const Endereco(),
    this.limiteCredito,
    this.tabelaPrecoId,
    this.debito = 0.0,
    this.lojaIds = const [],
    this.observacao,
    this.ultimaCompra,
    this.pontos,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Cliente copyWith({
    String? id,
    String? empresaId,
    String? nome,
    String? cpfCnpj,
    String? rg,
    String? email,
    String? telefone,
    String? celular,
    Endereco? endereco,
    double? limiteCredito,
    String? tabelaPrecoId,
    double? debito,
    List<String>? lojaIds,
    String? observacao,
    DateTime? ultimaCompra,
    int? pontos,
    bool? ativo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cliente(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      nome: nome ?? this.nome,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      rg: rg ?? this.rg,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      celular: celular ?? this.celular,
      endereco: endereco ?? this.endereco,
      limiteCredito: limiteCredito ?? this.limiteCredito,
      tabelaPrecoId: tabelaPrecoId ?? this.tabelaPrecoId,
      debito: debito ?? this.debito,
      lojaIds: lojaIds ?? this.lojaIds,
      observacao: observacao ?? this.observacao,
      ultimaCompra: ultimaCompra ?? this.ultimaCompra,
      pontos: pontos ?? this.pontos,
      ativo: ativo ?? this.ativo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'nome': nome,
      'cpfCnpj': cpfCnpj,
      'rg': rg,
      'email': email,
      'telefone': telefone,
      'celular': celular,
      'endereco': endereco.toJson(),
      'limiteCredito': limiteCredito,
      'tabelaPrecoId': tabelaPrecoId,
      'debito': debito,
      'lojaIds': lojaIds,
      'observacao': observacao,
      'ultimaCompra': ultimaCompra != null ? _toIsoUtc(ultimaCompra!) : null,
      'pontos': pontos,
      'ativo': ativo,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
  }

  factory Cliente.fromJson(Map<String, dynamic> json) {
    // API MySQL: cpf/cnpj/limite_credito/loja_ids (snake) ou modelo camelCase
    final cpf = json['cpf'] as String?;
    final cnpj = json['cnpj'] as String?;
    final cpfCnpj = json['cpfCnpj'] as String? ?? cnpj ?? cpf;

    dynamic lojaIdsRaw = json['lojaIds'] ?? json['loja_ids'];
    List<String> lojaIds = [];
    if (lojaIdsRaw is List) {
      lojaIds = lojaIdsRaw.map((e) => e.toString()).toList();
    } else if (lojaIdsRaw is String && lojaIdsRaw.isNotEmpty) {
      try {
        final decoded = jsonDecode(lojaIdsRaw);
        if (decoded is List) {
          lojaIds = decoded.map((e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    Endereco endereco;
    if (json['endereco'] != null) {
      endereco = Endereco.fromJson(json['endereco'] as Map<String, dynamic>);
    } else {
      endereco = Endereco(
        cep: json['cep'] as String? ?? '',
        logradouro: json['logradouro'] as String? ?? '',
        numero: json['numero'] as String? ?? '',
        complemento: json['complemento'] as String?,
        bairro: json['bairro'] as String? ?? '',
        cidade: json['cidade'] as String? ?? '',
        estado: json['estado'] as String? ?? '',
      );
    }

    return Cliente(
      id: json['id'] as String? ?? '',
      empresaId: (json['empresaId'] ?? json['empresa_id']) as String? ?? '',
      nome: json['nome'] as String? ?? '',
      cpfCnpj: cpfCnpj,
      rg: json['rg'] as String?,
      email: json['email'] as String?,
      telefone: json['telefone'] as String?,
      celular: json['celular'] as String?,
      endereco: endereco,
      limiteCredito: safeNum(json['limiteCredito'] ?? json['limite_credito'])?.toDouble(),
      tabelaPrecoId: (json['tabelaPrecoId'] ?? json['tabela_preco_id']) as String?,
      debito: safeDouble(json['debito']),
      lojaIds: lojaIds,
      observacao: json['observacao'] as String?,
      ultimaCompra: safeDate(json['ultimaCompra'] ?? json['ultima_compra']),
      pontos: safeInt(json['pontos']),
      ativo: safeBool(json['ativo']),
      createdAt: safeDateUtc(json['createdAt'] ?? json['created_at']),
      updatedAt: safeDateUtc(json['updatedAt'] ?? json['updated_at']),
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
      other is Cliente && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
