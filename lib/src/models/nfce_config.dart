class NfceConfig {
  final int serie;
  final int contadorAtual;
  final String? hostHomologacao;
  final String? hostProducao;
  final String? certificadoDigital;
  final int? ambiente;

  const NfceConfig({
    required this.serie,
    this.contadorAtual = 0,
    this.hostHomologacao,
    this.hostProducao,
    this.certificadoDigital,
    this.ambiente = 1,
  });

  NfceConfig copyWith({
    int? serie,
    int? contadorAtual,
    String? hostHomologacao,
    String? hostProducao,
    String? certificadoDigital,
    int? ambiente,
  }) {
    return NfceConfig(
      serie: serie ?? this.serie,
      contadorAtual: contadorAtual ?? this.contadorAtual,
      hostHomologacao: hostHomologacao ?? this.hostHomologacao,
      hostProducao: hostProducao ?? this.hostProducao,
      certificadoDigital: certificadoDigital ?? this.certificadoDigital,
      ambiente: ambiente ?? this.ambiente,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'serie': serie,
      'contadorAtual': contadorAtual,
      'hostHomologacao': hostHomologacao,
      'hostProducao': hostProducao,
      'certificadoDigital': certificadoDigital,
      'ambiente': ambiente,
    };
  }

  factory NfceConfig.fromJson(Map<String, dynamic> json) {
    return NfceConfig(
      serie: (json['serie'] as num).toInt(),
      contadorAtual: (json['contadorAtual'] as num?)?.toInt() ?? 0,
      hostHomologacao: json['hostHomologacao'] as String?,
      hostProducao: json['hostProducao'] as String?,
      certificadoDigital: json['certificadoDigital'] as String?,
      ambiente: (json['ambiente'] as num?)?.toInt() ?? 1,
    );
  }
}
