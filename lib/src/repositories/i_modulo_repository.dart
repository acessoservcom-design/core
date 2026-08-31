import '../models/modulo.dart';
import '../utils/result.dart';

abstract class IModuloRepository {
  Future<Result<Set<Modulo>>> buscarModulosAtivos();
  Future<Result<bool>> temAcesso(Modulo modulo);
  Future<Result<void>> ativarModulo(Modulo modulo);
  Future<Result<void>> desativarModulo(Modulo modulo);
}
