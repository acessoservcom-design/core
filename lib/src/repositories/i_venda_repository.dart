import '../models/venda.dart';
import '../utils/result.dart';

abstract class IVendaRepository {
  Future<Result<List<Venda>>> listar(
    String lojaId, {
    String? funcionarioId,
    DateTime? dataInicio,
    DateTime? dataFim,
    int? page,
    int? pageSize,
  });

  Future<Result<Venda?>> buscarPorId(String id);
  Future<Result<Venda?>> buscarPorCodigo(String lojaId, int codigo);
  Future<Result<Venda>> salvar(Venda venda);
  Future<Result<void>> cancelar(String vendaId, String? motivo);
  Future<Result<List<Venda>>> pendentesTransmissao(String lojaId);
}
