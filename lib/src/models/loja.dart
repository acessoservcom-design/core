class Loja {
  final String id;
  final String empresaId;
  final String nome;
  final String? cnpj;
  final String? ie;
  final String? email;
  final String? telefone;
  final String? logradouro;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? cep;
  final bool matriz;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Loja({
    required this.id,
    required this.empresaId,
    required this.nome,
    this.cnpj,
    this.ie,
    this.email,
    this.telefone,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.matriz = false,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });
}
