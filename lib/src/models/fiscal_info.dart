class FiscalInfo {
  final String ncm;
  final String cfop;
  final String cest;
  final String origem;
  final double? icms;
  final double? ipi;
  final double? pis;
  final double? cofins;

  const FiscalInfo({
    this.ncm = '',
    this.cfop = '',
    this.cest = '',
    this.origem = '0',
    this.icms,
    this.ipi,
    this.pis,
    this.cofins,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'ncm': ncm,
      'cfop': cfop,
      'cest': cest,
      'origem': origem,
    };
    if (icms != null) map['icms'] = icms;
    if (ipi != null) map['ipi'] = ipi;
    if (pis != null) map['pis'] = pis;
    if (cofins != null) map['cofins'] = cofins;
    return map;
  }

  factory FiscalInfo.fromJson(Map<String, dynamic> json) {
    return FiscalInfo(
      ncm: json['ncm'] as String? ?? '',
      cfop: json['cfop'] as String? ?? '',
      cest: json['cest'] as String? ?? '',
      origem: json['origem'] as String? ?? '0',
      icms: (json['icms'] as num?)?.toDouble(),
      ipi: (json['ipi'] as num?)?.toDouble(),
      pis: (json['pis'] as num?)?.toDouble(),
      cofins: (json['cofins'] as num?)?.toDouble(),
    );
  }
}

class PesosInfo {
  final double pesoLiquido;
  final double pesoBruto;

  const PesosInfo({this.pesoLiquido = 0.0, this.pesoBruto = 0.0});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pesoLiquido': pesoLiquido,
      'pesoBruto': pesoBruto,
    };
  }

  factory PesosInfo.fromJson(Map<String, dynamic> json) {
    return PesosInfo(
      pesoLiquido: (json['pesoLiquido'] as num?)?.toDouble() ?? 0.0,
      pesoBruto: (json['pesoBruto'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
