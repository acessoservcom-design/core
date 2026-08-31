class ProdutoImagem {
  final String? id;
  final String url;
  final int ordem;
  final bool principal;

  const ProdutoImagem({
    this.id,
    required this.url,
    this.ordem = 0,
    this.principal = false,
  });

  factory ProdutoImagem.fromMap(Map<String, dynamic> map) {
    return ProdutoImagem(
      url: map['url'] as String,
      ordem: map['ordem'] as int? ?? 0,
      principal: map['principal'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'ordem': ordem,
        'principal': principal,
      };

  ProdutoImagem copyWith({
    String? id,
    String? url,
    int? ordem,
    bool? principal,
  }) =>
      ProdutoImagem(
        id: id ?? this.id,
        url: url ?? this.url,
        ordem: ordem ?? this.ordem,
        principal: principal ?? this.principal,
      );
}
