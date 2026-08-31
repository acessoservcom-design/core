import '../models/estoque_analise.dart';
import '../utils/result.dart';

abstract class IEstoqueAnaliseRepository {
  Stream<Result<List<EstoqueAnalise>>> streamAnalise({String? classificacao});
  Stream<Result<List<EstoqueAnalise>>> streamAlertas();
  Future<Result<void>> atualizarClassificacao(
      String produtoId, String classificacao);
  Future<Result<AnaliseEstoqueConfig?>> buscarConfig();
  Future<Result<void>> salvarConfig(AnaliseEstoqueConfig config);
  Future<Result<List<VendaDiaria>>> buscarVendasDiarias(String produtoId,
      {int? periodoDias});
  Future<Result<void>> salvarPeriodoProduto(String produtoId, int periodoDias);
  Future<Result<Map<String, dynamic>>> buscarCiclos(String produtoId);
}
