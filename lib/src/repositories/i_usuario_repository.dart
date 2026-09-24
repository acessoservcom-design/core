import '../models/usuario.dart';
import '../utils/result.dart';

abstract class IUsuarioRepository {
  Future<Result<Usuario?>> buscarPorUid(String uid);
  Future<Result<Usuario?>> buscarAtual();
  Future<Result<String?>> salvar(Usuario usuario, {String? senha});
  Future<Result<void>> atualizarCampos(String uid, Map<String, dynamic> campos);
  Future<Result<void>> atualizarUltimoLogin();
  Stream<Result<List<Usuario>>> streamPorLoja(String lojaId);
  Stream<Result<List<Usuario>>> streamVendedores(String lojaId);
  Future<Result<List<Usuario>>> buscarTodos({String? lojaId});
  Future<Result<String>> uploadAvatar({
    required String usuarioId,
    String? filePath,
    List<int>? bytes,
    String? fileName,
  });
  Future<Result<void>> deletarImagem(String url);
}
