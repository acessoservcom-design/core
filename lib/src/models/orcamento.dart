enum OrcamentoStatus { rascunho, enviado, aprovado, recusado, convertido, expirado }

class Orcamento {
  final String id;
  final String empresaId;
  final String lojaId;
  final String? funcionarioId;
  final String? clienteId;
  final int codigo;
  final OrcamentoStatus status;
  final List<OrcamentoItem> itens;
  final double desconto;
  final double total;
  final String? observacao;
  final DateTime validoAte;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Orcamento({
    required this.id,
    required this.empresaId,
    required this.lojaId,
    this.funcionarioId,
    this.clienteId,
    required this.codigo,
    this.status = OrcamentoStatus.rascunho,
    this.itens = const [],
    this.desconto = 0.0,
    this.total = 0.0,
    this.observacao,
    required this.validoAte,
    required this.createdAt,
    required this.updatedAt,
  });

  Orcamento copyWith({
    String? id,
    String? empresaId,
    String? lojaId,
    String? funcionarioId,
    String? clienteId,
    int? codigo,
    OrcamentoStatus? status,
    List<OrcamentoItem>? itens,
    double? desconto,
    double? total,
    String? observacao,
    DateTime? validoAte,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Orcamento(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      lojaId: lojaId ?? this.lojaId,
      funcionarioId: funcionarioId ?? this.funcionarioId,
      clienteId: clienteId ?? this.clienteId,
      codigo: codigo ?? this.codigo,
      status: status ?? this.status,
      itens: itens ?? this.itens,
      desconto: desconto ?? this.desconto,
      total: total ?? this.total,
      observacao: observacao ?? this.observacao,
      validoAte: validoAte ?? this.validoAte,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'empresaId': empresaId,
      'lojaId': lojaId,
      'funcionarioId': funcionarioId,
      'clienteId': clienteId,
      'codigo': codigo,
      'status': status.name,
      'itens': itens.map((i) => i.toJson()).toList(),
      'desconto': desconto,
      'total': total,
      'observacao': observacao,
      'validoAte': validoAte.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Orcamento.fromJson(Map<String, dynamic> json) {
    final statusStr = json['status'] as String? ?? 'rascunho';
    final status = OrcamentoStatus.values.firstWhere(
      (e) => e.name == statusStr,
      orElse: () => OrcamentoStatus.rascunho,
    );

    final itensRaw = json['itens'] as List<dynamic>? ?? [];
    final itens = itensRaw.map((e) {
      final m = Map<String, dynamic>.from(e as Map);
      return OrcamentoItem(
        id: m['id'] as String? ?? '',
        produtoId: m['produtoId'] as String? ?? '',
        nome: m['nome'] as String? ?? '',
        quantidade: (m['quantidade'] as num?)?.toDouble() ?? 1.0,
        precoUnitario: (m['precoUnitario'] as num?)?.toDouble() ?? 0.0,
        total: (m['total'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();

    return Orcamento(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      lojaId: json['lojaId'] as String,
      funcionarioId: json['funcionarioId'] as String?,
      clienteId: json['clienteId'] as String?,
      codigo: (json['codigo'] as num).toInt(),
      status: status,
      itens: itens,
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      observacao: json['observacao'] as String?,
      validoAte: DateTime.parse(json['validoAte'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Orcamento && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class OrcamentoItem {
  final String id;
  final String produtoId;
  final String nome;
  final double quantidade;
  final double precoUnitario;
  final double total;

  const OrcamentoItem({
    required this.id,
    required this.produtoId,
    required this.nome,
    required this.quantidade,
    required this.precoUnitario,
    required this.total,
  });

  OrcamentoItem copyWith({
    String? id,
    String? produtoId,
    String? nome,
    double? quantidade,
    double? precoUnitario,
    double? total,
  }) {
    return OrcamentoItem(
      id: id ?? this.id,
      produtoId: produtoId ?? this.produtoId,
      nome: nome ?? this.nome,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'produtoId': produtoId,
      'nome': nome,
      'quantidade': quantidade,
      'precoUnitario': precoUnitario,
      'total': total,
    };
  }

  factory OrcamentoItem.fromJson(Map<String, dynamic> json) {
    return OrcamentoItem(
      id: json['id'] as String,
      produtoId: json['produtoId'] as String,
      nome: json['nome'] as String,
      quantidade: (json['quantidade'] as num).toDouble(),
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrcamentoItem &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}