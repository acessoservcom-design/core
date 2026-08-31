import '../models/cliente.dart';
import '../utils/result.dart';

abstract class IClienteRepository {
  Future<Result<void>> deletar(String id);
  Future<Result<Cliente?>> buscarPorIdCore(String id);
  Stream<Result<List<Cliente>>> streamTodosCore();
  Stream<Result<List<Cliente>>> streamPorLojaCore(String lojaId);
  Future<Result<List<Cliente>>> buscarTodosCore(String lojaId);
  Future<Result<List<Cliente>>> buscarPorNomeCore(String nome, String lojaId);
  Future<Result<List<Cliente>>> buscarPaginadoCore({
    required String lojaId,
    required int limite,
  });
  Future<Result<Cliente?>> buscarPorCpfCnpjCore(String cpfCnpj, String lojaId);
  Future<Result<void>> salvarCore(Cliente cliente);
  Future<Result<Cliente?>> buscarPorTelefoneCore(String telefone, String lojaId);
}
