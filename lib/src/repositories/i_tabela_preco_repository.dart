import '../models/tabela_preco.dart';
import '../utils/result.dart';

abstract class ITabelaPrecoRepository {
  Future<Result<void>> salvar(TabelaPreco t);
  Future<Result<void>> deletar(String id);
  Stream<Result<List<TabelaPreco>>> streamPorLoja(String lojaId);
  Future<Result<TabelaPreco?>> buscarPorId(String id);
}
