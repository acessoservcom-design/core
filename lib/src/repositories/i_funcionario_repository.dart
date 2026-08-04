import '../models/funcionario.dart';
import '../utils/result.dart';

abstract class IFuncionarioRepository {
  Future<Result<List<Funcionario>>> listar(
    String empresaId, {
    String? lojaId,
    bool? ativos,
  });

  Future<Result<Funcionario?>> buscarPorId(String id);
  Future<Result<Funcionario?>> buscarPorEmail(String email, String empresaId);
  Future<Result<List<Funcionario>>> buscarAtivosPorLoja(String lojaId);
  Future<Result<Funcionario>> salvar(Funcionario funcionario);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> atualizarPin(String id, String novoPinHash);
}
