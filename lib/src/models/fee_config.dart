class FeeDefaults {
  static const double pix = 0.0;
  static const double debito = 1.86;

  static const Map<int, double> credito = {
    1: 2.50, 2: 3.00, 3: 3.50, 4: 4.00,
    5: 4.50, 6: 5.00, 7: 5.50, 8: 6.00,
    9: 6.50, 10: 7.00, 11: 7.50, 12: 8.00,
  };

  static const Map<int, double> antecipacao = {
    1: 1.79, 2: 2.20, 3: 2.20, 4: 2.20,
    5: 2.20, 6: 2.20, 7: 2.47, 8: 2.47,
    9: 2.47, 10: 2.47, 11: 2.47, 12: 2.47,
  };

  static const double infinityPix = 0.0;
  static const double infinityDebito = 0.75;

  static const Map<int, double> infinityCredito = {
    1: 2.69, 2: 3.94, 3: 4.46, 4: 4.98,
    5: 5.49, 6: 5.99, 7: 6.51, 8: 6.99,
    9: 7.51, 10: 7.99, 11: 8.49, 12: 8.99,
  };

  static const Map<int, double> infinityAntecipacao = {
    1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0,
    5: 0.0, 6: 0.0, 7: 0.0, 8: 0.0,
    9: 0.0, 10: 0.0, 11: 0.0, 12: 0.0,
  };
}

class FeeConfig {
  final double pix;
  final double debito;
  final Map<int, double> credito;
  final Map<int, double> antecipacao;

  const FeeConfig({
    required this.pix,
    required this.debito,
    required this.credito,
    required this.antecipacao,
  });

  factory FeeConfig.defaults() => FeeConfig(
        pix: FeeDefaults.pix,
        debito: FeeDefaults.debito,
        credito: FeeDefaults.credito,
        antecipacao: FeeDefaults.antecipacao,
      );

  factory FeeConfig.fromMap(Map<String, dynamic> map) {
    final creditoNested = map['credito'] as Map<String, dynamic>?;
    final antecipacaoNested = map['antecipacao'] as Map<String, dynamic>?;

    return FeeConfig(
      pix: (map['pix'] as num?)?.toDouble() ?? FeeDefaults.pix,
      debito: (map['debito'] as num?)?.toDouble() ?? FeeDefaults.debito,
      credito: {
        for (int i = 1; i <= 12; i++)
          i: creditoNested != null
              ? (creditoNested['${i}x'] as num?)?.toDouble() ?? FeeDefaults.credito[i]!
              : (map['${i}x'] as num?)?.toDouble() ?? FeeDefaults.credito[i]!,
      },
      antecipacao: {
        for (int i = 1; i <= 12; i++)
          i: antecipacaoNested != null
              ? (antecipacaoNested['${i}x'] as num?)?.toDouble() ??
                  FeeDefaults.antecipacao[i]!
              : (map['ant_${i}x'] as num?)?.toDouble() ??
                  FeeDefaults.antecipacao[i]!,
      },
    );
  }

  Map<String, dynamic> toMap() => {
        'pix': pix,
        'debito': debito,
        'credito': {
          for (final e in credito.entries) '${e.key}x': e.value,
        },
        'antecipacao': {
          for (final e in antecipacao.entries) '${e.key}x': e.value,
        },
      };

  FeeConfig copyWith({
    double? pix,
    double? debito,
    Map<int, double>? credito,
    Map<int, double>? antecipacao,
  }) =>
      FeeConfig(
        pix: pix ?? this.pix,
        debito: debito ?? this.debito,
        credito: credito ?? this.credito,
        antecipacao: antecipacao ?? this.antecipacao,
      );
}
