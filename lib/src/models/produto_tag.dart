class ProdutoTag {
  final String nome;
  final String? cor;

  const ProdutoTag({required this.nome, this.cor});

  ProdutoTag copyWith({String? nome, String? cor}) {
    return ProdutoTag(nome: nome ?? this.nome, cor: cor ?? this.cor);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{'nome': nome};
    if (cor != null) map['cor'] = cor;
    return map;
  }

  factory ProdutoTag.fromJson(Map<String, dynamic> json) {
    return ProdutoTag(
      nome: json['nome'] as String,
      cor: json['cor'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdutoTag &&
          runtimeType == other.runtimeType &&
          nome == other.nome;

  @override
  int get hashCode => nome.hashCode;
}
