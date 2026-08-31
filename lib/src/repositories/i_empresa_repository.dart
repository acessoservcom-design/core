import '../models/empresa.dart';
import '../utils/result.dart';

abstract class IEmpresaRepository {
  Future<Result<List<Empresa>>> buscarTodas();
  Stream<Result<List<Empresa>>> streamTodas();
  Future<Result<String?>> salvar(Empresa empresa);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> criarLojaPadrao(String empresaId, String empresaNome);
}
