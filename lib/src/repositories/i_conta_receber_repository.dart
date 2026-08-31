import '../models/conta_receber.dart';
import '../utils/result.dart';

abstract class IContaReceberRepository {
  Future<Result<void>> salvar(ContaReceber conta);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> receber(String id, DateTime dataRecebimento);
  Stream<Result<List<ContaReceber>>> streamPorLoja(String lojaId);
  Future<Result<List<ContaReceber>>> buscarTodos(String lojaId);
}
