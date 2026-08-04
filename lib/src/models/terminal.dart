class Terminal {
  final String id;
  final String lojaId;
  final String empresaId;
  final String nome;
  final String? codigo;
  final int contadorNfce;
  final bool bloqueado;
  final String? motivoBloqueio;
  final DateTime? ultimoHeartbeat;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Terminal({
    required this.id,
    required this.lojaId,
    required this.empresaId,
    required this.nome,
    this.codigo,
    this.contadorNfce = 0,
    this.bloqueado = false,
    this.motivoBloqueio,
    this.ultimoHeartbeat,
    required this.createdAt,
    required this.updatedAt,
  });

  Terminal copyWith({
    String? id,
    String? lojaId,
    String? empresaId,
    String? nome,
    String? codigo,
    int? contadorNfce,
    bool? bloqueado,
    String? motivoBloqueio,
    DateTime? ultimoHeartbeat,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Terminal(
      id: id ?? this.id,
      lojaId: lojaId ?? this.lojaId,
      empresaId: empresaId ?? this.empresaId,
      nome: nome ?? this.nome,
      codigo: codigo ?? this.codigo,
      contadorNfce: contadorNfce ?? this.contadorNfce,
      bloqueado: bloqueado ?? this.bloqueado,
      motivoBloqueio: motivoBloqueio ?? this.motivoBloqueio,
      ultimoHeartbeat: ultimoHeartbeat ?? this.ultimoHeartbeat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
