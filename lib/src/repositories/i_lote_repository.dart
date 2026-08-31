import '../models/lote.dart';
import '../utils/result.dart';

abstract class ILoteRepository {
  Future<Result<void>> salvar(Lote lote);
  Stream<Result<List<Lote>>> streamPorLoja(String lojaId);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> utilizar(Lote lote, int quantidade);
}
