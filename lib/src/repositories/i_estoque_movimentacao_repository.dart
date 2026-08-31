import '../models/estoque_movimentacao.dart';
import '../utils/result.dart';

abstract class IEstoqueMovimentacaoRepository {
  Future<Result<void>> salvar(EstoqueMovimentacao mov);
  Stream<Result<List<EstoqueMovimentacao>>> streamPorLoja(String lojaId);
  Future<Result<void>> deletar(String id);
}
