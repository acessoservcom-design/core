import '../models/produto.dart';
import '../utils/result.dart';

abstract class IProdutoRepository {
  Future<Result<List<Produto>>> listar(
    String lojaId, {
    String? busca,
    int? page,
    int? pageSize,
  });

  Future<Result<Produto?>> buscarPorId(String id);
  Future<Result<Produto?>> buscarPorCodigoBarras(String codigo, String lojaId);
  Future<Result<Produto?>> buscarPorSku(String sku, String lojaId);
  Future<Result<Produto>> salvar(Produto produto);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> baixarEstoque(
      String produtoId, String lojaId, double quantidade);
  Future<Result<void>> reporEstoque(
      String produtoId, String lojaId, double quantidade);
}
