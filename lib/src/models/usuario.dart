import 'role.dart';

class Usuario {
  final String uid;
  final String empresaId;
  final List<String> empresaIds;
  final String nome;
  final String email;
  final String? telefone;
  final Role role;
  final String lojaId;
  final bool ativo;
  final double? comissao;
  final List<String> permissoesIds;
  final List<String> lojasIds;
  final DateTime criadoEm;
  final DateTime? ultimoLogin;
  final String criadoPor;
  final String? avatarUrl;

  const Usuario({
    required this.uid,
    required this.empresaId,
    required this.empresaIds,
    required this.nome,
    required this.email,
    this.telefone,
    required this.role,
    required this.lojaId,
    this.ativo = true,
    this.comissao,
    this.permissoesIds = const [],
    this.lojasIds = const [],
    required this.criadoEm,
    this.ultimoLogin,
    required this.criadoPor,
    this.avatarUrl,
    this.isSuperAdmin = false,
  });

  final bool isSuperAdmin;

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'empresaId': empresaId,
        'empresaIds': empresaIds,
        'nome': nome,
        'email': email,
        if (telefone != null) 'telefone': telefone,
        'role': role.value,
        'lojaId': lojaId,
        'ativo': ativo,
        if (comissao != null) 'comissao': comissao,
        'permissoesIds': permissoesIds,
        'lojasIds': lojasIds,
        'criadoEm': criadoEm.toIso8601String(),
        if (ultimoLogin != null) 'ultimoLogin': ultimoLogin!.toIso8601String(),
        'criadoPor': criadoPor,
        if (avatarUrl != null) 'avatarUrl': avatarUrl,
        if (isSuperAdmin) 'isSuperAdmin': true,
      };

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    if (value is DateTime) return value;
    return null;
  }

  factory Usuario.fromMap(Map<String, dynamic> map, {String? id}) {
    final empresaId = map['empresaId'] is String && (map['empresaId'] as String).isNotEmpty
        ? map['empresaId'] as String
        : map['uid'] as String;
    final empresaIds = (map['empresaIds'] as List<dynamic>?)
            ?.cast<String>() ??
        (map['empresaId'] != null ? [empresaId] : []);
    return Usuario(
      uid: map['uid'] as String,
      empresaId: empresaId,
      empresaIds: empresaIds,
      nome: map['nome'] as String,
      email: map['email'] as String,
      telefone: map['telefone'] as String?,
      role: Role.fromString(map['role'] as String),
      lojaId: map['lojaId'] as String,
      ativo: map['ativo'] as bool? ?? true,
      comissao: (map['comissao'] as num?)?.toDouble(),
      permissoesIds: (map['permissoesIds'] as List<dynamic>?)?.cast<String>() ?? [],
      lojasIds: (map['lojasIds'] as List<dynamic>?)?.cast<String>() ?? [],
      criadoEm: _parseDate(map['criadoEm']) ?? DateTime.now(),
      ultimoLogin: _parseDate(map['ultimoLogin']),
      criadoPor: map['criadoPor'] as String,
      avatarUrl: map['avatarUrl'] as String?,
      isSuperAdmin: map['isSuperAdmin'] as bool? ?? false,
    );
  }

  Usuario copyWith({
    String? uid,
    String? empresaId,
    List<String>? empresaIds,
    String? nome,
    String? email,
    String? telefone,
    Role? role,
    String? lojaId,
    bool? ativo,
    double? comissao,
    List<String>? permissoesIds,
    List<String>? lojasIds,
    DateTime? criadoEm,
    DateTime? ultimoLogin,
    String? criadoPor,
    String? avatarUrl,
    bool? isSuperAdmin,
  }) =>
      Usuario(
        uid: uid ?? this.uid,
        empresaId: empresaId ?? this.empresaId,
        empresaIds: empresaIds ?? this.empresaIds,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        role: role ?? this.role,
        lojaId: lojaId ?? this.lojaId,
        ativo: ativo ?? this.ativo,
        comissao: comissao ?? this.comissao,
        permissoesIds: permissoesIds ?? this.permissoesIds,
        lojasIds: lojasIds ?? this.lojasIds,
        criadoEm: criadoEm ?? this.criadoEm,
        ultimoLogin: ultimoLogin ?? this.ultimoLogin,
        criadoPor: criadoPor ?? this.criadoPor,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      );
}
