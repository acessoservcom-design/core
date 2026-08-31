class EmitenteConfig {
  final String cnpj;
  final String xNome;
  final String xFant;
  final String xLgr;
  final String nro;
  final String xBairro;
  final String cMun;
  final String xMun;
  final String uf;
  final String cep;
  final String fone;
  final String ie;
  final String crt;

  const EmitenteConfig({
    this.cnpj = '',
    this.xNome = '',
    this.xFant = '',
    this.xLgr = '',
    this.nro = 'S/N',
    this.xBairro = '',
    this.cMun = '',
    this.xMun = '',
    this.uf = '',
    this.cep = '',
    this.fone = '',
    this.ie = '',
    this.crt = '3',
  });

  Map<String, dynamic> toMap() => {
        'emitenteCnpj': cnpj,
        'emitenteXNome': xNome,
        'emitenteXFant': xFant,
        'emitenteXLgr': xLgr,
        'emitenteNro': nro,
        'emitenteXBairro': xBairro,
        'emitenteCMun': cMun,
        'emitenteXMun': xMun,
        'emitenteUf': uf,
        'emitenteCep': cep,
        'emitenteFone': fone,
        'emitenteIe': ie,
        'emitenteCrt': crt,
      };

  factory EmitenteConfig.fromMap(Map<String, dynamic> map) => EmitenteConfig(
        cnpj: map['emitenteCnpj'] as String? ?? '',
        xNome: map['emitenteXNome'] as String? ?? '',
        xFant: map['emitenteXFant'] as String? ?? '',
        xLgr: map['emitenteXLgr'] as String? ?? '',
        nro: map['emitenteNro'] as String? ?? 'S/N',
        xBairro: map['emitenteXBairro'] as String? ?? '',
        cMun: map['emitenteCMun'] as String? ?? '',
        xMun: map['emitenteXMun'] as String? ?? '',
        uf: map['emitenteUf'] as String? ?? '',
        cep: map['emitenteCep'] as String? ?? '',
        fone: map['emitenteFone'] as String? ?? '',
        ie: map['emitenteIe'] as String? ?? '',
        crt: map['emitenteCrt'] as String? ?? '3',
      );

  EmitenteConfig copyWith({
    String? cnpj,
    String? xNome,
    String? xFant,
    String? xLgr,
    String? nro,
    String? xBairro,
    String? cMun,
    String? xMun,
    String? uf,
    String? cep,
    String? fone,
    String? ie,
    String? crt,
  }) =>
      EmitenteConfig(
        cnpj: cnpj ?? this.cnpj,
        xNome: xNome ?? this.xNome,
        xFant: xFant ?? this.xFant,
        xLgr: xLgr ?? this.xLgr,
        nro: nro ?? this.nro,
        xBairro: xBairro ?? this.xBairro,
        cMun: cMun ?? this.cMun,
        xMun: xMun ?? this.xMun,
        uf: uf ?? this.uf,
        cep: cep ?? this.cep,
        fone: fone ?? this.fone,
        ie: ie ?? this.ie,
        crt: crt ?? this.crt,
      );

  bool get isComplete =>
      cnpj.isNotEmpty &&
      xNome.isNotEmpty &&
      xFant.isNotEmpty &&
      xLgr.isNotEmpty &&
      xMun.isNotEmpty &&
      uf.isNotEmpty &&
      ie.isNotEmpty;
}