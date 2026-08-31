import '../models/caixa.dart';
import '../utils/result.dart';

abstract class ICaixaRepository {
  Future<Result<String?>> salvarTurno(CaixaTurno turno);
  Future<Result<CaixaTurno?>> buscarTurnoAberto(String lojaId, String terminalId);
  Future<Result<CaixaTurno?>> buscarTurnoAbertoDoUsuario(
    String lojaId,
    String operadorUid,
    String empresaId,
  );
  Stream<Result<List<CaixaTurno>>> streamTurnos(String lojaId, String empresaId);
  Future<Result<void>> salvarMovimento(CaixaMovimento mov);
  Stream<Result<List<CaixaMovimento>>> streamMovimentos(String turnoId);
  Future<Result<List<CaixaMovimento>>> buscarMovimentosDoTurno(String turnoId);
}
