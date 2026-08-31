import '../models/produto.dart';
import '../utils/result.dart';

abstract class IProdutoRepository {
  Future<Result<Produto>> salvarCore(Produto produto);
  Future<Result<void>> atualizarEstoque(
      String produtoId, String lojaId, int novaQuantidade);
  Future<Result<void>> deletar(String id);
  Future<Result<Produto?>> buscarPorIdCore(String id);
  Future<Result<List<Produto>>> listarCore(String lojaId);
  Stream<Result<List<Produto>>> streamPorLojaCore(String lojaId);
  Future<Result<Produto?>> buscarPorCodigoBarrasCore(String codigo, String lojaId);
  Future<Result<Produto?>> buscarPorSkuCore(String sku, String lojaId);
  Future<Result<List<Produto>>> buscarPorNomeCore(String nome, String lojaId);
  Future<Result<List<Produto>>> buscarTodosCore(String lojaId);
}
