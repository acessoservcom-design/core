import '../models/fornecedor.dart';
import '../utils/result.dart';

abstract class IFornecedorRepository {
  Future<Result<void>> salvar(Fornecedor f);
  Future<Result<void>> deletar(String id);
  Stream<Result<List<Fornecedor>>> streamPorLoja(String lojaId);
  Future<Result<List<Fornecedor>>> buscarTodos(String lojaId);
  Future<Result<List<Fornecedor>>> buscarPorNome(String nome, String lojaId);
}
