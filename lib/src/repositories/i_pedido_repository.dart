import '../models/pedido.dart';
import '../utils/result.dart';

abstract class IPedidoRepository {
  Future<Result<String>> gerarPid();
  Future<Result<void>> salvar(Pedido pedido);
  Future<Result<void>> deletar(String pedidoId);
  Future<Result<void>> atualizarStatus(String pedidoId, String status);
  Future<Result<void>> cancelar(String pedidoId);
  Stream<Result<List<Pedido>>> streamTodosCore({String? lojaId});
  Future<Result<List<Pedido>>> buscarPorClienteCore(String clienteId,
      String? lojaId);
  Future<Result<List<Pedido>>> buscarPendentesPorClienteCore(String clienteId,
      String? lojaId);
  Future<Result<void>> adicionarPagamento(
      String pedidoId, PagamentoPedido pagamento);
  Future<Result<void>> adicionarLancamentoId(
      String pedidoId, String lancamentoId);
  Future<Result<String>> uploadImagem({
    required String pedidoId,
    required String filePath,
    required String fileName,
    String subfolder,
  });
  Future<Result<void>> deletarImagem(String url);
  Future<Result<List<Pedido>>> buscarPorPeriodoCore(DateTime inicio, DateTime fim,
      {String? lojaId});
  Future<Result<void>> atualizarCampos(
      String pedidoId, Map<String, dynamic> campos);
  Future<Result<Pedido?>> buscarPorIdCore(String id);
  Future<Result<void>> salvarCore(Pedido pedido);
}
