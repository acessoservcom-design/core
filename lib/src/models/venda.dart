enum VendaStatus { finalizada, cancelada, pendente_transmissao }

class Venda {
  final String id;
  final String lojaId;
  final String empresaId;
  final String terminalId;
  final String? funcionarioId;
  final String? clienteId;
  final int codigo;
  final List<ItemVenda> itens;
  final List<PagamentoVenda> pagamentos;
  final double desconto;
  final String? observacao;
  final VendaStatus status;
  final String? nfceChave;
  final String? nfceStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Venda({
    required this.id,
    required this.lojaId,
    required this.empresaId,
    required this.terminalId,
    this.funcionarioId,
    this.clienteId,
    required this.codigo,
    this.itens = const [],
    this.pagamentos = const [],
    this.desconto = 0.0,
    this.observacao,
    this.status = VendaStatus.pendente_transmissao,
    this.nfceChave,
    this.nfceStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  double get totalBruto => itens.fold(0.0, (s, i) => s + i.total);
  double get totalLiquido => totalBruto - desconto;
  double get totalPago => pagamentos.fold(0.0, (s, p) => s + p.valor);
  double get troco => (totalPago - totalLiquido).clamp(0.0, double.infinity);

  Venda copyWith({
    String? id,
    String? lojaId,
    String? empresaId,
    String? terminalId,
    String? funcionarioId,
    String? clienteId,
    int? codigo,
    List<ItemVenda>? itens,
    List<PagamentoVenda>? pagamentos,
    double? desconto,
    String? observacao,
    VendaStatus? status,
    String? nfceChave,
    String? nfceStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Venda(
      id: id ?? this.id,
      lojaId: lojaId ?? this.lojaId,
      empresaId: empresaId ?? this.empresaId,
      terminalId: terminalId ?? this.terminalId,
      funcionarioId: funcionarioId ?? this.funcionarioId,
      clienteId: clienteId ?? this.clienteId,
      codigo: codigo ?? this.codigo,
      itens: itens ?? this.itens,
      pagamentos: pagamentos ?? this.pagamentos,
      desconto: desconto ?? this.desconto,
      observacao: observacao ?? this.observacao,
      status: status ?? this.status,
      nfceChave: nfceChave ?? this.nfceChave,
      nfceStatus: nfceStatus ?? this.nfceStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'lojaId': lojaId,
      'empresaId': empresaId,
      'terminalId': terminalId,
      'funcionarioId': funcionarioId,
      'clienteId': clienteId,
      'codigo': codigo,
      'itens': itens.map((i) => i.toJson()).toList(),
      'pagamentos': pagamentos.map((p) => p.toJson()).toList(),
      'desconto': desconto,
      'observacao': observacao,
      'status': status.name,
      'nfceChave': nfceChave,
      'nfceStatus': nfceStatus,
      'createdAt': _toIsoUtc(createdAt),
      'updatedAt': _toIsoUtc(updatedAt),
    };
  }

  factory Venda.fromJson(Map<String, dynamic> json) {
    return Venda(
      id: json['id'] as String,
      lojaId: json['lojaId'] as String,
      empresaId: json['empresaId'] as String,
      terminalId: json['terminalId'] as String,
      funcionarioId: json['funcionarioId'] as String?,
      clienteId: json['clienteId'] as String?,
      codigo: (json['codigo'] as num).toInt(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemVenda.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagamentos: (json['pagamentos'] as List<dynamic>)
          .map((e) => PagamentoVenda.fromJson(e as Map<String, dynamic>))
          .toList(),
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0.0,
      observacao: json['observacao'] as String?,
      status: VendaStatus.values.firstWhere((s) => s.name == json['status']),
      nfceChave: json['nfceChave'] as String?,
      nfceStatus: json['nfceStatus'] as String?,
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
      other is Venda && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ItemVenda {
  final String id;
  final String produtoId;
  final String nome;
  final String? sku;
  final String? variacao;
  final double quantidade;
  final double precoUnitario;
  final double total;

  const ItemVenda({
    required this.id,
    required this.produtoId,
    required this.nome,
    this.sku,
    this.variacao,
    required this.quantidade,
    required this.precoUnitario,
    required this.total,
  });

  ItemVenda copyWith({
    String? id,
    String? produtoId,
    String? nome,
    String? sku,
    String? variacao,
    double? quantidade,
    double? precoUnitario,
    double? total,
  }) {
    return ItemVenda(
      id: id ?? this.id,
      produtoId: produtoId ?? this.produtoId,
      nome: nome ?? this.nome,
      sku: sku ?? this.sku,
      variacao: variacao ?? this.variacao,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'produtoId': produtoId,
      'nome': nome,
      'sku': sku,
      'variacao': variacao,
      'quantidade': quantidade,
      'precoUnitario': precoUnitario,
      'total': total,
    };
  }

  factory ItemVenda.fromJson(Map<String, dynamic> json) {
    return ItemVenda(
      id: json['id'] as String,
      produtoId: json['produtoId'] as String,
      nome: json['nome'] as String,
      sku: json['sku'] as String?,
      variacao: json['variacao'] as String?,
      quantidade: (json['quantidade'] as num).toDouble(),
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemVenda &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PagamentoVenda {
  final String id;
  final String forma;
  final double valor;
  final int? parcelas;
  final String? bandeira;

  const PagamentoVenda({
    required this.id,
    required this.forma,
    required this.valor,
    this.parcelas,
    this.bandeira,
  });

  PagamentoVenda copyWith({
    String? id,
    String? forma,
    double? valor,
    int? parcelas,
    String? bandeira,
  }) {
    return PagamentoVenda(
      id: id ?? this.id,
      forma: forma ?? this.forma,
      valor: valor ?? this.valor,
      parcelas: parcelas ?? this.parcelas,
      bandeira: bandeira ?? this.bandeira,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'forma': forma,
      'valor': valor,
    };
    if (parcelas != null) map['parcelas'] = parcelas;
    if (bandeira != null) map['bandeira'] = bandeira;
    return map;
  }

  factory PagamentoVenda.fromJson(Map<String, dynamic> json) {
    return PagamentoVenda(
      id: json['id'] as String,
      forma: json['forma'] as String,
      valor: (json['valor'] as num).toDouble(),
      parcelas: (json['parcelas'] as num?)?.toInt(),
      bandeira: json['bandeira'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagamentoVenda &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
