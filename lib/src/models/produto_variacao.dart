import 'safe_cast.dart';

class ProdutoVariacao {
  final String id;
  final String tipo;
  final String valor;
  final int? estoque;
  final double? preco;
  final double? precoCusto;

  const ProdutoVariacao({
    required this.id,
    required this.tipo,
    required this.valor,
    this.estoque,
    this.preco,
    this.precoCusto,
  });

  ProdutoVariacao copyWith({
    String? id,
    String? tipo,
    String? valor,
    int? estoque,
    double? preco,
    double? precoCusto,
  }) {
    return ProdutoVariacao(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      valor: valor ?? this.valor,
      estoque: estoque ?? this.estoque,
      preco: preco ?? this.preco,
      precoCusto: precoCusto ?? this.precoCusto,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'tipo': tipo,
      'valor': valor,
    };
    if (estoque != null) map['estoque'] = estoque;
    if (preco != null) map['preco'] = preco;
    if (precoCusto != null) map['precoCusto'] = precoCusto;
    return map;
  }

  factory ProdutoVariacao.fromJson(Map<String, dynamic> json) {
    return ProdutoVariacao(
      id: safeStr(json['id']),
      tipo: safeStr(json['tipo']),
      valor: safeStr(json['valor']),
      estoque: safeInt(json['estoque']),
      preco: safeDouble(json['preco']),
      precoCusto: safeDouble(json['precoCusto']),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdutoVariacao &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
