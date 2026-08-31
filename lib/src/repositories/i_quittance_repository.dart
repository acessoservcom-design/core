import '../models/quittance.dart';
import '../utils/result.dart';

abstract class IQuittanceRepository {
  Future<Result<Quittance>> salvar(Quittance quittance);
  Future<Result<List<Quittance>>> buscarPorCliente(String clienteId);
}
