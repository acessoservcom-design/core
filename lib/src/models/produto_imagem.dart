import 'safe_cast.dart';

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
      url: safeStr(map['url']),
      ordem: safeInt(map['ordem'], 0),
      principal: safeBool(map['principal'], false),
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
