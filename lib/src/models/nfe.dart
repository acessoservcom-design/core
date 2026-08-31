enum NFeStatus {
  rascunho,
  validando,
  enviando,
  autorizada,
  denegada,
  cancelada,
  erro;

  String get label {
    switch (this) {
      case NFeStatus.rascunho:
        return 'Rascunho';
      case NFeStatus.validando:
        return 'Validando';
      case NFeStatus.enviando:
        return 'Enviando';
      case NFeStatus.autorizada:
        return 'Autorizada';
      case NFeStatus.denegada:
        return 'Denegada';
      case NFeStatus.cancelada:
        return 'Cancelada';
      case NFeStatus.erro:
        return 'Erro';
    }
  }

  String toJson() => name;

  static NFeStatus fromJson(String value) =>
      NFeStatus.values.firstWhere((e) => e.name == value, orElse: () => NFeStatus.rascunho);
}

class NFeItem {
  final String produtoId;
  final String nome;
  final String ncm;
  final String cfop;
  final String cest;
  final String unidade;
  final int quantidade;
  final double valorUnitario;
  final double valorTotal;
  final String cEAN;
  final String cEANTrib;
  final String uTrib;
  final double qTrib;
  final double vUnTrib;
  final int icmsOrigem;
  final String icmsCst;
  final double icmsAliquota;
  final double icmsBase;
  final double icmsValor;
  final double? ipiAliquota;
  final double? ipiValor;
  final double? pisAliquota;
  final double? pisValor;
  final double? cofinsAliquota;
  final double? cofinsValor;

  const NFeItem({
    required this.produtoId,
    required this.nome,
    this.ncm = '00000000',
    this.cfop = '5102',
    this.cest = '',
    this.unidade = 'UN',
    required this.quantidade,
    required this.valorUnitario,
    required this.valorTotal,
    this.cEAN = '',
    this.cEANTrib = '',
    this.uTrib = 'UN',
    this.qTrib = 0,
    this.vUnTrib = 0,
    this.icmsOrigem = 0,
    this.icmsCst = '00',
    this.icmsAliquota = 0,
    this.icmsBase = 0,
    this.icmsValor = 0,
    this.ipiAliquota,
    this.ipiValor,
    this.pisAliquota,
    this.pisValor,
    this.cofinsAliquota,
    this.cofinsValor,
  });

  Map<String, dynamic> toMap() => {
        'produtoId': produtoId,
        'nome': nome,
        'ncm': ncm,
        'cfop': cfop,
        if (cest.isNotEmpty) 'cest': cest,
        'unidade': unidade,
        'quantidade': quantidade,
        'valorUnitario': valorUnitario,
        'valorTotal': valorTotal,
        if (cEAN.isNotEmpty) 'cEAN': cEAN,
        if (cEANTrib.isNotEmpty) 'cEANTrib': cEANTrib,
        'uTrib': uTrib,
        'qTrib': qTrib,
        'vUnTrib': vUnTrib,
        'icmsOrigem': icmsOrigem,
        'icmsCst': icmsCst,
        'icmsAliquota': icmsAliquota,
        'icmsBase': icmsBase,
        'icmsValor': icmsValor,
        if (ipiAliquota != null) 'ipiAliquota': ipiAliquota,
        if (ipiValor != null) 'ipiValor': ipiValor,
        if (pisAliquota != null) 'pisAliquota': pisAliquota,
        if (pisValor != null) 'pisValor': pisValor,
        if (cofinsAliquota != null) 'cofinsAliquota': cofinsAliquota,
        if (cofinsValor != null) 'cofinsValor': cofinsValor,
      };

  factory NFeItem.fromMap(Map<String, dynamic> map) => NFeItem(
        produtoId: map['produtoId'] as String,
        nome: map['nome'] as String,
        ncm: map['ncm'] as String? ?? '00000000',
        cfop: map['cfop'] as String? ?? '5102',
        cest: map['cest'] as String? ?? '',
        unidade: map['unidade'] as String? ?? 'UN',
        quantidade: (map['quantidade'] as num?)?.toInt() ?? 0,
        valorUnitario: (map['valorUnitario'] as num?)?.toDouble() ?? 0,
        valorTotal: (map['valorTotal'] as num?)?.toDouble() ?? 0,
        cEAN: map['cEAN'] as String? ?? '',
        cEANTrib: map['cEANTrib'] as String? ?? '',
        uTrib: map['uTrib'] as String? ?? 'UN',
        qTrib: (map['qTrib'] as num?)?.toDouble() ?? 0,
        vUnTrib: (map['vUnTrib'] as num?)?.toDouble() ?? 0,
        icmsOrigem: (map['icmsOrigem'] as num?)?.toInt() ?? 0,
        icmsCst: map['icmsCst'] as String? ?? '00',
        icmsAliquota: (map['icmsAliquota'] as num?)?.toDouble() ?? 0,
        icmsBase: (map['icmsBase'] as num?)?.toDouble() ?? 0,
        icmsValor: (map['icmsValor'] as num?)?.toDouble() ?? 0,
        ipiAliquota: (map['ipiAliquota'] as num?)?.toDouble(),
        ipiValor: (map['ipiValor'] as num?)?.toDouble(),
        pisAliquota: (map['pisAliquota'] as num?)?.toDouble(),
        pisValor: (map['pisValor'] as num?)?.toDouble(),
        cofinsAliquota: (map['cofinsAliquota'] as num?)?.toDouble(),
        cofinsValor: (map['cofinsValor'] as num?)?.toDouble(),
      );

  NFeItem copyWith({
    String? produtoId,
    String? nome,
    String? ncm,
    String? cfop,
    String? cest,
    String? unidade,
    int? quantidade,
    double? valorUnitario,
    double? valorTotal,
    String? cEAN,
    String? cEANTrib,
    String? uTrib,
    double? qTrib,
    double? vUnTrib,
    int? icmsOrigem,
    String? icmsCst,
    double? icmsAliquota,
    double? icmsBase,
    double? icmsValor,
    double? ipiAliquota,
    double? ipiValor,
    double? pisAliquota,
    double? pisValor,
    double? cofinsAliquota,
    double? cofinsValor,
  }) =>
      NFeItem(
        produtoId: produtoId ?? this.produtoId,
        nome: nome ?? this.nome,
        ncm: ncm ?? this.ncm,
        cfop: cfop ?? this.cfop,
        cest: cest ?? this.cest,
        unidade: unidade ?? this.unidade,
        quantidade: quantidade ?? this.quantidade,
        valorUnitario: valorUnitario ?? this.valorUnitario,
        valorTotal: valorTotal ?? this.valorTotal,
        cEAN: cEAN ?? this.cEAN,
        cEANTrib: cEANTrib ?? this.cEANTrib,
        uTrib: uTrib ?? this.uTrib,
        qTrib: qTrib ?? this.qTrib,
        vUnTrib: vUnTrib ?? this.vUnTrib,
        icmsOrigem: icmsOrigem ?? this.icmsOrigem,
        icmsCst: icmsCst ?? this.icmsCst,
        icmsAliquota: icmsAliquota ?? this.icmsAliquota,
        icmsBase: icmsBase ?? this.icmsBase,
        icmsValor: icmsValor ?? this.icmsValor,
        ipiAliquota: ipiAliquota ?? this.ipiAliquota,
        ipiValor: ipiValor ?? this.ipiValor,
        pisAliquota: pisAliquota ?? this.pisAliquota,
        pisValor: pisValor ?? this.pisValor,
        cofinsAliquota: cofinsAliquota ?? this.cofinsAliquota,
        cofinsValor: cofinsValor ?? this.cofinsValor,
      );
}

class NFePagamento {
  final String forma;
  final double valor;
  final String? codigo;

  const NFePagamento({
    required this.forma,
    required this.valor,
    this.codigo,
  });

  Map<String, dynamic> toMap() => {
        'forma': forma,
        'valor': valor,
        if (codigo != null) 'codigo': codigo,
      };

  factory NFePagamento.fromMap(Map<String, dynamic> map) => NFePagamento(
        forma: map['forma'] as String,
        valor: (map['valor'] as num?)?.toDouble() ?? 0,
        codigo: map['codigo'] as String?,
      );
}

class NFeTransporte {
  final String? frete;
  final String? transportadoraNome;
  final String? transportadoraCnpj;
  final String? placa;
  final String? ufPlaca;

  const NFeTransporte({
    this.frete,
    this.transportadoraNome,
    this.transportadoraCnpj,
    this.placa,
    this.ufPlaca,
  });

  Map<String, dynamic> toMap() => {
        if (frete != null) 'frete': frete,
        if (transportadoraNome != null) 'transportadoraNome': transportadoraNome,
        if (transportadoraCnpj != null) 'transportadoraCnpj': transportadoraCnpj,
        if (placa != null) 'placa': placa,
        if (ufPlaca != null) 'ufPlaca': ufPlaca,
      };

  factory NFeTransporte.fromMap(Map<String, dynamic> map) => NFeTransporte(
        frete: map['frete'] as String?,
        transportadoraNome: map['transportadoraNome'] as String?,
        transportadoraCnpj: map['transportadoraCnpj'] as String?,
        placa: map['placa'] as String?,
        ufPlaca: map['ufPlaca'] as String?,
      );
}

class NFe {
  final String? id;
  final String empresaId;
  final String lojaId;
  final String? uid;

  // Identificação
  final String chave;
  final int numero;
  final int serie;
  final int cNF;
  final String modelo;
  bool get isNFCe => modelo == '65';
  final int ambiente;
  final String finalidade;
  final String tipoEmissao;

  // Destinatário
  final String? destinatarioNome;
  final String? destinatarioDoc;
  final String? destinatarioIE;
  final String? destinatarioEndereco;
  final String? destinatarioBairro;
  final String? destinatarioCidade;
  final String? destinatarioCMun;
  final String? destinatarioUF;
  final String? destinatarioCEP;
  final String? destinatarioFone;

  // Itens
  final List<NFeItem> itens;

  // Totais
  final double valorTotal;
  final double baseICMS;
  final double valorICMS;
  final double valorIPI;
  final double valorPIS;
  final double valorCOFINS;

  // Pagamento
  final List<NFePagamento> pagamentos;

  // Transporte
  final NFeTransporte transporte;

  // Informações adicionais
  final String? informacoesFisco;
  final String? informacoesContribuinte;

  // Status
  final NFeStatus status;
  final String? protocolo;
  final String? lote;
  final String? recibo;
  final String? xmlEnvio;
  final String? xmlRetorno;
  final String? xmlProcNFe;
  final String? erro;
  final String? danfeUrl;

  // Venda/Pedido vinculado
  final String? vendaId;
  final String? pedidoId;

  // Datas
  final DateTime dataEmissao;
  final DateTime? dataAutorizacao;
  final DateTime? dataCancelamento;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NFe({
    this.id,
    required this.empresaId,
    required this.lojaId,
    this.uid,
    required this.chave,
    required this.numero,
    required this.serie,
    required this.cNF,
    this.modelo = '55',
    this.ambiente = 1,
    this.finalidade = '1',
    this.tipoEmissao = '1',
    this.destinatarioNome,
    this.destinatarioDoc,
    this.destinatarioIE,
    this.destinatarioEndereco,
    this.destinatarioBairro,
    this.destinatarioCidade,
    this.destinatarioCMun,
    this.destinatarioUF,
    this.destinatarioCEP,
    this.destinatarioFone,
    this.itens = const [],
    this.valorTotal = 0,
    this.baseICMS = 0,
    this.valorICMS = 0,
    this.valorIPI = 0,
    this.valorPIS = 0,
    this.valorCOFINS = 0,
    this.pagamentos = const [],
    this.transporte = const NFeTransporte(),
    this.informacoesFisco,
    this.informacoesContribuinte,
    this.status = NFeStatus.rascunho,
    this.protocolo,
    this.lote,
    this.recibo,
    this.xmlEnvio,
    this.xmlRetorno,
    this.xmlProcNFe,
    this.erro,
    this.danfeUrl,
    this.vendaId,
    this.pedidoId,
    required this.dataEmissao,
    this.dataAutorizacao,
    this.dataCancelamento,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
        'empresaId': empresaId,
        'lojaId': lojaId,
        if (uid != null) 'uid': uid,
        'chave': chave,
        'numero': numero,
        'serie': serie,
        'cNF': cNF,
        'modelo': modelo,
        'ambiente': ambiente,
        'finalidade': finalidade,
        'tipoEmissao': tipoEmissao,
        if (destinatarioNome != null) 'destinatarioNome': destinatarioNome,
        if (destinatarioDoc != null) 'destinatarioDoc': destinatarioDoc,
        if (destinatarioIE != null) 'destinatarioIE': destinatarioIE,
        if (destinatarioEndereco != null) 'destinatarioEndereco': destinatarioEndereco,
        if (destinatarioBairro != null) 'destinatarioBairro': destinatarioBairro,
        if (destinatarioCidade != null) 'destinatarioCidade': destinatarioCidade,
        if (destinatarioCMun != null) 'destinatarioCMun': destinatarioCMun,
        if (destinatarioUF != null) 'destinatarioUF': destinatarioUF,
        if (destinatarioCEP != null) 'destinatarioCEP': destinatarioCEP,
        if (destinatarioFone != null) 'destinatarioFone': destinatarioFone,
        'itens': itens.map((i) => i.toMap()).toList(),
        'valorTotal': valorTotal,
        'baseICMS': baseICMS,
        'valorICMS': valorICMS,
        'valorIPI': valorIPI,
        'valorPIS': valorPIS,
        'valorCOFINS': valorCOFINS,
        'pagamentos': pagamentos.map((p) => p.toMap()).toList(),
        'transporte': transporte.toMap(),
        if (informacoesFisco != null) 'informacoesFisco': informacoesFisco,
        if (informacoesContribuinte != null)
          'informacoesContribuinte': informacoesContribuinte,
        'status': status.toJson(),
        if (protocolo != null) 'protocolo': protocolo,
        if (lote != null) 'lote': lote,
        if (recibo != null) 'recibo': recibo,
        if (xmlEnvio != null) 'xmlEnvio': xmlEnvio,
        if (xmlRetorno != null) 'xmlRetorno': xmlRetorno,
        if (xmlProcNFe != null) 'xmlProcNFe': xmlProcNFe,
        if (erro != null) 'erro': erro,
        if (danfeUrl != null) 'danfeUrl': danfeUrl,
        if (vendaId != null) 'vendaId': vendaId,
        if (pedidoId != null) 'pedidoId': pedidoId,
        'dataEmissao': dataEmissao.toIso8601String(),
        if (dataAutorizacao != null)
          'dataAutorizacao': dataAutorizacao!.toIso8601String(),
        if (dataCancelamento != null)
          'dataCancelamento': dataCancelamento!.toIso8601String(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    if (value is DateTime) return value;
    return null;
  }

  factory NFe.fromMap(Map<String, dynamic> map, {String? id}) => NFe(
        id: id ?? map['id'] as String?,
        empresaId: map['empresaId'] as String,
        lojaId: (map['lojaId'] as String? ?? '').isNotEmpty
            ? map['lojaId'] as String
            : map['empresaId'] as String,
        uid: map['uid'] as String?,
        chave: map['chave'] as String,
        numero: (map['numero'] as num?)?.toInt() ?? 0,
        serie: (map['serie'] as num?)?.toInt() ?? 0,
        cNF: (map['cNF'] as num?)?.toInt() ?? 0,
        modelo: map['modelo'] as String? ?? '55',
        ambiente: (map['ambiente'] as num?)?.toInt() ?? 1,
        finalidade: map['finalidade'] as String? ?? '1',
        tipoEmissao: map['tipoEmissao'] as String? ?? '1',
        destinatarioNome: map['destinatarioNome'] as String?,
        destinatarioDoc: map['destinatarioDoc'] as String?,
        destinatarioIE: map['destinatarioIE'] as String?,
        destinatarioEndereco: map['destinatarioEndereco'] as String?,
        destinatarioBairro: map['destinatarioBairro'] as String?,
        destinatarioCidade: map['destinatarioCidade'] as String?,
        destinatarioCMun: map['destinatarioCMun'] as String?,
        destinatarioUF: map['destinatarioUF'] as String?,
        destinatarioCEP: map['destinatarioCEP'] as String?,
        destinatarioFone: map['destinatarioFone'] as String?,
        itens: (map['itens'] as List<dynamic>?)
                ?.map((e) => NFeItem.fromMap(Map<String, dynamic>.from(e)))
                .toList() ??
            [],
        valorTotal: (map['valorTotal'] as num?)?.toDouble() ?? 0,
        baseICMS: (map['baseICMS'] as num?)?.toDouble() ?? 0,
        valorICMS: (map['valorICMS'] as num?)?.toDouble() ?? 0,
        valorIPI: (map['valorIPI'] as num?)?.toDouble() ?? 0,
        valorPIS: (map['valorPIS'] as num?)?.toDouble() ?? 0,
        valorCOFINS: (map['valorCOFINS'] as num?)?.toDouble() ?? 0,
        pagamentos: (map['pagamentos'] as List<dynamic>?)
                ?.map((e) => NFePagamento.fromMap(Map<String, dynamic>.from(e)))
                .toList() ??
            [],
        transporte: map['transporte'] is Map
            ? NFeTransporte.fromMap(Map<String, dynamic>.from(map['transporte']))
            : const NFeTransporte(),
        informacoesFisco: map['informacoesFisco'] as String?,
        informacoesContribuinte: map['informacoesContribuinte'] as String?,
        status: NFeStatus.fromJson(map['status'] as String? ?? 'rascunho'),
        protocolo: map['protocolo'] as String?,
        lote: map['lote'] as String?,
        recibo: map['recibo'] as String?,
        xmlEnvio: map['xmlEnvio'] as String?,
        xmlRetorno: map['xmlRetorno'] as String?,
        xmlProcNFe: map['xmlProcNFe'] as String?,
        erro: map['erro'] as String?,
        danfeUrl: map['danfeUrl'] as String?,
        vendaId: map['vendaId'] as String?,
        pedidoId: map['pedidoId'] as String?,
        dataEmissao: _parseDate(map['dataEmissao']) ?? DateTime.now(),
        dataAutorizacao: _parseDate(map['dataAutorizacao']),
        dataCancelamento: _parseDate(map['dataCancelamento']),
        createdAt: _parseDate(map['createdAt']) ?? DateTime.now(),
        updatedAt: _parseDate(map['updatedAt']) ?? DateTime.now(),
      );

  NFe copyWith({
    String? id,
    String? empresaId,
    String? lojaId,
    String? uid,
    String? chave,
    int? numero,
    int? serie,
    int? cNF,
    String? modelo,
    int? ambiente,
    String? finalidade,
    String? tipoEmissao,
    String? destinatarioNome,
    String? destinatarioDoc,
    String? destinatarioIE,
    String? destinatarioEndereco,
    String? destinatarioBairro,
    String? destinatarioCidade,
    String? destinatarioCMun,
    String? destinatarioUF,
    String? destinatarioCEP,
    String? destinatarioFone,
    List<NFeItem>? itens,
    double? valorTotal,
    double? baseICMS,
    double? valorICMS,
    double? valorIPI,
    double? valorPIS,
    double? valorCOFINS,
    List<NFePagamento>? pagamentos,
    NFeTransporte? transporte,
    String? informacoesFisco,
    String? informacoesContribuinte,
    NFeStatus? status,
    String? protocolo,
    String? lote,
    String? recibo,
    String? xmlEnvio,
    String? xmlRetorno,
    String? xmlProcNFe,
    String? erro,
    String? danfeUrl,
    String? vendaId,
    String? pedidoId,
    DateTime? dataEmissao,
    DateTime? dataAutorizacao,
    DateTime? dataCancelamento,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      NFe(
        id: id ?? this.id,
        empresaId: empresaId ?? this.empresaId,
        lojaId: lojaId ?? this.lojaId,
        uid: uid ?? this.uid,
        chave: chave ?? this.chave,
        numero: numero ?? this.numero,
        serie: serie ?? this.serie,
        cNF: cNF ?? this.cNF,
        modelo: modelo ?? this.modelo,
        ambiente: ambiente ?? this.ambiente,
        finalidade: finalidade ?? this.finalidade,
        tipoEmissao: tipoEmissao ?? this.tipoEmissao,
        destinatarioNome: destinatarioNome ?? this.destinatarioNome,
        destinatarioDoc: destinatarioDoc ?? this.destinatarioDoc,
        destinatarioIE: destinatarioIE ?? this.destinatarioIE,
        destinatarioEndereco: destinatarioEndereco ?? this.destinatarioEndereco,
        destinatarioBairro: destinatarioBairro ?? this.destinatarioBairro,
        destinatarioCidade: destinatarioCidade ?? this.destinatarioCidade,
        destinatarioCMun: destinatarioCMun ?? this.destinatarioCMun,
        destinatarioUF: destinatarioUF ?? this.destinatarioUF,
        destinatarioCEP: destinatarioCEP ?? this.destinatarioCEP,
        destinatarioFone: destinatarioFone ?? this.destinatarioFone,
        itens: itens ?? this.itens,
        valorTotal: valorTotal ?? this.valorTotal,
        baseICMS: baseICMS ?? this.baseICMS,
        valorICMS: valorICMS ?? this.valorICMS,
        valorIPI: valorIPI ?? this.valorIPI,
        valorPIS: valorPIS ?? this.valorPIS,
        valorCOFINS: valorCOFINS ?? this.valorCOFINS,
        pagamentos: pagamentos ?? this.pagamentos,
        transporte: transporte ?? this.transporte,
        informacoesFisco: informacoesFisco ?? this.informacoesFisco,
        informacoesContribuinte: informacoesContribuinte ?? this.informacoesContribuinte,
        status: status ?? this.status,
        protocolo: protocolo ?? this.protocolo,
        lote: lote ?? this.lote,
        recibo: recibo ?? this.recibo,
        xmlEnvio: xmlEnvio ?? this.xmlEnvio,
        xmlRetorno: xmlRetorno ?? this.xmlRetorno,
        xmlProcNFe: xmlProcNFe ?? this.xmlProcNFe,
        erro: erro ?? this.erro,
        danfeUrl: danfeUrl ?? this.danfeUrl,
        vendaId: vendaId ?? this.vendaId,
        pedidoId: pedidoId ?? this.pedidoId,
        dataEmissao: dataEmissao ?? this.dataEmissao,
        dataAutorizacao: dataAutorizacao ?? this.dataAutorizacao,
        dataCancelamento: dataCancelamento ?? this.dataCancelamento,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
