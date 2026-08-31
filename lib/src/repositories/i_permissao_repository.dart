import '../models/permissao.dart';
import '../utils/result.dart';

abstract class IPermissaoRepository {
  Stream<Result<List<Permissao>>> streamTodos();
  Future<Result<List<Permissao>>> buscarTodos();
  Future<Result<void>> salvar(Permissao permissao);
  Future<Result<void>> deletar(String id);
}
