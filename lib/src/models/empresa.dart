class Empresa {
  final String id;
  final String nome;
  final String? cnpj;
  final String? ie;
  final String? razaoSocial;
  final String? email;
  final String? telefone;
  final String? logradouro;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? cep;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Empresa({
    required this.id,
    required this.nome,
    this.cnpj,
    this.ie,
    this.razaoSocial,
    this.email,
    this.telefone,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });
}
