class CicloData {
  final int cicloNumero;
  final DateTime? dataInicio;
  final DateTime? dataFim;
  final int totalVendido;
  final double velocidade;

  const CicloData({
    required this.cicloNumero,
    this.dataInicio,
    this.dataFim,
    this.totalVendido = 0,
    this.velocidade = 0,
  });

  factory CicloData.fromMap(Map<String, dynamic> map) {
    return CicloData(
      cicloNumero: (map['cicloNumero'] as num?)?.toInt() ?? 0,
      dataInicio: _parseTs(map['dataInicio']),
      dataFim: _parseTs(map['dataFim']),
      totalVendido: (map['totalVendido'] as num?)?.toInt() ?? 0,
      velocidade: (map['velocidade'] as num?)?.toDouble() ?? 0,
    );
  }

  static DateTime? _parseTs(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is Map) {
      if (value.containsKey('seconds')) {
        return DateTime.fromMillisecondsSinceEpoch((value['seconds'] as int) * 1000);
      }
      if (value.containsKey('_seconds')) {
        return DateTime.fromMillisecondsSinceEpoch((value['_seconds'] as int) * 1000);
      }
    }
    return null;
  }

  Map<String, dynamic> toMap() => {
        'cicloNumero': cicloNumero,
        'dataInicio': dataInicio?.toIso8601String(),
        'dataFim': dataFim?.toIso8601String(),
        'totalVendido': totalVendido,
        'velocidade': velocidade,
      };
}

class EstoqueAnalise {
  final String id;
  final String empresaId;
  final String lojaId;
  final String produtoId;
  final String produtoNome;
  final String classificacao;
  final String? classificacaoSugerida;
  final double velocidadeVenda;
  final int totalVendidoPeriodo;
  final int estoqueAtual;
  final int estoqueMinimo;
  final int estoqueDias;
  final int sugeridoCompra;
  final DateTime? ultimoCalculo;
  final DateTime? classificadoEm;
  final String? classificadoPor;
  final String? fornecedorId;
  final String? fornecedorNome;
  final bool alertaCritico;
  final int? periodoAnaliseDias;
  final double? mediaGlobal;
  final double? desvioPercentual;
  final bool alertaDesvio;
  final List<CicloData> ciclos;
  final String? tendencia;
  final double? variacaoPercentual;
  final int ciclosConsecutivos;
  final bool alarmeReclassificacao;

  const EstoqueAnalise({
    required this.id,
    required this.empresaId,
    required this.lojaId,
    required this.produtoId,
    required this.produtoNome,
    required this.classificacao,
    this.classificacaoSugerida,
    this.velocidadeVenda = 0,
    this.totalVendidoPeriodo = 0,
    this.estoqueAtual = 0,
    this.estoqueMinimo = 0,
    this.estoqueDias = 0,
    this.sugeridoCompra = 0,
    this.ultimoCalculo,
    this.classificadoEm,
    this.classificadoPor,
    this.fornecedorId,
    this.fornecedorNome,
    this.alertaCritico = false,
    this.periodoAnaliseDias,
    this.mediaGlobal,
    this.desvioPercentual,
    this.alertaDesvio = false,
    this.ciclos = const [],
    this.tendencia,
    this.variacaoPercentual,
    this.ciclosConsecutivos = 0,
    this.alarmeReclassificacao = false,
  });

  factory EstoqueAnalise.fromMap(Map<String, dynamic> map) {
    return EstoqueAnalise(
      id: map['id'] as String? ?? '',
      empresaId: map['empresaId'] as String? ?? '',
      lojaId: map['lojaId'] as String? ?? '',
      produtoId: map['produtoId'] as String? ?? '',
      produtoNome: map['produtoNome'] as String? ?? '',
      classificacao: map['classificacao'] as String? ?? 'C',
      classificacaoSugerida: map['classificacaoSugerida'] as String?,
      velocidadeVenda: (map['velocidadeVenda'] as num?)?.toDouble() ?? 0,
      totalVendidoPeriodo: (map['totalVendidoPeriodo'] as num?)?.toInt() ?? 0,
      estoqueAtual: (map['estoqueAtual'] as num?)?.toInt() ?? 0,
      estoqueMinimo: (map['estoqueMinimo'] as num?)?.toInt() ?? 0,
      estoqueDias: (map['estoqueDias'] as num?)?.toInt() ?? 0,
      sugeridoCompra: (map['sugeridoCompra'] as num?)?.toInt() ?? 0,
      ultimoCalculo: map['ultimoCalculo'] != null
          ? _parseTimestamp(map['ultimoCalculo'])
          : null,
      classificadoEm: map['classificadoEm'] != null
          ? _parseTimestamp(map['classificadoEm'])
          : null,
      classificadoPor: map['classificadoPor'] as String?,
      fornecedorId: map['fornecedorId'] as String?,
      fornecedorNome: map['fornecedorNome'] as String?,
      alertaCritico: map['alertaCritico'] as bool? ?? false,
      periodoAnaliseDias: (map['periodoAnaliseDias'] as num?)?.toInt(),
      mediaGlobal: (map['mediaGlobal'] as num?)?.toDouble(),
      desvioPercentual: (map['desvioPercentual'] as num?)?.toDouble(),
      alertaDesvio: map['alertaDesvio'] as bool? ?? false,
      ciclos: (map['ciclos'] as List<dynamic>?)
              ?.map((c) => CicloData.fromMap(Map<String, dynamic>.from(c as Map)))
              .toList() ??
          [],
      tendencia: map['tendencia'] as String?,
      variacaoPercentual: (map['variacaoPercentual'] as num?)?.toDouble(),
      ciclosConsecutivos: (map['ciclosConsecutivos'] as num?)?.toInt() ?? 0,
      alarmeReclassificacao: map['alarmeReclassificacao'] as bool? ?? false,
    );
  }

  static DateTime? _parseTimestamp(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is Map && value.containsKey('seconds')) {
      return DateTime.fromMillisecondsSinceEpoch((value['seconds'] as int) * 1000);
    }
    return null;
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'empresaId': empresaId,
        'lojaId': lojaId,
        'produtoId': produtoId,
        'produtoNome': produtoNome,
        'classificacao': classificacao,
        'classificacaoSugerida': classificacaoSugerida,
        'velocidadeVenda': velocidadeVenda,
        'totalVendidoPeriodo': totalVendidoPeriodo,
        'estoqueAtual': estoqueAtual,
        'estoqueMinimo': estoqueMinimo,
        'estoqueDias': estoqueDias,
        'sugeridoCompra': sugeridoCompra,
        'ultimoCalculo': ultimoCalculo?.toIso8601String(),
        'classificadoEm': classificadoEm?.toIso8601String(),
        'classificadoPor': classificadoPor,
        'fornecedorId': fornecedorId,
        'fornecedorNome': fornecedorNome,
        'alertaCritico': alertaCritico,
        'periodoAnaliseDias': periodoAnaliseDias,
        'mediaGlobal': mediaGlobal,
        'desvioPercentual': desvioPercentual,
        'alertaDesvio': alertaDesvio,
        'ciclos': ciclos.map((c) => c.toMap()).toList(),
        'tendencia': tendencia,
        'variacaoPercentual': variacaoPercentual,
        'ciclosConsecutivos': ciclosConsecutivos,
        'alarmeReclassificacao': alarmeReclassificacao,
      };

  EstoqueAnalise copyWith({
    String? classificacao,
    String? classificacaoSugerida,
    double? velocidadeVenda,
    int? totalVendidoPeriodo,
    int? estoqueAtual,
    int? estoqueMinimo,
    int? estoqueDias,
    int? sugeridoCompra,
    bool? alertaCritico,
    DateTime? classificadoEm,
    String? classificadoPor,
    int? periodoAnaliseDias,
    double? mediaGlobal,
    double? desvioPercentual,
    bool? alertaDesvio,
    List<CicloData>? ciclos,
    String? tendencia,
    double? variacaoPercentual,
    int? ciclosConsecutivos,
    bool? alarmeReclassificacao,
  }) =>
      EstoqueAnalise(
        id: id,
        empresaId: empresaId,
        lojaId: lojaId,
        produtoId: produtoId,
        produtoNome: produtoNome,
        classificacao: classificacao ?? this.classificacao,
        classificacaoSugerida: classificacaoSugerida ?? this.classificacaoSugerida,
        velocidadeVenda: velocidadeVenda ?? this.velocidadeVenda,
        totalVendidoPeriodo: totalVendidoPeriodo ?? this.totalVendidoPeriodo,
        estoqueAtual: estoqueAtual ?? this.estoqueAtual,
        estoqueMinimo: estoqueMinimo ?? this.estoqueMinimo,
        estoqueDias: estoqueDias ?? this.estoqueDias,
        sugeridoCompra: sugeridoCompra ?? this.sugeridoCompra,
        ultimoCalculo: ultimoCalculo,
        classificadoEm: classificadoEm ?? this.classificadoEm,
        classificadoPor: classificadoPor ?? this.classificadoPor,
        fornecedorId: fornecedorId,
        fornecedorNome: fornecedorNome,
        alertaCritico: alertaCritico ?? this.alertaCritico,
        periodoAnaliseDias: periodoAnaliseDias ?? this.periodoAnaliseDias,
        mediaGlobal: mediaGlobal ?? this.mediaGlobal,
        desvioPercentual: desvioPercentual ?? this.desvioPercentual,
        alertaDesvio: alertaDesvio ?? this.alertaDesvio,
        ciclos: ciclos ?? this.ciclos,
        tendencia: tendencia ?? this.tendencia,
        variacaoPercentual: variacaoPercentual ?? this.variacaoPercentual,
        ciclosConsecutivos: ciclosConsecutivos ?? this.ciclosConsecutivos,
        alarmeReclassificacao: alarmeReclassificacao ?? this.alarmeReclassificacao,
      );

  String get displayName =>
      produtoNome.isNotEmpty ? produtoNome : 'Produto #${produtoId.substring(0, produtoId.length > 6 ? 6 : produtoId.length)}';

  bool get isClassificacaoAlterada =>
      classificacaoSugerida != null && classificacao != classificacaoSugerida;
}

class AnaliseEstoqueConfig {
  final String? id;
  final String empresaId;
  final String lojaId;
  final int periodoAnaliseDias;
  final int diasEstoqueMinimo;
  final bool notificacaoAtiva;
  final int intervaloNotificacaoMinutos;
  final int ciclosMinimosReclassificacao;

  const AnaliseEstoqueConfig({
    this.id,
    required this.empresaId,
    required this.lojaId,
    this.periodoAnaliseDias = 30,
    this.diasEstoqueMinimo = 7,
    this.notificacaoAtiva = true,
    this.intervaloNotificacaoMinutos = 60,
    this.ciclosMinimosReclassificacao = 3,
  });

  factory AnaliseEstoqueConfig.fromMap(Map<String, dynamic> map) {
    return AnaliseEstoqueConfig(
      id: map['id'] as String?,
      empresaId: map['empresaId'] as String? ?? '',
      lojaId: map['lojaId'] as String? ?? '',
      periodoAnaliseDias: (map['periodoAnaliseDias'] as num?)?.toInt() ?? 30,
      diasEstoqueMinimo: (map['diasEstoqueMinimo'] as num?)?.toInt() ?? 7,
      notificacaoAtiva: map['notificacaoAtiva'] as bool? ?? true,
      intervaloNotificacaoMinutos: (map['intervaloNotificacaoMinutos'] as num?)?.toInt() ?? 60,
      ciclosMinimosReclassificacao: (map['ciclosMinimosReclassificacao'] as num?)?.toInt() ?? 3,
    );
  }

  Map<String, dynamic> toMap() => {
        'periodoAnaliseDias': periodoAnaliseDias,
        'diasEstoqueMinimo': diasEstoqueMinimo,
        'notificacaoAtiva': notificacaoAtiva,
        'intervaloNotificacaoMinutos': intervaloNotificacaoMinutos,
        'ciclosMinimosReclassificacao': ciclosMinimosReclassificacao,
      };
}

class VendaDiaria {
  final DateTime data;
  final int quantidade;

  const VendaDiaria({required this.data, required this.quantidade});

  factory VendaDiaria.fromMap(Map<String, dynamic> map) {
    return VendaDiaria(
      data: DateTime.parse(map['data'] as String),
      quantidade: (map['quantidade'] as num?)?.toInt() ?? 0,
    );
  }
}
