import '../models/fluxo_caixa.dart';
import '../utils/result.dart';

abstract class IFluxoCaixaRepository {
  Future<Result<void>> salvar(FluxoCaixa fluxo);
  Future<Result<void>> deletar(String id);
  Stream<Result<List<FluxoCaixa>>> streamPorLoja(String lojaId);
  Future<Result<List<FluxoCaixa>>> buscarPorPeriodo(
      String lojaId, DateTime inicio, DateTime fim);
  Future<Result<double>> calcularSaldo(String lojaId);
}
