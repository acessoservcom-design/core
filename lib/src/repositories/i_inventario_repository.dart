import '../models/inventario.dart';
import '../utils/result.dart';

abstract class IInventarioRepository {
  Future<Result<void>> salvar(Inventario inventario);
  Stream<Result<List<Inventario>>> streamPorLoja(String lojaId);
  Future<Result<void>> deletar(String id);
  Future<Result<Inventario?>> buscarPorId(String id);
}
