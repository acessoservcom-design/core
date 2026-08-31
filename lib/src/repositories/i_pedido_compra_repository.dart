import '../models/pedido_compra.dart';
import '../utils/result.dart';

abstract class IPedidoCompraRepository {
  Future<Result<void>> salvar(PedidoCompra pedido);
  Future<Result<void>> deletar(String id);
  Future<Result<void>> atualizarStatus(String id, String status);
  Stream<Result<List<PedidoCompra>>> streamPorLoja(String lojaId);
  Future<Result<List<PedidoCompra>>> buscarTodos(String lojaId);
}
