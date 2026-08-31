import '../models/loja.dart';
import '../utils/result.dart';

abstract class ILojaRepository {
  Stream<Result<List<Loja>>> stream();
  Future<Result<List<Loja>>> buscarTodos();
  Stream<List<Loja>> streamLista();
  Future<Result<List<Loja>>> fetch();
  Future<List<Loja>> fetchLista();
  Future<Result<void>> salvar(Loja loja, {String? overrideEmpresaId});
  Future<Result<void>> deletar(String id);
  Future<Result<void>> atualizarModulos(String lojaId, List<String> modulos);
  Stream<List<Loja>> streamTodasEmpresas();
  Future<List<Loja>> fetchTodasEmpresas();
}
