import '../models/log_acao.dart';
import '../utils/result.dart';

abstract class ILogRepository {
  Future<Result<void>> registrar(LogAcao log);
  Future<Result<List<LogAcao>>> listar(
    String empresaId, {
    String? funcionarioId,
    String? acao,
    DateTime? dataInicio,
    DateTime? dataFim,
    int? page,
    int? pageSize,
  });
}
