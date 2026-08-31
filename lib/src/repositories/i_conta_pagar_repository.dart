import '../models/conta_pagar.dart';
import '../utils/result.dart';

abstract class IContaPagarRepository {
  Future<Result<void>> salvar(ContaPagar conta);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> baixar(String id, DateTime dataPagamento);
  Stream<Result<List<ContaPagar>>> streamPorLoja(String lojaId);
  Future<Result<List<ContaPagar>>> buscarTodos(String lojaId);
}
