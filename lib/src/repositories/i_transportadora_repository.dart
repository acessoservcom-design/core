import '../models/transportadora.dart';
import '../utils/result.dart';

abstract class ITransportadoraRepository {
  Future<Result<void>> salvar(Transportadora t);
  Future<Result<void>> deletar(String id);
  Stream<Result<List<Transportadora>>> streamPorLoja(String lojaId);
  Future<Result<List<Transportadora>>> buscarTodos(String lojaId);
}
