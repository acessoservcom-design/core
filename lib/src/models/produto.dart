import 'produto_variacao.dart';
import 'produto_tag.dart';
import 'fiscal_info.dart';

enum TipoProduto {
  fisico,
  encomenda,
  servico;

  String get label => switch (this) {
        fisico => 'Produto físico',
        encomenda => 'Sob encomenda',
        servico => 'Serviço',
      };

  bool get controlaEstoque => this == TipoProduto.fisico;

  static TipoProduto fromString(String? value) => switch (value) {
        'encomenda' => TipoProduto.encomenda,
        'servico' => TipoProduto.servico,
        _ => TipoProduto.fisico,
      };
}

class EstoquePorLoja {
  final int atual;
  final int minimo;
  final double precoVenda;
  final String? embalagem;

  const EstoquePorLoja({
    this.atual = 0,
    this.minimo = 0,
    this.precoVenda = 0.0,
    this.embalagem,
  });

  EstoquePorLoja copyWith({
    int? atual,
    int? minimo,
    double? precoVenda,
    String? embalagem,
  }) {
    return EstoquePorLoja(
      atual: atual ?? this.atual,
      minimo: minimo ?? this.minimo,
      precoVenda: precoVenda ?? this.precoVenda,
      embalagem: embalagem ?? this.embalagem,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'atual': atual,
      'minimo': minimo,
      'precoVenda': precoVenda,
    };
    if (embalagem != null) map['embalagem'] = embalagem;
    return map;
  }

  factory EstoquePorLoja.fromJson(Map<String, dynamic> json) {
    return EstoquePorLoja(
      atual: (json['atual'] as num).toInt(),
      minimo: (json['minimo'] as num).toInt(),
      precoVenda: (json['precoVenda'] as num).toDouble(),
      embalagem: json['embalagem'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstoquePorLoja &&
          runtimeType == other.runtimeType &&
          atual == other.atual &&
          minimo == other.minimo &&
          precoVenda == other.precoVenda &&
          embalagem == other.embalagem;

  @override
  int get hashCode =>
      atual.hashCode ^ minimo.hashCode ^ precoVenda.hashCode ^ embalagem.hashCode;
}

class Produto {
  final String id;
  final String nome;
  final String? codigoBarras;
  final String? sku;
  final TipoProduto tipo;
  final double? precoCusto;
  final double? precoPromocional;
  final String? marca;
  final String? categoriaId;
  final String? ncm;
  final String? cfop;
  final String? cest;
  final String? localizacao;
  final String? descricaoCurta;
  final double? comissaoPercentual;
  final String? fornecedorId;
  final bool ativo;
  final Map<String, EstoquePorLoja> estoquePorLoja;
  final List<String> imagens;
  final String? fotoPrincipal;
  final List<ProdutoVariacao> variacoes;
  final List<ProdutoTag> tags;
  final FiscalInfo fiscal;
  final PesosInfo pesos;
  final String? descricaoCompleta;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get controlaEstoque => tipo == TipoProduto.fisico;

  const Produto({
    required this.id,
    required this.nome,
    this.codigoBarras,
    this.sku,
    this.tipo = TipoProduto.fisico,
    this.precoCusto,
    this.precoPromocional,
    this.marca,
    this.categoriaId,
    this.ncm,
    this.cfop,
    this.cest,
    this.localizacao,
    this.descricaoCurta,
    this.comissaoPercentual,
    this.fornecedorId,
    this.ativo = true,
    this.estoquePorLoja = const {},
    this.imagens = const [],
    this.fotoPrincipal,
    this.variacoes = const [],
    this.tags = const [],
    FiscalInfo? fiscal,
    PesosInfo? pesos,
    this.descricaoCompleta,
    required this.createdAt,
    required this.updatedAt,
  })  : fiscal = fiscal ?? const FiscalInfo(),
        pesos = pesos ?? const PesosInfo();

  Produto copyWith({
    String? id,
    String? nome,
    String? codigoBarras,
    String? sku,
    TipoProduto? tipo,
    double? precoCusto,
    double? precoPromocional,
    String? marca,
    String? categoriaId,
    String? ncm,
    String? cfop,
    String? cest,
    String? localizacao,
    String? descricaoCurta,
    double? comissaoPercentual,
    String? fornecedorId,
    bool? ativo,
    Map<String, EstoquePorLoja>? estoquePorLoja,
    List<String>? imagens,
    String? fotoPrincipal,
    List<ProdutoVariacao>? variacoes,
    List<ProdutoTag>? tags,
    FiscalInfo? fiscal,
    PesosInfo? pesos,
    String? descricaoCompleta,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Produto(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      codigoBarras: codigoBarras ?? this.codigoBarras,
      sku: sku ?? this.sku,
      tipo: tipo ?? this.tipo,
      precoCusto: precoCusto ?? this.precoCusto,
      precoPromocional: precoPromocional ?? this.precoPromocional,
      marca: marca ?? this.marca,
      categoriaId: categoriaId ?? this.categoriaId,
      ncm: ncm ?? this.ncm,
      cfop: cfop ?? this.cfop,
      cest: cest ?? this.cest,
      localizacao: localizacao ?? this.localizacao,
      descricaoCurta: descricaoCurta ?? this.descricaoCurta,
      comissaoPercentual: comissaoPercentual ?? this.comissaoPercentual,
      fornecedorId: fornecedorId ?? this.fornecedorId,
      ativo: ativo ?? this.ativo,
      estoquePorLoja: estoquePorLoja ?? this.estoquePorLoja,
      imagens: imagens ?? this.imagens,
      fotoPrincipal: fotoPrincipal ?? this.fotoPrincipal,
      variacoes: variacoes ?? this.variacoes,
      tags: tags ?? this.tags,
      fiscal: fiscal ?? this.fiscal,
      pesos: pesos ?? this.pesos,
      descricaoCompleta: descricaoCompleta ?? this.descricaoCompleta,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'codigoBarras': codigoBarras,
      'sku': sku,
      'tipo': tipo.name,
      'precoCusto': precoCusto,
      'precoPromocional': precoPromocional,
      'marca': marca,
      'categoriaId': categoriaId,
      'ncm': ncm,
      'cfop': cfop,
      'cest': cest,
      'localizacao': localizacao,
      'descricaoCurta': descricaoCurta,
      'comissaoPercentual': comissaoPercentual,
      'fornecedorId': fornecedorId,
      'ativo': ativo,
      'estoquePorLoja':
          estoquePorLoja.map((k, v) => MapEntry(k, v.toJson())),
      'imagens': imagens,
      'fotoPrincipal': fotoPrincipal,
      'variacoes': variacoes.map((v) => v.toJson()).toList(),
      'tags': tags.map((t) => t.toJson()).toList(),
      'fiscal': fiscal.toJson(),
      'pesos': pesos.toJson(),
      'descricaoCompleta': descricaoCompleta,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as String,
      nome: json['nome'] as String,
      codigoBarras: json['codigoBarras'] as String?,
      sku: json['sku'] as String?,
      tipo: (json['tipo'] as String?) != null
          ? TipoProduto.values.firstWhere((e) => e.name == json['tipo'])
          : TipoProduto.fisico,
      precoCusto: (json['precoCusto'] as num?)?.toDouble(),
      precoPromocional: (json['precoPromocional'] as num?)?.toDouble(),
      marca: json['marca'] as String?,
      categoriaId: json['categoriaId'] as String?,
      ncm: json['ncm'] as String?,
      cfop: json['cfop'] as String?,
      cest: json['cest'] as String?,
      localizacao: json['localizacao'] as String?,
      descricaoCurta: json['descricaoCurta'] as String?,
      comissaoPercentual: (json['comissaoPercentual'] as num?)?.toDouble(),
      fornecedorId: json['fornecedorId'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      estoquePorLoja:
          (json['estoquePorLoja'] as Map<String, dynamic>?)?.map(
                (k, v) => MapEntry(k, EstoquePorLoja.fromJson(v as Map<String, dynamic>)),
              ) ??
              {},
      imagens: (json['imagens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      fotoPrincipal: json['fotoPrincipal'] as String?,
      variacoes: (json['variacoes'] as List<dynamic>?)
              ?.map((e) => ProdutoVariacao.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => ProdutoTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fiscal: json['fiscal'] != null
          ? FiscalInfo.fromJson(json['fiscal'] as Map<String, dynamic>)
          : const FiscalInfo(),
      pesos: json['pesos'] != null
          ? PesosInfo.fromJson(json['pesos'] as Map<String, dynamic>)
          : const PesosInfo(),
      descricaoCompleta: json['descricaoCompleta'] as String?,
      createdAt: _fromIsoUtc(json['createdAt'] as String),
      updatedAt: _fromIsoUtc(json['updatedAt'] as String),
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

  static DateTime _fromIsoUtc(String iso) {
    return DateTime.parse(iso).toUtc();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Produto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
