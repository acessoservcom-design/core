enum PedidoStatus {
  rascunho,
  atendimento,
  arte,
  arte_pronta,
  arte_aprovada,
  producao,
  costura,
  pronta_entrega,
  finalizado,
  cancelado,
  liberado
}

class Pedido {
  final String id;
  final String empresaId;
  final String lojaId;
  final String? lojaNome;
  final String? fornecedorId;
  final String? clienteId;
  final String? clienteNome;
  final String? clienteTelefone;
  final String? clienteEmail;
  final int codigo;
  final PedidoStatus status;
  final List<ItemPedido> itens;
  final List<String> imagensReferencia;
  final List<PagamentoPedido> pagamentos;
  final double desconto;
  final double frete;
  final double total;
  final double pago;
  final String? observacao;
  final DateTime? previsaoEntrega;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? finalizadoEm;
  final String? vendedorId;
  final String? vendedorNome;
  final List<String> lancamentoIds;
  final String? nfceChave;
  final String? nfceProtocolo;
  final String? nfceXml;
  final String? nfceStatus;
  final String? arteStatus;

  const Pedido({
    required this.id,
    required this.empresaId,
    required this.lojaId,
    this.lojaNome,
    this.fornecedorId,
    this.clienteId,
    this.clienteNome,
    this.clienteTelefone,
    this.clienteEmail,
    required this.codigo,
    this.status = PedidoStatus.rascunho,
    this.itens = const [],
    this.imagensReferencia = const [],
    this.pagamentos = const [],
    this.desconto = 0.0,
    this.frete = 0.0,
    this.total = 0.0,
    this.pago = 0.0,
    this.observacao,
    this.previsaoEntrega,
    required this.createdAt,
    this.updatedAt,
    this.finalizadoEm,
    this.vendedorId,
    this.vendedorNome,
    this.lancamentoIds = const [],
    this.nfceChave,
    this.nfceProtocolo,
    this.nfceXml,
    this.nfceStatus,
    this.arteStatus,
  });

  Pedido copyWith({
    String? id,
    String? empresaId,
    String? lojaId,
    String? lojaNome,
    String? fornecedorId,
    String? clienteId,
    String? clienteNome,
    String? clienteTelefone,
    String? clienteEmail,
    int? codigo,
    PedidoStatus? status,
    List<ItemPedido>? itens,
    List<String>? imagensReferencia,
    List<PagamentoPedido>? pagamentos,
    double? desconto,
    double? frete,
    double? total,
    double? pago,
    String? observacao,
    DateTime? previsaoEntrega,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? finalizadoEm,
    String? vendedorId,
    String? vendedorNome,
    List<String>? lancamentoIds,
    String? nfceChave,
    String? nfceProtocolo,
    String? nfceXml,
    String? nfceStatus,
    String? arteStatus,
  }) {
    return Pedido(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      lojaId: lojaId ?? this.lojaId,
      lojaNome: lojaNome ?? this.lojaNome,
      fornecedorId: fornecedorId ?? this.fornecedorId,
      clienteId: clienteId ?? this.clienteId,
      clienteNome: clienteNome ?? this.clienteNome,
      clienteTelefone: clienteTelefone ?? this.clienteTelefone,
      clienteEmail: clienteEmail ?? this.clienteEmail,
      codigo: codigo ?? this.codigo,
      status: status ?? this.status,
      itens: itens ?? this.itens,
      imagensReferencia: imagensReferencia ?? this.imagensReferencia,
      pagamentos: pagamentos ?? this.pagamentos,
      desconto: desconto ?? this.desconto,
      frete: frete ?? this.frete,
      total: total ?? this.total,
      pago: pago ?? this.pago,
      observacao: observacao ?? this.observacao,
      previsaoEntrega: previsaoEntrega ?? this.previsaoEntrega,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      finalizadoEm: finalizadoEm ?? this.finalizadoEm,
      vendedorId: vendedorId ?? this.vendedorId,
      vendedorNome: vendedorNome ?? this.vendedorNome,
      lancamentoIds: lancamentoIds ?? this.lancamentoIds,
      nfceChave: nfceChave ?? this.nfceChave,
      nfceProtocolo: nfceProtocolo ?? this.nfceProtocolo,
      nfceXml: nfceXml ?? this.nfceXml,
      nfceStatus: nfceStatus ?? this.nfceStatus,
      arteStatus: arteStatus ?? this.arteStatus,
    );
  }

  double get restante => total - pago;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'empresaId': empresaId,
      'lojaId': lojaId,
      'lojaNome': lojaNome,
      'fornecedorId': fornecedorId,
      'clienteId': clienteId,
      'clienteNome': clienteNome,
      'clienteTelefone': clienteTelefone,
      'clienteEmail': clienteEmail,
      'codigo': codigo,
      'status': status.name,
      'itens': itens.map((i) => i.toJson()).toList(),
      'imagensReferencia': imagensReferencia,
      'pagamentos': pagamentos.map((p) => p.toJson()).toList(),
      'desconto': desconto,
      'frete': frete,
      'total': total,
      'pago': pago,
      'observacao': observacao,
      'previsaoEntrega': previsaoEntrega?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'finalizadoEm': finalizadoEm?.toIso8601String(),
      'vendedorId': vendedorId,
      'vendedorNome': vendedorNome,
      'lancamentoIds': lancamentoIds,
      'nfceChave': nfceChave,
      'nfceProtocolo': nfceProtocolo,
      'nfceXml': nfceXml,
      'nfceStatus': nfceStatus,
      'arteStatus': arteStatus,
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as String,
      empresaId: json['empresaId'] as String,
      lojaId: json['lojaId'] as String,
      lojaNome: json['lojaNome'] as String?,
      fornecedorId: json['fornecedorId'] as String?,
      clienteId: json['clienteId'] as String?,
      clienteNome: json['clienteNome'] as String?,
      clienteTelefone: json['clienteTelefone'] as String?,
      clienteEmail: json['clienteEmail'] as String?,
      codigo: (json['codigo'] as num).toInt(),
      status: PedidoStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => PedidoStatus.rascunho,
      ),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemPedido.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagensReferencia: (json['imagensReferencia'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      pagamentos: (json['pagamentos'] as List<dynamic>)
          .map((e) => PagamentoPedido.fromJson(e as Map<String, dynamic>))
          .toList(),
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0.0,
      frete: (json['frete'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      pago: (json['pago'] as num?)?.toDouble() ?? 0.0,
      observacao: json['observacao'] as String?,
      previsaoEntrega: json['previsaoEntrega'] != null
          ? DateTime.parse(json['previsaoEntrega'] as String).toUtc()
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String).toUtc(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String).toUtc()
          : null,
      finalizadoEm: json['finalizadoEm'] != null
          ? DateTime.parse(json['finalizadoEm'] as String).toUtc()
          : null,
      vendedorId: json['vendedorId'] as String?,
      vendedorNome: json['vendedorNome'] as String?,
      lancamentoIds: (json['lancamentoIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      nfceChave: json['nfceChave'] as String?,
      nfceProtocolo: json['nfceProtocolo'] as String?,
      nfceXml: json['nfceXml'] as String?,
      nfceStatus: json['nfceStatus'] as String?,
      arteStatus: json['arteStatus'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pedido && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ItemPedido {
  final String id;
  final String produtoId;
  final String nome;
  final double quantidade;
  final double precoUnitario;
  final double total;
  final String personalizacao;
  final String? variacaoTipo;
  final String? variacaoValor;

  const ItemPedido({
    required this.id,
    required this.produtoId,
    required this.nome,
    required this.quantidade,
    required this.precoUnitario,
    required this.total,
    this.personalizacao = '',
    this.variacaoTipo,
    this.variacaoValor,
  });

  ItemPedido copyWith({
    String? id,
    String? produtoId,
    String? nome,
    double? quantidade,
    double? precoUnitario,
    double? total,
    String? personalizacao,
    String? variacaoTipo,
    String? variacaoValor,
  }) {
    return ItemPedido(
      id: id ?? this.id,
      produtoId: produtoId ?? this.produtoId,
      nome: nome ?? this.nome,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      total: total ?? this.total,
      personalizacao: personalizacao ?? this.personalizacao,
      variacaoTipo: variacaoTipo ?? this.variacaoTipo,
      variacaoValor: variacaoValor ?? this.variacaoValor,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'produtoId': produtoId,
      'nome': nome,
      'quantidade': quantidade,
      'precoUnitario': precoUnitario,
      'total': total,
      'personalizacao': personalizacao,
      if (variacaoTipo != null) 'variacaoTipo': variacaoTipo,
      if (variacaoValor != null) 'variacaoValor': variacaoValor,
    };
  }

  factory ItemPedido.fromJson(Map<String, dynamic> json) {
    return ItemPedido(
      id: json['id'] as String,
      produtoId: json['produtoId'] as String,
      nome: json['nome'] as String,
      quantidade: (json['quantidade'] as num).toDouble(),
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      personalizacao: json['personalizacao'] as String? ?? '',
      variacaoTipo: json['variacaoTipo'] as String?,
      variacaoValor: json['variacaoValor'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPedido &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PagamentoPedido {
  final String id;
  final String forma;
  final double valor;
  final int? parcelas;
  final String? comprovanteUrl;
  final DateTime data;
  final String? maquininha;

  const PagamentoPedido({
    required this.id,
    required this.forma,
    required this.valor,
    this.parcelas,
    this.comprovanteUrl,
    required this.data,
    this.maquininha,
  });

  PagamentoPedido copyWith({
    String? id,
    String? forma,
    double? valor,
    int? parcelas,
    String? comprovanteUrl,
    DateTime? data,
    String? maquininha,
  }) {
    return PagamentoPedido(
      id: id ?? this.id,
      forma: forma ?? this.forma,
      valor: valor ?? this.valor,
      parcelas: parcelas ?? this.parcelas,
      comprovanteUrl: comprovanteUrl ?? this.comprovanteUrl,
      data: data ?? this.data,
      maquininha: maquininha ?? this.maquininha,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'forma': forma,
      'valor': valor,
      if (parcelas != null) 'parcelas': parcelas,
      if (comprovanteUrl != null) 'comprovanteUrl': comprovanteUrl,
      'data': data.toIso8601String(),
      if (maquininha != null) 'maquininha': maquininha,
    };
  }

  factory PagamentoPedido.fromJson(Map<String, dynamic> json) {
    return PagamentoPedido(
      id: json['id'] as String,
      forma: json['forma'] as String,
      valor: (json['valor'] as num).toDouble(),
      parcelas: json['parcelas'] as int?,
      comprovanteUrl: json['comprovanteUrl'] as String?,
      data: DateTime.parse(json['data'] as String).toUtc(),
      maquininha: json['maquininha'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagamentoPedido &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}