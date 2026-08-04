class Transportadora {
  final String id;
  final String empresaId;
  final String nome;
  final String? cnpj;
  final String? contatoNome;
  final String? contatoTelefone;
  final String? email;
  final String? cep;
  final String? logradouro;
  final String? numero;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? observacao;
  final bool ativo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Transportadora({
    required this.id,
    required this.empresaId,
    required this.nome,
    this.cnpj,
    this.contatoNome,
    this.contatoTelefone,
    this.email,
    this.cep,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.observacao,
    this.ativo = true,
    required this.createdAt,
    required this.updatedAt,
  });
}
