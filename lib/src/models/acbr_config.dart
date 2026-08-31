/// Configuração de conexão com o ACBrMonitor (emissão NFC-e).
///
/// Armazenada por loja em campos planos `nfce*` no documento da loja.
class AcbrConfig {
  final String host;
  final int port;
  final bool ativo;
  final int serie;
  final int? numeroInicial;

  const AcbrConfig({
    this.host = 'localhost',
    this.port = 3434,
    this.ativo = false,
    this.serie = 1,
    this.numeroInicial,
  });

  Map<String, dynamic> toMap() => {
        'nfceHost': host,
        'nfcePort': port,
        'nfceAtivo': ativo,
        'nfceSerie': serie,
        if (numeroInicial != null) 'nfceNumeroInicial': numeroInicial,
      };

  factory AcbrConfig.fromMap(Map<String, dynamic> map) => AcbrConfig(
        host: map['nfceHost'] as String? ?? 'localhost',
        port: map['nfcePort'] as int? ?? 3434,
        ativo: map['nfceAtivo'] as bool? ?? false,
        serie: map['nfceSerie'] as int? ?? 1,
        numeroInicial: map['nfceNumeroInicial'] as int?,
      );

  AcbrConfig copyWith({
    String? host,
    int? port,
    bool? ativo,
    int? serie,
    int? numeroInicial,
  }) =>
      AcbrConfig(
        host: host ?? this.host,
        port: port ?? this.port,
        ativo: ativo ?? this.ativo,
        serie: serie ?? this.serie,
        numeroInicial: numeroInicial ?? this.numeroInicial,
      );

  String get baseUrl => 'http://$host:$port';
}