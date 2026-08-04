import '../models/cliente.dart';
import '../utils/result.dart';

abstract class IClienteRepository {
  Future<Result<List<Cliente>>> listar(
    String empresaId, {
    String? busca,
    String? lojaId,
    bool? ativos,
    int? page,
    int? pageSize,
  });

  Future<Result<Cliente?>> buscarPorId(String id);
  Future<Result<Cliente?>> buscarPorCpfCnpj(String cpfCnpj, String empresaId);
  Future<Result<Cliente>> salvar(Cliente cliente);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> atualizarDebito(String clienteId, double valor);
}
