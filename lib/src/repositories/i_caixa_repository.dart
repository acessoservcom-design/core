import '../models/caixa.dart';
import '../utils/result.dart';

abstract class ICaixaRepository {
  Future<Result<CaixaTurno?>> buscarAberto(String lojaId, String terminalId);
  Future<Result<CaixaTurno>> abrir(CaixaTurno turno);
  Future<Result<CaixaTurno>> fechar(CaixaTurno turno);
  Future<Result<List<CaixaTurno>>> historico(
    String lojaId, {
    DateTime? dataInicio,
    DateTime? dataFim,
    int? page,
    int? pageSize,
  });

  Future<Result<void>> registrarMovimento(CaixaMovimento movimento);
  Future<Result<List<CaixaMovimento>>> movimentosDoTurno(String turnoId);
}
