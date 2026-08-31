class Pagamento {
  final String forma;
  final double valor;
  final int? parcelas;
  final String? bandeira;
  final String? maquininha;

  const Pagamento({
    required this.forma,
    required this.valor,
    this.parcelas,
    this.bandeira,
    this.maquininha,
  });

  factory Pagamento.fromMap(Map<String, dynamic> map) {
    return Pagamento(
      forma: map['forma'] as String,
      valor: (map['valor'] as num).toDouble(),
      parcelas: map['parcelas'] as int?,
      bandeira: map['bandeira'] as String?,
      maquininha: map['maquininha'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'forma': forma,
        'valor': valor,
        if (parcelas != null) 'parcelas': parcelas,
        if (bandeira != null) 'bandeira': bandeira,
        if (maquininha != null) 'maquininha': maquininha,
      };

  Pagamento copyWith({
    String? forma,
    double? valor,
    int? parcelas,
    String? bandeira,
    String? maquininha,
  }) =>
      Pagamento(
        forma: forma ?? this.forma,
        valor: valor ?? this.valor,
        parcelas: parcelas ?? this.parcelas,
        bandeira: bandeira ?? this.bandeira,
        maquininha: maquininha ?? this.maquininha,
      );
}
