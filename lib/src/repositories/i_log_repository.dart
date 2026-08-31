import '../models/log_acao.dart';
import '../utils/result.dart';

abstract class ILogRepository {
  Future<Result<void>> salvar(LogAcao log);
  Stream<Result<List<LogAcao>>> streamPorLoja({
    String? uid,
    String? termo,
    int limite,
  });
  Future<Result<List<LogAcao>>> buscarPaginado({
    String? uid,
    int limite,
  });
  Future<Result<List<LogAcao>>> buscarPorData({
    required DateTime inicio,
    required DateTime fim,
    int limite,
  });
}
