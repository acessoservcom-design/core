import '../models/estoque_movimentacao.dart';
import '../utils/result.dart';

abstract class IEstoqueRepository {
  Future<Result<void>> registrarMovimentacao(EstoqueMovimentacao mov);
  Future<Result<List<EstoqueMovimentacao>>> historico(
    String produtoId,
    String lojaId, {
    int? page,
    int? pageSize,
  });

  Future<Result<List<EstoqueMovimentacao>>> movimentosPendentes(String lojaId);
}
