import '../models/entrada_mercadoria.dart';
import '../utils/result.dart';

abstract class IEntradaMercadoriaRepository {
  Future<Result<void>> salvar(EntradaMercadoria entrada);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> confirmarEntrada(String id);
  Stream<Result<List<EntradaMercadoria>>> streamPorLoja(String lojaId);
  Future<Result<List<EntradaMercadoria>>> buscarTodos(String lojaId);
}
